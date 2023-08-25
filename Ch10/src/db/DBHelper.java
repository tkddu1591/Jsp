package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;

//편리한 DB 처리를 위한 헬퍼 클래스
public class DBHelper {

    protected Connection conn = null;
    protected PreparedStatement psmt = null;
    protected Statement stmt = null;
    protected ResultSet rs = null;

    public Connection getConnection() {

        try {
            Context ctx = (Context) new InitialContext().lookup("java:comp/env");
            DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
            conn = ds.getConnection();
        }catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

    public void close() throws SQLException {
        if(rs != null) {
            rs.close();
        }

        if(stmt != null) {
            stmt.close();
        }

        if(psmt != null) {
            psmt.close();
        }

        if(conn != null) {
            conn.close();
        }
    }


}
