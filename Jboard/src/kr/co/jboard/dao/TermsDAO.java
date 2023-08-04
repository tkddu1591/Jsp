package kr.co.jboard.dao;

import kr.co.jboard.db.DBHelper;
import kr.co.jboard.vo.TermsVO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TermsDAO extends DBHelper {

    private static TermsDAO instance = new TermsDAO();

    public static TermsDAO getInstance() {
        return instance;
    }

    private TermsDAO() {
    }
    
    public TermsVO selectTerms() {
        TermsVO termsVO= new TermsVO();
        try {
            conn=getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * from jboard.terms");
            if (rs.next()) {
                termsVO.setTerms(rs.getString(1));
                termsVO.setPrivacy(rs.getString(2));
            }

            cloes();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return termsVO;
    }
}
