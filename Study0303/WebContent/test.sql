create table test(
	id	varchar2(5),
	pwd	varchar2(5)
);

insert into test('id', 'pwd') values('aa', '11');
insert into test('id', 'pwd') values('bb', '22');

select * from test;

drop table test;