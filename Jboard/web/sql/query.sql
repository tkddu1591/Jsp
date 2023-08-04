/*

*/

select exists(select * from jboard.user where uid='aaaaaa');
select exists(select * from jboard.user where nick='asdasd');

insert into user set uid= 'iii', pass =sha2('asda',255), name='adda';
select * from jboard.user where uid = 'asdasd' and pass=sha2('1234',256);
