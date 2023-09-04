create user 'java'@'%' identified by 'ahffkehehlA1!';


SELECT * FROM FarmStory.terms;
SELECT * from FarmStory.user where FarmStory.user.uid =? and FarmStory.user.pass=SHA2(?, 256);