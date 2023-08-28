package kr.co.Jboard2.service;

import kr.co.Jboard2.dao.UserDAO;
import kr.co.Jboard2.dto.UserDTO;
import org.slf4j.Logger;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

public class UserService {

    private Logger logger = org.slf4j.LoggerFactory.getLogger(UserDAO.class);
    private static int code;
    private static UserService instance = new UserService();

    public static UserService getInstance() {
        return instance;
    }

    private UserDAO userDAO = new UserDAO();

    private UserService() {
    }

    public void insertUser(UserDTO userDTO) {
        userDAO.insertUser(userDTO);
    }

    public UserDTO selectUser() {
        return userDAO.selectUser();
    }

    public List<UserDTO> selectUsers() {
        return userDAO.selectUsers();
    }

    public void updateUser(UserDTO userDTO) {
        userDAO.updateUser(userDTO);
    }

    public void deleteUser(String uid) {
        userDAO.deleteUser(uid);
    }

    public int selectCountUid(String uid) {
        return userDAO.selectCountUid(uid);
    }

    public int selectCountNick(String nick) {
        return userDAO.selectCountNick(nick);
    }

    public int selectCountHp(String hp) {
        return userDAO.selectCountNick(hp);
    }

    public int sendCodeByEmail(String email) {

        code = ThreadLocalRandom.current().nextInt(100000,1000000);
        //기본정보
        String sender = "tkddu1591@gmail.com";
        String appPass = "snqnfzrwcrdsdwtq";
        String receiver = email;
        String title = "Jboard 페이지 인증 이메일";
        String content = "Jboard 인증 이메일 코드입니다.<br><h1>"+code+"</h1>";

        // Gmail SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        // Gmail STMP 세션 생성
        Session gmailSession = Session.getInstance(props, new Authenticator(){

            @Override
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, appPass);
            }
        });

        // 메일 발송
        javax.mail.Message message = new MimeMessage(gmailSession);

        int status=0;
        try{
            message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
            message.setSubject(title);
            message.setContent(content, "text/html;charset=UTF-8");
            Transport.send(message);

            status=1;
        }catch(Exception e){
            e.printStackTrace();
            status=0;
        }

        return status;

    }

    public int ConfirmCodeByEmail(String code) {
        if(code.equals(String.valueOf(this.code))) {
            return 1;
        }else{
            return 0;
        }
    }

}
