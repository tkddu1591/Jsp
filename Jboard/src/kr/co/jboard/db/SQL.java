package kr.co.jboard.db;

public class SQL {
    public static final String INSERT_USER = "INSERT INTO `user`(uid,pass,name,nick,email,hp,zip,addr1,addr2,regIp,regDate) values (?,SHA2(?,256),?,?,?,?,?,?,?,?,NOW())";
    public static final String SELECT_USER = "select * from jboard.user where uid = ? and pass=sha2(?,256)";
    public static final String SELECT_EXISTS_UID = "select exists(select * from jboard.user where uid=?)";
    public static final String SELECT_EXISTS_NICK = "select exists(select * from jboard.user where nick=?)";
    public static final String SELECT_EXISTS_HP = "select exists(select * from jboard.user where hp=?)";
    public static final String SELECT_EXISTS_EMAIL = "select exists(select * from jboard.user where email=?)";
    public static final String INSERT_ARTICLE = "INSERT into article (title, content, writer, regIp, rDate) value (?,?,?,?,NOW());";

}
