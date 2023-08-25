package dao;

public class SQL {
    public static final String SELECT_MEMBER = "SELECT * FROM userdb.member WHERE uid =?";
    public static final String INSERT_MEMBER = "INSERT INTO userdb.member (uid, name, hp, pos, dep, rdata)\n" +
            "VALUES (?, ?, ?, ?, ?, NOW());";
    public static final String SELECT_ALL_MEMBERS = "SELECT * FROM userdb.member";
    public static final String UPDATE_MEMBER = "UPDATE userdb.member SET name =?, hp =?, pos =?, dep =? WHERE uid =?;";
    public static final String DELETE_MEMBER =  "DELETE FROM userdb.member WHERE uid =?;";
}
