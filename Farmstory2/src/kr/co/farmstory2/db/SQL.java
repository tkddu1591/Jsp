package kr.co.farmstory2.db;

public class SQL {
    public static final String SELSECT_TERMS = "SELECT * FROM FarmStory.terms";
    public static final String INSERT_USER = "INSERT INTO FarmStory.user (uid, pass, name, nick, email, hp, role, zip, addr1, addr2, regIp, regDate, leaveDate)\n" +
            "VALUES (?, SHA2(?, 256), ?, ?, ?, ?, DEFAULT, ?, ?, ?, ?, NOW(), null);";
    public static final String SELECT_COUNT_UID = "SELECT COUNT(*) FROM FarmStory.user WHERE uid=?";
    public static final String SELECT_COUNT_NICK = "SELECT COUNT(*) FROM FarmStory.user WHERE Nick=?";
    public static final String SELECT_COUNT_HP = "SELECT COUNT(*) FROM FarmStory.user WHERE hp=?";
    public static final String SELECT_USER = "SELECT * from FarmStory.user where FarmStory.user.uid =? and FarmStory.user.pass=SHA2(?, 256);";

    public static final String SELECT_ARTICLE = "SELECT * FROM FarmStory.article Left join FarmStory.file f on article.file = f.oriName WHERE article.no = ?;";
    public static final String SELECT_ARTICLES = "SELECT * FROM FarmStory";
    public static final String SELECT_ARTICLES_CATE = "SELECT\n" +
            " a.*,\n" +
            " b.`nick`\n" +
            " FROM FarmStory.article AS a\n" +
            " JOIN FarmStory.user AS b ON a.writer = b.uid\n" +
            " WHERE a.parent=0 AND `cate`=?\n" +
            " ORDER BY `no` DESC\n" +
            " LIMIT ?, 10\n";

    public static final String INSERT_FILE = "INSERT INTO FarmStory.file SET aNo = ?, oriName = ?, newName =?, rDate=NOW();";
    public static final String SELECT_FILE = "SELECT * FROM  FarmStory.file where fNo=?;";
    public static final String DELETE_FILE = "DELETE FROM  FarmStory.file where aNo=?;";

    public static final String INSERT_ARTICLE = "INSERT INTO FarmStory.article ( cate, title, content, file, writer, regIp, rDate)VALUES ( ?, ?, ?, ?, ?, ?, NOW());";

    public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM FarmStory.article;";

    public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM FarmStory.article WHERE `parent`=0 AND `cate`=?;";

    public static final String INSERT_COMMENT = "INSERT INTO FarmStory.article (parent, content, writer, regIp, rDate) values (?,?,?,?,NOW());";
    public static final String UPDATE_COMMENT_PLUS ="UPDATE FarmStory.article SET comment = article.comment+1 where no=?;";

    public static final String UPDATE_ARTICLE = "UPDATE FarmStory.article t SET t.title   = ?, t.content = ?, t.file    = ? WHERE t.no = ?;";

    public static final String SELECT_COMMENTS = "SELECT * FROM FarmStory.article a join FarmStory.user u on u.uid = a.writer where parent =?";

    public static final String UPDATE_ARTICLE_HIT_PLUS = "UPDATE FarmStory.article SET hit = hit+1 where no =?";
    public static final String UPDATE_FILE_DOWNLOAD_PLUS = "UPDATE FarmStory.file SET download = download+1 where fNo =?;";

}
