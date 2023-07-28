alter table 'user5' add column `uid` varchar(20) primary key first ;
SELECT * from `member` as a join department u on a.dep=u.depNo;
update member set `rdata` =now() where uid = 'a101';