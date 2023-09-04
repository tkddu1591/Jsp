package kr.co.farmstory2.dao;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.TermsDTO;
import org.slf4j.Logger;

import java.sql.SQLException;

public class TermsDAO extends DBHelper {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(TermsDAO.class);

    public TermsDTO selectTerms() {
        TermsDTO termsDTO = new TermsDTO();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELSECT_TERMS);
            rs = psmt.executeQuery();
            while (rs.next()) {
                termsDTO.setTerms(rs.getString("terms"));
            }

        } catch (SQLException e) {
            logger.error("selectTerms error: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return termsDTO;
    }

    public TermsDTO selectPrivacy() {

        TermsDTO termsDTO = new TermsDTO();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELSECT_TERMS);
            rs = psmt.executeQuery();
            while (rs.next()) {
                termsDTO.setPrivacy(rs.getString("privacy"));
            }
            close();
        } catch (SQLException e) {
            logger.error("selectPrivacy error: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return termsDTO;
    }
}
