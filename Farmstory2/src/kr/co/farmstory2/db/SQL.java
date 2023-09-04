package kr.co.farmstory2.db;

public class SQL {
    public static final String SELSECT_TERMS = "SELECT * FROM FarmStory.terms";
    public static final String INSERT_USER = "INSERT INTO FarmStory.user (uid, pass, name, nick, email, hp, role, zip, addr1, addr2, regIp, regDate, leaveDate)\n" +
            "VALUES (?, SHA2(?, 256), ?, ?, ?, ?, DEFAULT, ?, ?, ?, ?, NOW(), null);";
    public static final String SELECT_COUNT_UID = "SELECT COUNT(*) FROM FarmStory.user WHERE uid=?";
    public static final String SELECT_COUNT_NICK = "SELECT COUNT(*) FROM FarmStory.user WHERE Nick=?";
    public static final String SELECT_COUNT_HP = "SELECT COUNT(*) FROM FarmStory.user WHERE hp=?";
    public static final String SELECT_USER= "SELECT * from FarmStory.user where FarmStory.user.uid =? and FarmStory.user.pass=SHA2(?, 256);";

}
