package setting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnSetting {
    private static ConnSetting instance = new ConnSetting();
    private static final String HOST = "jdbc:mysql://127.0.0.1:3306/userdb";
    private static final String USER = "root";
    private static final String PASS = "1234";


    private ConnSetting() {
    }

    public static ConnSetting getInstance() {

        return instance;
    }
    public static Connection conn() throws SQLException, ClassNotFoundException {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(HOST, USER, PASS);
    }


}
