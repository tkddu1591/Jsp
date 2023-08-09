package kr.co.jboard.db;

public class SQL {
    public static final String INSERT_USER = "INSERT INTO `user`(uid,pass,name,nick,email,hp,zip,addr1,addr2,regIp,regDate) values (?,SHA2(?,256),?,?,?,?,?,?,?,?,NOW())";
    public static final String SELECT_USER = "select * from jboard.user where uid = ? and pass=sha2(?,256)";
    public static final String SELECT_EXISTS_UID = "select exists(select * from jboard.user where uid=?)";
    public static final String SELECT_EXISTS_NICK = "select exists(select * from jboard.user where nick=?)";
    public static final String SELECT_EXISTS_HP = "select exists(select * from jboard.user where hp=?)";
    public static final String SELECT_EXISTS_EMAIL = "select exists(select * from jboard.user where email=?)";
    public static final String INSERT_ARTICLE = "INSERT into article (title, content, writer, regIp, rDate) value (?,?,?,?,NOW());";
    public static final String INSERT_COMMENT = "INSERT into article (parent, content, writer, regIp, rDate) value (?,?,?,?,NOW());";
    public static final String SELECTS_ARTICLE = "select * from jboard.article as a join jboard.user as b on a.writer = b.uid where parent=0 order by a.no desc limit ?, 10";
    public static final String SELECTS_ARTICLE_COMMENT = "select * from jboard.article as a join jboard.user as b on a.writer = b.uid where parent=?;";
    public static final String SELECT_ARTICLE = "select * from jboard.article as a join jboard.user as b on a.writer = b.uid where no=? ";
    public static final String UPDATE_ARTICLE_HIT = "update article set hit = hit+1 where no = ?;";

    public static final String DELETE_ARTICLE_COMMENT="delete from article where no=?;";
    public static final String UPDATE_ARTICLE_COMMENT="update article set comment = comment+1 where no = ?;";
    public static final String UPDATE_ARTICLE_COMMENT_MINUS="update article set comment = comment-1 where no = ?;";
    public static final String SELECT_ARTICLE_COUNT = "select count(no) from article where parent=0;";
    public static final String UPDATE_ARTICLE_CONTENT = "update article set title = ? , content = ? where no = ?;";

}
