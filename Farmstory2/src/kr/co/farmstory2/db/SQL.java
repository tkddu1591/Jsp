package kr.co.farmstory2.db;

public class SQL {
    public static final String SELSECT_TERMS = "SELECT * FROM FarmStory.terms";
    public static final String INSERT_USER = "INSERT INTO FarmStory.user (uid, pass, name, nick, email, hp, role, zip, addr1, addr2, regIp, regDate, leaveDate)\n" +
            "VALUES (?, SHA2(?, 256), ?, ?, ?, ?, DEFAULT, ?, ?, ?, ?, NOW(), null);";
    public static final String SELECT_COUNT_UID = "SELECT COUNT(*) FROM FarmStory.user WHERE uid=?";
    public static final String SELECT_COUNT_NICK = "SELECT COUNT(*) FROM FarmStory.user WHERE Nick=?";
    public static final String SELECT_COUNT_HP = "SELECT COUNT(*) FROM FarmStory.user WHERE hp=?";
    public static final String SELECT_USER = "SELECT * from FarmStory.user where FarmStory.user.uid =? and FarmStory.user.pass=SHA2(?, 256);";

    public static final String SELECT_ARTICLE = "SELECT * FROM FarmStory.article Left join FarmStory.file f on article.no = f.aNo join FarmStory.user u on u.uid = article.writer WHERE article.no = ?;";
    public static final String SELECT_ARTICLES = "SELECT * FROM FarmStory";
    public static final String SELECT_ARTICLES_CATE = "SELECT\n" +
            " a.*,\n" +
            " b.`nick`\n" +
            " FROM FarmStory.article AS a\n" +
            " JOIN FarmStory.user AS b ON a.writer = b.uid\n" +
            " WHERE a.parent=0 AND `cate`=?\n" +
            " ORDER BY `no` DESC\n" +
            " LIMIT ?, 10\n";
    public static final String SELECT_ARTICLES_CATE_PREVIEW = "SELECT\n" +
            " a.*,\n" +
            " b.`nick`\n" +
            " FROM FarmStory.article AS a\n" +
            " JOIN FarmStory.user AS b ON a.writer = b.uid\n" +
            " WHERE a.parent=0 AND `cate`=?\n" +
            " ORDER BY `no` DESC\n" +
            " LIMIT 0, 5\n";

    public static final String INSERT_FILE = "INSERT INTO FarmStory.file SET aNo = ?, oriName = ?, newName =?, rDate=NOW();";
    public static final String SELECT_FILE = "SELECT * FROM  FarmStory.file where fNo=?;";
    public static final String DELETE_FILE = "DELETE FROM  FarmStory.file where fNo=?;";

    public static final String INSERT_ARTICLE = "INSERT INTO FarmStory.article ( cate, title, content, file, writer, regIp, rDate)VALUES ( ?, ?, ?, ?, ?, ?, NOW());";

    public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM FarmStory.article;";

    public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM FarmStory.article WHERE `parent`=0 AND `cate`=?;";

    public static final String INSERT_COMMENT = "INSERT INTO FarmStory.article (parent, content, writer, regIp, rDate) values (?,?,?,?,NOW());";
    public static final String UPDATE_COMMENT_PLUS ="UPDATE FarmStory.article SET comment = article.comment+1 where no=?;";
    public static final String UPDATE_COMMENT_MINUS ="UPDATE FarmStory.article SET comment = article.comment-1 where no=?;";

    public static final String UPDATE_ARTICLE = "UPDATE FarmStory.article t SET t.title   = ?, t.content = ?, t.file    = ? WHERE t.no = ?;";

    public static final String SELECT_COMMENTS = "SELECT * FROM FarmStory.article a join FarmStory.user u on u.uid = a.writer where parent =?";

    public static final String UPDATE_ARTICLE_HIT_PLUS = "UPDATE FarmStory.article SET hit = hit+1 where no =?";
    public static final String UPDATE_FILE_DOWNLOAD_PLUS = "UPDATE FarmStory.file SET download = download+1 where fNo =?;";
    public static final String DELETE_COMMENT = "DELETE FROM FarmStory.article WHERE  no=?;";
    public static final String DELETE_ARTICLE = "DELETE FROM FarmStory.article WHERE  no=?;";
    public static final String UPDATE_COMMENT = "UPDATE FarmStory.article SET `content`=? WHERE `no`=?";

    public static final String SELECT_COMMENT_LATEST = "SELECT\n" +
            "a.*,\n" +
            "b.`nick`\n" +
            "FROM FarmStory.article AS a\n" +
            "JOIN FarmStory.user AS b ON a.writer = b.uid\n" +
            "WHERE `parent`!=0\n" +
            "ORDER BY `no` DESC LIMIT 1;";

    public final static String INSERT_PRODUCT = "INSERT INTO  FarmStory.product SET " +
                                                "`type`=?," +
                                                "`pName`=?," +
                                                "`price`=?," +
                                                "`delivery`=?," +
                                                "`stock`=?," +
                                                "`thumb1`=?," +
                                                "`thumb2`=?," +
                                                "`thumb3`=?," +
                                                "`seller`=?," +
                                                "`etc`=?," +
                                                "`rDate`=NOW()";
    public final static String SELECT_PRODUCT = "SELECT * FROM FarmStory.product WHERE `pNo`=?;";
    public final static String SELECT_PRODUCTS_ALL = "SELECT * FROM FarmStory.product WHERE `stock` > 0 ORDER BY pNo DESC LIMIT ?, 10;";
    public final static String SELECT_PRODUCTS_PREVIEW = "SELECT * FROM FarmStory.product WHERE `stock` > 0 ORDER BY pNo DESC LIMIT 0, 3;";
    public final static String SELECT_PRODUCTS_TYPE = "SELECT * FROM FarmStory.product WHERE `stock` > 0 AND `type`=? ORDER BY pNo DESC LIMIT ?, 10;";
    public final static String SELECT_COUNT_PRODUCTS_ALL = "SELECT COUNT(*) FROM FarmStory.product WHERE `stock` > 0;";
    public final static String SELECT_COUNT_PRODUCTS_TYPE = "SELECT COUNT(*) FROM FarmStory.product WHERE `stock` > 0 AND `type`=?;";

    public final static String UPDATE_PRODUCT_STOCK_MINUS = "UPDATE FarmStory.product SET `stock` = stock-1 WHERE pNo = ?;";

    public final static String INSERT_ORDER = "INSERT INTO FarmStory.`order` (orderProduct, orderCount, orderDelivery, orderPrice, orderTotal, receiver, hp,\n" +
            "                               zip, addr1, addr2, orderEtc, orderUser, orderDate)\n" +
            "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW());";

    public final static String SELECT_ORDERS_PREVIEW ="SELECT * FROM FarmStory.`order` as a join FarmStory.product b on a.orderProduct = b.pNo ORDER BY `orderNo` DESC LIMIT 0,3;";
    public final static String SELECT_ORDERS ="SELECT * FROM FarmStory.`order` as a join FarmStory.product b on a.orderProduct = b.pNo ORDER BY `orderNo` DESC LIMIT ?,10;";

    public final static String SELECT_USERS_PREVIEW = "SELECT * FROM FarmStory.user ORDER BY `regDate` DESC LIMIT 0,3;";
    public final static String SELECT_USERS = "SELECT * FROM (SELECT u.uid, u.name, u.nick, u.email, u.hp,  u.regDate,  SUM(o.orderTotal), u.zip, u.addr1, u.addr2, u.regIp, u.role FROM (SELECT * FROM FarmStory.user order by regDate DESC) as u LEFT JOIN FarmStory.`order` o on u.uid = o.orderUser  GROUP BY u.uid LIMIT ?,10)  as a ORDER BY  a.regDate DESC ;";
    public final static String SELECT_COUNT_USERS = "SELECT COUNT(*) FROM FarmStory.user;";


}


