CREATE TABLE member_tbl_02(
	custno		number(6, 0) not null primary key,
	custname	varchar2(20),
	phone		varchar2(13),
	address		varchar2(4) check(address in ('SK', 'KT', 'LG')),
	joindate	date,
	grade		char(1),
	city		char(2)
);

INSERT INTO member_tbl_02 VALUES(100001, '김행복', '010-1111-2222', 'SK', to_date('20151202'), 'A', '01');
INSERT INTO member_tbl_02 VALUES(100002, '이축복', '010-1111-3333', 'SK', to_date('20151206'), 'B', '01');
INSERT INTO member_tbl_02 VALUES(100003, '장믿음', '010-1111-4444', 'LG', to_date('20151001'), 'B', '30');
INSERT INTO member_tbl_02 VALUES(100004, '최사랑', '010-1111-5555', 'KT', to_date('20151113'), 'A', '30');
INSERT INTO member_tbl_02 VALUES(100005, '진평화', '010-1111-6666', 'SK', to_date('20151225'), 'B', '60');
INSERT INTO member_tbl_02 VALUES(100006, '차공단', '010-1111-7777', 'LG', to_date('20151211'), 'C', '60');

CREATE TABLE money_tbl_02(
	custno	number(6, 0) not null,
	salenol	number(8, 0) not null,
	pcost	number(8, 0),
	amount	number(4, 0),
	price	number(8, 0),
	pcode	varchar2(4),
	sdate	date,
	CONSTRAINT PK_DUAL PRIMARY KEY(custno, salenol)
);

INSERT INTO money_tbl_02 VALUES(100001, 20160001, 500, 5, 2500, 'A001', to_date('20160101'));
INSERT INTO money_tbl_02 VALUES(100001, 20160002, 1000, 4, 4000, 'A002', to_date('20160101'));
INSERT INTO money_tbl_02 VALUES(100001, 20160003, 500, 3, 1500, 'A008', to_date('20160101'));
INSERT INTO money_tbl_02 VALUES(100002, 20160004, 2000, 1, 2000, 'A004', to_date('20160102'));
INSERT INTO money_tbl_02 VALUES(100002, 20160005, 500, 1, 500, 'A001', to_date('20160103'));
INSERT INTO money_tbl_02 VALUES(100003, 20160006, 1500, 2, 3000, 'A003', to_date('20160103'));
INSERT INTO money_tbl_02 VALUES(100004, 20160007, 500, 2, 1000, 'A001', to_date('20160104'));
INSERT INTO money_tbl_02 VALUES(100004, 20160008, 300, 1, 300, 'A005', to_date('20160104'));
INSERT INTO money_tbl_02 VALUES(100004, 20160009, 600, 1, 600, 'A006', to_date('20160104'));
INSERT INTO money_tbl_02 VALUES(100004, 20160010, 3000, 1, 3000, 'A007', to_date('20160106'));

commit;

SELECT * FROM member_tbl_02;

SELECT custno, custname, phone, address, to_char(joindate, 'YYYY"년" MONTH DD"일"') as joindate, case grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then '직원' end as grade, case city when '01' then '서울' when '10' then '인천' when '20' then'성남' when '30' then '대전' when '40' then '광주' when '60' then '부산' end as city FROM member_tbl_02;

