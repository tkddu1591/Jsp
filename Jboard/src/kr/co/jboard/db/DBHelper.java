package kr.co.jboard.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class DBHelper {
    protected Connection conn = null;
    protected PreparedStatement psmt = null;
    protected Statement stmt = null;
    protected ResultSet rs = null;

    public Connection getConnection() {
        try {
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경 이름

            //커넥션 풀에서 커넥션 가져오기
            DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
            return ds.getConnection();

        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void cloes() throws SQLException {
        if (conn != null) conn.close();
        if (stmt != null) stmt.close();
        if (psmt != null) psmt.close();
        if (rs != null) {
            rs.close();

        }
    }
}