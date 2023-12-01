import java.util.ArrayList;

public interface Database {
    ArrayList<String> loadAllUsers(String path);
    boolean saveUserData(String path, String username, String password);
    ArrayList<AMedia> loadAllMedias(String path);
    boolean saveListData(User user, String listType, ArrayList<AMedia> listOfMedias);
    ArrayList<AMedia> loadListData(User user, String listType);
}
