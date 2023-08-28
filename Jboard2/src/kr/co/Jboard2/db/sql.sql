
SELECT * FROM jboard.terms;
INSERT INTO jboard.user (uid, pass, name, nick, email, hp, role, zip, addr1, addr2, regIp, regDate, leaveDate)
VALUES (?, ?, ?, ?, ?, ?, DEFAULT, ?, ?, ?, ?, NOW(), null);
SELECT COUNT(*) FROM jboard.user WHERE uid=?;
SELECT COUNT(*) FROM `jboard`.user WHERE `uid`=?;
SELECT COUNT(*) FROM jboard.user WHERE Nick=?
