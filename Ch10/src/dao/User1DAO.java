package dao;

import db.DBHelper;
import dto.User1DTO;
import org.apache.catalina.User;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class User1DAO extends DBHelper {

    protected final String HOST = "jdbc:mysql://127.0.0.1:3306/userdb";
    protected final String USER = "root";
    protected final String PASS = "1234";
    public void insertUser1(User1DTO dto){
        try {
            Context ctx = (Context) new InitialContext().lookup("java:comp/env");
            DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
            Connection conn = ds.getConnection();
            PreparedStatement psmt = conn.prepareStatement("INSERT  INTO User1 Values (?,?,?,?)");
            psmt.setString(1,dto.getUid());
            psmt.setString(2,dto.getName());
            psmt.setString(3,dto.getHp());
            psmt.setInt(4,dto.getAge());
            psmt.executeUpdate();

            psmt.close();
            conn.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public User1DTO selectUser1(String uid){
        return selectUser1(uid);
    }
    public List<User1DTO> selectUser1s(){
        List<User1DTO> dtos = new ArrayList<>();
        try {
            Context ctx = (Context) new InitialContext().lookup("java:comp/env");
            DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
            Connection conn = ds.getConnection();
            PreparedStatement psmt = conn.prepareStatement("SELECT * from `User1`");
            ResultSet rs = psmt.executeQuery();

            while (rs.next()){
                User1DTO dto= new User1DTO();
                dto.setUid(rs.getString(1));
                dto.setName(rs.getString(2));
                dto.setHp(rs.getString(3));
                dto.setAge(rs.getString(4));
                dtos.add(dto);
            }

            psmt.close();
            conn.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return dtos;
    }
    public void updateUser1(User1DTO dto){
        updateUser1(dto);
    }
    public void deleteUser1(String uid){


    }
}
