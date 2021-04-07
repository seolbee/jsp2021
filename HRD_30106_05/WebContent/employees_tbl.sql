CREATE TABLE personnel(
	empno		char(2) NOT NULL,
	empname		varchar2(30) NOT NULL,
	dept		varchar2(30) NOT NULL,
	position	char(1),
	duty		varchar2(20),
	phone		varchar2(14),
	CONSTRAINT	PK_ONE PRIMARY KEY(empno)
);

INSERT INTO personnel VALUES('95', '박민우', '인사부', '1', '상무', '010-1234-5678');
INSERT INTO personnel VALUES('96', '박민우', '인사부', '2', '과장', '010-3333-4444');