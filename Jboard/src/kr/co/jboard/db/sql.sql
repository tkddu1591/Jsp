INSERT into article (title, content, writer, regIp, rDate) value (?,?,?,?,?);

/*auto increment 초기화*/
ALTER TABLE article AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE article SET no = @COUNT:=@COUNT+1;
