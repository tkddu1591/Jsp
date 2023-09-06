create user 'java'@'%' identified by 'ahffkehehlA1!';


SELECT *
FROM FarmStory.terms;
SELECT *
from FarmStory.user
where FarmStory.user.uid = ?
  and FarmStory.user.pass = SHA2(?, 256);

SELECT *
FROM FarmStory.article
join FarmStory.user u on u.uid = article.writer
where cate = ?;

INSERT INTO FarmStory.file
SET aNo     = ?,
    oriName = ?,
    newName =?,
    rDate=NOW();
SELECT *
FROM FarmStory.file
where fNo = ?;

INSERT INTO FarmStory.article ( cate, title, content, file, writer, regIp, rDate)
VALUES ( ?, ?, ?, ?, ?, ?, NOW());
SELECT MAX(`no`) FROM FarmStory.article;

SELECT COUNT(*) FROM FarmStory.article WHERE `parent`=0 AND `cate`=?;

SELECT
												 a.*,
												 b.`nick`
												 FROM FarmStory.article AS a
												 JOIN FarmStory.user AS b ON a.writer = b.uid
												 WHERE a.parent=0 AND `cate`=?
												 ORDER BY `no` DESC
												 LIMIT ?, 10;


/*2배 복사 쿼리*/
insert into FarmStory.article( cate, title, content, file, writer, regIp, rDate)
    (select FarmStory.article.cate, title, content, file, writer, regIp, rDate from FarmStory.article);


SELECT * FROM FarmStory.article WHERE no = ?;

INSERT INTO FarmStory.article (parent, content, writer, regIp, rDate) values (?,?,?,?,NOW());

UPDATE FarmStory.article SET comment = article.comment=0;

UPDATE FarmStory.article t SET t.title   = ?, t.content = ?, t.file    = ? WHERE t.no = ?;


SELECT * FROM FarmStory.article a join FarmStory.user u on u.uid = a.writer where parent =?;

SELECT * FROM FarmStory.article Left join FarmStory.file f on article.file = f.oriName WHERE article.no = ?;

UPDATE FarmStory.article SET hit = hit+1 where no =?;
UPDATE FarmStory.file SET download = download+1 where fNo =?;

SELECT * FROM FarmStory.article Left join FarmStory.file f on article.no = f.aNo join FarmStory.user u on u.uid = article.writer WHERE article.no = ?;

DELETE FROM  FarmStory.file where fNo=?;

UPDATE FarmStory.article SET `content`=? WHERE `no`=?;


SELECT
a.*,
b.`nick`
FROM FarmStory.article AS a
JOIN FarmStory.user AS b ON a.writer = b.uid
WHERE `parent`!=0
ORDER BY `no` DESC LIMIT 1;


public final static String INSERT_PRODUCT = "INSERT INTO `Product` SET "
												+ "`type`=?,"
												+ "`pName`=?,"
												+ "`price`=?,"
												+ "`delivery`=?,"
												+ "`stock`=?,"
												+ "`thumb1`=?,"
												+ "`thumb2`=?,"
												+ "`thumb3`=?,"
												+ "`seller`=?,"
												+ "`etc`=?,"
												+ "`rdate`=NOW()";


SELECT * FROM FarmStory.product WHERE `pNo`=?;
SELECT * FROM FarmStory.product WHERE `stock` > 0 LIMIT ?, 10;
SELECT * FROM FarmStory.product WHERE `stock` > 0 AND `type`=? LIMIT ?, 10;
SELECT COUNT(*) FROM FarmStory.product WHERE `stock` > 0;
SELECT COUNT(*) FROM FarmStory.product WHERE `stock` > 0 AND `type`=?;


INSERT INTO FarmStory.product SET
												`type`=?,
												`pName`=?,
												`price`=?,
												`delivery`=?,
												`stock`=?,
												`thumb1`=?,
												`thumb2`=?,
												`thumb3`=?,
												`seller`=?,
												`etc`=?,
												`rDate`=NOW();