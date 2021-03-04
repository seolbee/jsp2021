create table member(
	name	varchar2(100),
	id		varchar2(100) primary key,
	pass	varchar2(100),
	birth	number,
	gender	varchar2(100),
	job		varchar2(100),
	address	varchar2(100),
	regDate	date
);

drop table member;