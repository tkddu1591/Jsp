package kr.co.Jboard2.db;

public class SQL {
    public static final String SELSECT_TERMS = "SELECT * FROM jboard.terms";
    public static final String INSERT_USER = "INSERT INTO jboard.user (uid, pass, name, nick, email, hp, role, zip, addr1, addr2, regIp, regDate, leaveDate)\n" +
            "VALUES (?, ?, ?, ?, ?, ?, DEFAULT, ?, ?, ?, ?, NOW(), null);";
    public static final String SELECT_COUNT_UID = "SELECT COUNT(*) FROM jboard.user WHERE uid=?";
    public static final String SELECT_COUNT_NICK = "SELECT COUNT(*) FROM jboard.user WHERE Nick=?";
    public static final String SELECT_COUNT_HP = "SELECT COUNT(*) FROM jboard.user WHERE hp=?";
}
