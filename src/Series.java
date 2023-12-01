import java.util.ArrayList;
import java.util.Objects;

public class Series extends AMedia {
    private String endingYear;
    private ArrayList<Season> allSeasons;
    private ArrayList<String> seasonsAndEpisodes;

    public Series(String data) {
        super(data);
    }
    public Series(String title, String releaseYear, double rating, ArrayList<String> categories, String endingYear, String seasonsData) {
        super(title,releaseYear,rating,categories);
        this.endingYear = endingYear;
        setSeasonsAndEpisodes(seasonsData);
        loadSeasons();
    }

    /**
     * Splits all the data that's passed as a String when creating a Series object.
     * Sets all the information for the Series object.
     */
    @Override
    public void setAllInformation() {
        ArrayList<String> allCategories = new ArrayList<>();

        String releaseYear = "";
        String endingYear = "";
        String[] row = getData().split(";");
        String title = row[0].trim();

        if (row[1].trim().length() == 4) {
            releaseYear = row[1].trim();
            endingYear = releaseYear;
        } else if (row[1].trim().length() == 5) {
            releaseYear = row[1].trim().substring(0, 4);
            endingYear = "-";
        } else if (row[1].trim().length() >= 9) {
            String[] year = row[1].split("-");
            releaseYear = year[0].trim();
            endingYear = year[1].trim();
        }

        String categoriesData = row[2].trim();
        String[] seriesCategory = categoriesData.split(",");

        for (String category : seriesCategory) {
            allCategories.add(category.trim());
        }

        String ratingData = row[3].trim().replace(',', '.');
        double rating = Double.parseDouble(ratingData);

        String seasonsData = row[4].trim();
        setSeasonsAndEpisodes(seasonsData);

        super.setTitle(title);
        super.setReleaseYear(releaseYear);
        super.setRating(rating);
        super.setCategories(allCategories);
        this.endingYear = endingYear;
        loadSeasons();
    }

    /**
     * Splits the data that's given into a String ex. "1-13"
     * and adds to an arraylist
     * @param seasonsData String containing all data for a series seasons and episodes
     */
    private void setSeasonsAndEpisodes(String seasonsData) {
        seasonsAndEpisodes = new ArrayList<>();
        String[] seriesSeasons = seasonsData.split("[.,]+");

        for (String season : seriesSeasons) {
            seasonsAndEpisodes.add(season.trim());
        }
    }

    /**
     * Loads all seasons from the series and add to allSeasons array list
     */
    private void loadSeasons() {
        allSeasons = new ArrayList<>();

        //"1-13", "2-13", "3-13", "4-13", "5-13", "6-21"
        for (String s : seasonsAndEpisodes) {
            Season season = new Season(s);
            allSeasons.add(season);
        }
    }

    /**
     * Gets the type of object which is Series
     * @return The type as a String
     */
    @Override
    public String getType() {
        return "SERIES";
    }

    /**
     * Gets the ending year of a Series
     * @return the ending year as a String
     */
    public String getEndingYear() {
        return endingYear;
    }

    /**
     * Gets all the seasons in a series
     * @return Array list of all seasons
     */
    public ArrayList<Season> getAllSeasons() {
        return allSeasons;
    }

    @Override
    public boolean equals(Object other) {
        if (other == this)
            return true;

        if (!(other instanceof Series otherMyClass))
            return false;

        return otherMyClass.title.equals(this.title) && otherMyClass.releaseYear.equals(this.releaseYear)
                && otherMyClass.rating == this.rating && otherMyClass.categories.equals(this.categories) && otherMyClass.endingYear.equals(this.endingYear)
                && otherMyClass.allSeasons.equals(this.allSeasons);
    }

    /**
     * Display Series object a certain way
     * @return The String to display
     */
    @Override
    public String toString() {
        return getType() +
                super.toString() +
                "\nEnding Year: " + getEndingYear() +
                "\nTotal number Of Seasons: " + getAllSeasons().size();
    }
}
