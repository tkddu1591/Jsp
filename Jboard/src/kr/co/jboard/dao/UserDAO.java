package kr.co.jboard.dao;

import kr.co.jboard.db.DBHelper;
import kr.co.jboard.db.SQL;
import kr.co.jboard.vo.UserVO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class UserDAO extends DBHelper {
    private static UserDAO instance = new UserDAO();

    public static UserDAO getInstance() {
        return instance;
    }

    private UserDAO() {
    }


    public void insertUser(UserVO vo) {
        try {
            //JNDI 서비스 객체 생성
            conn = getConnection();

            psmt = conn.prepareStatement(SQL.INSERT_USER);
            psmt.setString(1, vo.getUid());
            psmt.setString(2, vo.getPass());
            psmt.setString(3, vo.getName());
            psmt.setString(4, vo.getNick());
            psmt.setString(5, vo.getEmail());
            psmt.setString(6, vo.getHp());
            psmt.setString(7, vo.getZip());
            psmt.setString(8, vo.getAddr1());
            psmt.setString(9, vo.getAddr2());
            psmt.setString(10, vo.getRegIp());

            psmt.executeUpdate();
            cloes();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public UserVO selectUser(String uid, String pass) {
        UserVO userVO = null;
        try {
            conn = getConnection();

            psmt = conn.prepareStatement(SQL.SELECT_USER);
            psmt.setString(1, uid);
            psmt.setString(2, pass);
            rs = psmt.executeQuery();
            if (rs.next()) {
                userVO = new UserVO();
                userVO.setUid(rs.getString(1));
                userVO.setPass(rs.getString(2));
                userVO.setName(rs.getString(3));
                userVO.setNick(rs.getString(4));
                userVO.setEmail(rs.getString(5));
                userVO.setHp(rs.getString(6));
                userVO.setRole(rs.getString(7));
                userVO.setZip(rs.getString(8));
                userVO.setAddr1(rs.getString(9));
                userVO.setAddr2(rs.getString(10));
                userVO.setRegIp(rs.getString(11));
                userVO.setRegDate(rs.getString(12));
                userVO.setLeaveDate(rs.getString(13));
            }



            /*result = psmt.executeUpdate();*/
            cloes();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userVO;
    }

    public List<UserVO> selectUsers() {
        return null;
    }

    public void updateUser() {
    }

    public void deleteUser() {
    }

    public int selectCountUid(String uid) {
        int result=0;
        try {
            //JNDI 서비스 객체 생성

            conn = getConnection();

            psmt = conn.prepareStatement(SQL.SELECT_EXISTS_UID);
            psmt.setString(1, uid);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }

            conn.close();
            psmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int selectCountNick(String nick) {
        int result=0;
        try {
            //JNDI 서비스 객체 생성

            conn = getConnection();

            psmt = conn.prepareStatement(SQL.SELECT_EXISTS_NICK);
            psmt.setString(1, nick);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }

            conn.close();
            psmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int selectCountHp(String hp) {
        int result=0;
        try {
            //JNDI 서비스 객체 생성

            conn = getConnection();

            psmt = conn.prepareStatement(SQL.SELECT_EXISTS_HP);
            psmt.setString(1, hp);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }

            conn.close();
            psmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int selectCountEmail(String email) {
        int result=0;
        try {
            //JNDI 서비스 객체 생성

            conn = getConnection();

            psmt = conn.prepareStatement(SQL.SELECT_EXISTS_EMAIL);
            psmt.setString(1, email);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }

            conn.close();
            psmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }



}
