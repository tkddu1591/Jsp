package kr.co.Jboard2.dao;

import kr.co.Jboard2.db.DBHelper;
import kr.co.Jboard2.db.SQL;
import kr.co.Jboard2.dto.TermsDTO;
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
