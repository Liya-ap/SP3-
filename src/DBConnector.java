import java.sql.*;
import java.util.ArrayList;

public class DBConnector implements Database {
    // database URL
    private final String DB_URL = "jdbc:mysql://localhost/chill";
    //  Database credentials
    private final String USER = "root";
    private final String PASS = "Cph1998";

    /**
     * @return a String ArrayList with all the users
     * this method loads all the user in the chill.user database
     */
    @Override
    public ArrayList<String> loadAllUsers(String path) {
        ArrayList<String> listOfUsers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            //STEP 2: Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            //STEP 3: Execute a query
            String sql = "SELECT * FROM user";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);

            //STEP 4: Extract data from chill.movie
            while (rs.next()) {
                //Retrieve by column name
                //int userID = rs.getInt("userID");
                String user = rs.getString("name");
                String password = rs.getString("password");
                String userData = user + "," + password;
                listOfUsers.add(userData);
            }
            //STEP 5: Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                // nothing we can do
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        return listOfUsers;
    }

    /**
     * @param username the typed name
     * @param password the typed password
     * @return true if the writing-process succeeds, false if not
     */

    @Override
    public boolean saveUserData(String path, String username, String password) {
        boolean dataSaved = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            //STEP 1: Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            //STEP 2: Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            //STEP 3: Execute a query
            String sql = "INSERT INTO user (name,password) VALUES ('" + username + "', '" + password + "')";
            stmt = conn.prepareStatement(sql);
            //STEP 4: Extract data from chill.movie
            stmt.executeUpdate(sql);

            //STEP 5: Clean-up environment
            stmt.close();
            conn.close();

            dataSaved = true;
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                // nothing we can do
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        return dataSaved;
    }

    /**
     * @param mediaType either movie or series
     * @return an ArrayList of medias for either Series og Movie
     * This method is called to times from MainMenu(loadLibrary()) to make a complete AMedia-ArrayList containing Movies and Series
     */
    @Override
    public ArrayList<AMedia> loadAllMedias(String mediaType) {
        ArrayList<AMedia> listOfMedias = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            //STEP 1: Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            //STEP 2: Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            //STEP 3: Execute a query
            String sql = "";
            if (mediaType.equalsIgnoreCase("movie")) {
                sql = "SELECT * FROM movie";
            } else if (mediaType.equalsIgnoreCase("series")) {
                sql = "SELECT * FROM series";
            }
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);

            //STEP 4: Extract data from chill.movie
            while (rs.next()) {
                //Retrieve by column name
                String yearOfRelease;
                String releaseYear;
                String endingYear = "";
                String title = rs.getString("title");
                ArrayList<String> cat = loadCategories(rs);
                double rating = rs.getDouble("rating");
                //String categoriesinastring = cat.replace(',', '.');
                if (mediaType.equalsIgnoreCase("movie")) {
                    yearOfRelease = rs.getString("year");
                    AMedia mediaDataMovie = new Movie(title, yearOfRelease, rating, cat);

                    listOfMedias.add(mediaDataMovie);
                } else if (mediaType.equalsIgnoreCase("series")) {
                    String season = rs.getString("seasonsandepisodes");
                    //String[] seasons = season.split(",");
                    //String seasonsAndEpisodesInAString = cat.replace(',', '.');
                    String runningYears = rs.getString("year");
                    if (runningYears.contains("-")) {
                        String[] years = runningYears.split("-", -1);
                        releaseYear = years[0];
                        if (!years[1].isEmpty()) {
                            endingYear = years[1];
                        }
                    } else {
                        releaseYear = runningYears;
                    }

                    AMedia mediaDataSeries = new Series(title, releaseYear, rating, cat, endingYear, season);
                    listOfMedias.add(mediaDataSeries);
                }
            }
            //STEP 5: Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                // nothing we can do
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try

        return listOfMedias;
    }

    /**
     * Saves the given list of medias to the database
     * @param user The current user that's logged in
     * @param listType A watched or favorites list
     * @param listOfMedias List of all The medias that has to be saved
     * @return true or false depending on if list was successfully saved
     */
    @Override
    public boolean saveListData(User user, String listType, ArrayList<AMedia> listOfMedias) {
        boolean listIsSaved = false;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            int userID = getUserIDFromDB(conn, user);

            resetFavoritesTablesInDB(listType, conn);

            for (AMedia media : listOfMedias) {
                if (media.getType().equalsIgnoreCase("movie")) {
                    String sqlMovieId = "SELECT movieID FROM chill.movie WHERE title = ? AND year = ?;";
                    stmt = conn.prepareStatement(sqlMovieId);

                    stmt.setString(1, media.getTitle());
                    stmt.setString(2, media.getReleaseYear());
                    ResultSet rs = stmt.executeQuery();

                    int movieID = 0;
                    if (rs.next()) {
                        movieID = rs.getInt("movieID");
                    }

                    String sqlInsert;
                    if (listType.equalsIgnoreCase("watched")) {
                        sqlInsert = "INSERT IGNORE INTO chill.watchedmovies VALUES (?,?);";
                    } else {
                        sqlInsert = "INSERT IGNORE INTO chill.favoritemovies VALUES (?,?);";
                    }
                    stmt = conn.prepareStatement(sqlInsert);
                    stmt.setInt(1, userID);
                    stmt.setInt(2, movieID);
                    stmt.executeUpdate();

                    stmt.close();
                    rs.close();
                } else if (media.getType().equalsIgnoreCase("series")) {
                    String sqlSeriesID = "SELECT serieID FROM chill.series WHERE title = ?";
                    stmt = conn.prepareStatement(sqlSeriesID);

                    stmt.setString(1, media.getTitle());
                    ResultSet rs = stmt.executeQuery();

                    int serieID = 0;
                    if (rs.next()) {
                        serieID = rs.getInt("serieID");
                    }

                    String sqlInsert;
                    if (listType.equalsIgnoreCase("watched")) {
                        sqlInsert = "INSERT IGNORE INTO chill.watchedseries VALUES (?,?);";
                    } else {
                        sqlInsert = "INSERT IGNORE INTO chill.favoriteseries VALUES (?,?);";
                    }
                    stmt = conn.prepareStatement(sqlInsert);
                    stmt.setInt(1, userID);
                    stmt.setInt(2, serieID);
                    stmt.executeUpdate();

                    stmt.close();
                    rs.close();
                }
            }
            conn.close();
            listIsSaved = true;
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException ignored) {
            }// nothing we can do
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        return listIsSaved;
    }

    /**
     *
     * @param conn Connection with a specific database
     * @param user The user that's logged in
     * @return The current user's ID
     * @throws SQLException The method calling getUserIDFromDB catches this exception
     */
    private int getUserIDFromDB(Connection conn, User user) throws SQLException {
        String sql = "SELECT userID FROM chill.user WHERE name = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, user.getUsername());

        ResultSet rs = stmt.executeQuery();
        int userID = 0;
        if (rs.next()) {
            userID = rs.getInt("userID");
        }

        return userID;
    }

    /**
     * Deletes all content in the favorite-tables
     *
     * @param listType The type of list to delete content from
     * @param conn Connection with a specific database
     * @throws SQLException The method calling resetFavoritesTablesInDB catches this exception
     */
    private void resetFavoritesTablesInDB(String listType, Connection conn) throws SQLException {
        if (listType.equalsIgnoreCase("favorites")) {
            String setSafeUpdate = "SET SQL_SAFE_UPDATES = 0;";
            PreparedStatement stmt = conn.prepareStatement(setSafeUpdate);
            stmt.executeUpdate();

            String sqlDeleteAllMovies = "DELETE FROM chill.favoritemovies;";
            stmt = conn.prepareStatement(sqlDeleteAllMovies);
            stmt.executeUpdate();

            String sqlAlterID = "ALTER TABLE chill.favoritemovies AUTO_INCREMENT = 1; ";
            stmt = conn.prepareStatement(sqlAlterID);
            stmt.executeUpdate();

            String sqlDeleteAllSeries = "DELETE FROM chill.favoriteseries; ";
            stmt = conn.prepareStatement(sqlDeleteAllSeries);
            stmt.executeUpdate();

            sqlAlterID = "ALTER TABLE chill.favoriteseries AUTO_INCREMENT = 1; ";
            stmt = conn.prepareStatement(sqlAlterID);
            stmt.executeUpdate();

            setSafeUpdate = "SET SQL_SAFE_UPDATES = 1;";
            stmt = conn.prepareStatement(setSafeUpdate);
            stmt.executeUpdate();
        }
    }

    /**
     * Gets all the medias in the given listType from the database
     * @param user The user that's logged in
     * @param listType either a favorites or watched list
     * @return ArrayList of all medias in given listType loaded from the database
     */
    @Override
    public ArrayList<AMedia> loadListData(User user, String listType) {
        ArrayList<AMedia> medias = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            int userID = getUserIDFromDB(conn, user);

            if (listType.equalsIgnoreCase("watched")) {
                String sqlMovieData = "SELECT title, year, categories, rating FROM chill.movie join chill.watchedmovies ON watchedmovies.movieID = movie.movieID WHERE userID = ?;;";
                stmt = conn.prepareStatement(sqlMovieData);
                stmt.setInt(1, userID);
                ResultSet rs = stmt.executeQuery();
                ArrayList<AMedia> movies = getMoviesFromDB(rs);
                medias.addAll(movies);

                String sqlSeriesData = "SELECT title, year, categories, rating, seasonsandepisodes FROM chill.series join chill.watchedseries ON watchedseries.serieID = series.serieID WHERE userID = ?;";
                stmt = conn.prepareStatement(sqlSeriesData);
                stmt.setInt(1, userID);
                rs = stmt.executeQuery();
                ArrayList<AMedia> series = getSeriesFromDB(rs);
                medias.addAll(series);

                rs.close();
                stmt.close();
            } else if (listType.equalsIgnoreCase("favorites")) {
                String sqlMovieData = "SELECT title, year, categories, rating FROM chill.movie join chill.favoritemovies ON favoritemovies.movieID = movie.movieID WHERE userID = ?;";
                stmt = conn.prepareStatement(sqlMovieData);
                stmt.setInt(1, userID);
                ResultSet rs = stmt.executeQuery();
                ArrayList<AMedia> movie = getMoviesFromDB(rs);
                medias.addAll(movie);

                String sqlSeriesData = "SELECT title, year, categories, rating, seasonsandepisodes FROM chill.series join chill.favoriteseries ON favoriteseries.serieID = series.serieID WHERE userID = ?;";
                stmt = conn.prepareStatement(sqlSeriesData);
                stmt.setInt(1, userID);
                rs = stmt.executeQuery();
                ArrayList<AMedia> series = getSeriesFromDB(rs);
                medias.addAll(series);

                rs.close();
                stmt.close();
            }
            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException ignored) {
            }// nothing we can do
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try

        return medias;
    }

    /**
     * Gets data for a series from the database and a Series object is created
     * and added to an arraylist
     * @param rs The ResultSet from the Query executed
     * @return ArrayList of AMedia objects
     * @throws SQLException The method calling getSeriesFromDB catches this exception
     */
    private ArrayList<AMedia> getSeriesFromDB(ResultSet rs) throws SQLException {
        ArrayList<AMedia> series = new ArrayList<>();
        while (rs.next()) {
            String title = rs.getString("title");

            String runningYears = rs.getString("year");
            String releaseYear = "";
            String endingYear = "";
            if (runningYears.contains("-")) {
                String[] years = runningYears.split("-");
                releaseYear = years[0];
                endingYear = years[1];
            }

            ArrayList<String> categories = loadCategories(rs);
            double rating = rs.getDouble("rating");
            String seasonsData = rs.getString("seasonsandepisodes");

            series.add(new Series(title, releaseYear, rating, categories, endingYear, seasonsData));
        }
        return series;
    }

    /**
     * Gets data for a movie from the database and a Movie object is created
     * and added to an arraylist
     * @param rs  The ResultSet from the Query executed
     * @return ArrayList of AMedia objects
     * @throws SQLException The method calling getMoviesFromDB catches this exception
     */
    private ArrayList<AMedia> getMoviesFromDB(ResultSet rs) throws SQLException {
        ArrayList<AMedia> movie = new ArrayList<>();
        while (rs.next()) {
            String title = rs.getString("title");
            String year = rs.getString("year");
            ArrayList<String> categories = loadCategories(rs);
            double rating = rs.getDouble("rating");

            movie.add(new Movie(title, year, rating, categories));
        }
        return movie;
    }

    /**
     * Gets a String from the database table and splits the categories up
     * into their own Strings and is added to an array list
     * @param rs The ResultSet from the Query executed
     * @return ArrayList of Strings containing the categories
     * @throws SQLException The method calling loadCategories catches this exception
     */
    private ArrayList<String> loadCategories(ResultSet rs) throws SQLException {
        String c = rs.getString("categories");
        ArrayList<String> categories = new ArrayList<>();
        String[] category = c.split("[.,]+");
        for (String s : category) {
            categories.add(s.trim());
        }
        return categories;
    }
}
