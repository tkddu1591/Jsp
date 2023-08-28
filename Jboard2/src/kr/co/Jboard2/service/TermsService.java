package kr.co.Jboard2.service;

import kr.co.Jboard2.dao.TermsDAO;
import kr.co.Jboard2.dto.TermsDTO;

public class TermsService {
    public static final TermsService INSTANCE = new TermsService();
    TermsDAO termsDAO = new TermsDAO();
    private TermsService() {
    }
    public static TermsService getInstance() {
        return INSTANCE;
    }
    public TermsDTO selectTerms() {
        return termsDAO.selectTerms();
    }
    public TermsDTO selectPrivacy(){
        return termsDAO.selectPrivacy();
    }
}
