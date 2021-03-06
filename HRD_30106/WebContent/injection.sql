CREATE TABLE tbl_cust_20104(
	p_no		CHAR(4),
	p_name		VARCHAR2(20),
	p_birth 	CHAR(8),
	p_tel1		CHAR(3),
	p_tel2		CHAR(4),
	p_tel3		CHAR(4),
	p_city		CHAR(2),
	p_gender	CHAR(1),
	CONSTRAINT PK_ONE PRIMARY KEY(p_no)
);

CREATE TABLE tbl_order_20104(
	p_seno		NUMBER(8),
	i_code		CHAR(5),
	p_no		CHAR(4),
	p_date		DATE
);

CREATE TABLE tbl_injection_20104(
	i_code		CHAR(5),
	i_name		VARCHAR2(20),
	i_age		VARCHAR2(20),
	CONSTRAINT PK_THREE PRIMARY KEY(i_code)
);

DROP TABLE tbl_cust_20104;

DROP TABLE tbl_order_20104;

DROP TABLE tbl_injection_20104;

INSERT INTO tbl_cust_20104 VALUES('1001', '김하나', '20030909', '010', '8801', '3216', '10', 'F');

SELECT p_no, p_name, SUBSTR(p_birth, 0, 4) || '년' || SUBSTR(p_birth, 5, 2) || '월' || SUBSTR(p_birth, 7, 2) || '일' as p_birth, p_tel1 || '-' || p_tel2 || '-' || p_tel3 as p_phone, CASE p_gender WHEN 'M' THEN '남' WHEN 'F' THEN '여' END AS p_gender, CASE p_city WHEN '10' THEN '서울' WHEN '20' THEN '경기' WHEN '30' THEN '부산' WHEN '40' THEN '대구' END AS p_city FROM tbl_cust_20104;