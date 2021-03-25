CREATE TABLE employee_tbl(
	empno		number(5) not null,
	empname		varchar2(20),
	joindate	date,
	rank		char(1),
	dept		char(1),
	CONSTRAINT PK PRIMARY KEY(empno)
);

SELECT MAX(empno) as empno FROM employee_tbl;

DROP TABLE employee_tbl;

INSERT INTO employee_tbl VALUES(10001, '고영만', TO_DATE('2017-03-01'), 'A', 'A');
INSERT INTO employee_tbl VALUES(10002, '만준원', TO_DATE('2017-03-01'), 'A', 'B');
INSERT INTO employee_tbl VALUES(10003, '원성휘', TO_DATE('2017-03-01'), 'B', 'A');
INSERT INTO employee_tbl VALUES(10004, '휘현진', TO_DATE('2017-05-01'), 'B', 'B');
INSERT INTO employee_tbl VALUES(10005, '진유민', TO_DATE('2017-05-01'), 'C', 'C');

SELECT empno, empname, TO_CHAR(joindate, 'YYYY-MM-DD') as joindate, case rank when 'A' then '사원' when 'B' then '대리' when 'C' then '과장' end as rank, case rank when 'A' then '디자인' when 'B' then '백엔드' when 'C' then '프론트' end as dept FROM employee_tbl;

CREATE TABLE salary_tbl(
	empno	number(5) not null,
	payday	date not null,
	pay		number(10),
	CONSTRAINT PK_DUAL PRIMARY KEY(empno, payday)
);

INSERT INTO salary_tbl VALUES(10001, TO_DATE('2019-03-01'), 1540000);
INSERT INTO salary_tbl VALUES(10001, TO_DATE('2019-04-01'), 1570000);
INSERT INTO salary_tbl VALUES(10002, TO_DATE('2019-03-01'), 1740000);
INSERT INTO salary_tbl VALUES(10002, TO_DATE('2019-04-01'), 1770000);
INSERT INTO salary_tbl VALUES(10003, TO_DATE('2019-03-01'), 2400000);
INSERT INTO salary_tbl VALUES(10003, TO_DATE('2019-04-01'), 2450000);
INSERT INTO salary_tbl VALUES(10004, TO_DATE('2019-03-01'), 3400000);
INSERT INTO salary_tbl VALUES(10004, TO_DATE('2019-04-01'), 3450000);
INSERT INTO salary_tbl VALUES(10005, TO_DATE('2019-03-01'), 4500000);
INSERT INTO salary_tbl VALUES(10005, TO_DATE('2019-04-01'), 4550000);