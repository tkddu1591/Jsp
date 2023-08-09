INSERT into article (title, content, writer, regIp, rDate) value (?, ?, ?, ?, ?);

/*auto increment 초기화*/
ALTER TABLE article
    AUTO_INCREMENT = 1;


SET @COUNT = 0;
UPDATE article
SET no = @COUNT := @COUNT + 1;

select *
from article;

update article
set title = 'bbbbbb' , content = 'bbbbb'
where no = 1;

insert into article(title,content,writer,regIp,rDate)
select title,content,writer,regIp,rDate from article;

# 게시물 개수 구하기
select no from article order by no desc limit 1;
select count(no) from article;

# 10개씩 나누기
select * from jboard.article as a join jboard.user as b on a.writer = b.uid order by a.no desc limit 10;
select * from jboard.article as a join jboard.user as b on a.writer = b.uid order by a.no desc limit 10, 10;
select * from jboard.article as a join jboard.user as b on a.writer = b.uid order by a.no desc limit 20, 10;
select * from jboard.article as a join jboard.user as b on a.writer = b.uid order by a.no desc limit 30, 10;

select * from jboard.article as a join jboard.user as b on a.writer = b.uid where no=? and parent=0;


select * from jboard.article as a join jboard.user as b on a.writer = b.uid where parent=32754;


delete from article;

select * from jboard.article as a join jboard.user as b on a.writer = b.uid where parent=0 order by a.no desc limit ?, 10
update article set comment = comment+1 where no = ?;

delete from article where no=?;