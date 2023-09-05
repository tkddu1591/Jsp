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

SELECT * FROM FarmStory.article join FarmStory.file f on article.file = f.oriName WHERE article.no = ?;