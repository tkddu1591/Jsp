package kr.co.jboard.dao;

import kr.co.jboard.db.DBHelper;
import kr.co.jboard.dto.TermsDTO;

public class TermsDAO extends DBHelper {

    private static TermsDAO instance = new TermsDAO();

    public static TermsDAO getInstance() {
        return instance;
    }

    private TermsDAO() {
    }
    
    public TermsDTO selectTerms() {
        TermsDTO termsDTO = new TermsDTO();
        try {
            conn=getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * from jboard.terms");
            if (rs.next()) {
                termsDTO.setTerms(rs.getString(1));
                termsDTO.setPrivacy(rs.getString(2));
            }

            cloes();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return termsDTO;
    }
}
