CREATE TABLE course_tbl(
	id			VARCHAR2(5) NOT NULL,
	name 		VARCHAR2(40),
	credit		NUMBER(6),
	lecturer	VARCHAR2(10),
	week		NUMBER(2),
	start_hour	NUMBER(4),
	end_end		NUMBER(4),
	CONSTRAINT PK_ONE PRIMARY KEY(id) 
);

DROP TABLE course_tbl;

INSERT INTO course_tbl VALUES('10001', '프로그래밍', 2, '1', 1, 0900, 1100);
INSERT INTO course_tbl VALUES('10002', '객체지향 프로그래밍', 2, '2', 2, 0900, 1200);
INSERT INTO course_tbl VALUES('10003', '자료구조', 3, '4', 3, 0900, 1200);
INSERT INTO course_tbl VALUES('10004', '알고리즘', 3, '4', 4, 0900, 1200);
INSERT INTO course_tbl VALUES('20001', '시스템 프로그래밍', 2, '5', 1, 1300, 1600);
INSERT INTO course_tbl VALUES('20002', '운영체제', 3, '5', 2, 1500, 1800);
INSERT INTO course_tbl VALUES('20003', '오토마티와 컴파일러', '3', 5, 3, 1330, 1630);
INSERT INTO course_tbl VALUES('30001', '소프트웨어 공학', 2, '3', 4, 0900, 1200);
INSERT INTO course_tbl VALUES('30002', '스스템 분석 및 설계', '3', 3, 5, 0900, 1200);
INSERT INTO course_tbl VALUES('40001', '데이터베이스', 3, '2', 5, 1300, 1600);

CREATE TABLE lecturer_tbl(
	idx		NUMBER(6) NOT NULL,
	name	VARCHAR2(10),
	major	VARCHAR2(30),
	field	VARCHAR2(30),
	CONSTRAINT PK_TWO PRIMARY KEY(idx)
);

INSERT INTO lecturer_tbl VALUES(1, '김교수', '소프트웨어공학', '알고리즘');
INSERT INTO lecturer_tbl VALUES(2, '이교수', '소프트웨어공학', '인공지능');
INSERT INTO lecturer_tbl VALUES(3, '박교수', '소프트웨어공학', '소프트웨어공학');
INSERT INTO lecturer_tbl VALUES(4, '우교수', '소프트웨어공학', '알고리즘');
INSERT INTO lecturer_tbl VALUES(5, '최교수', '응용컴퓨터공학', '임베디드 시스템');
INSERT INTO lecturer_tbl VALUES(6, '강교수', '응용컴퓨터공학', '멀티미디어');
INSERT INTO lecturer_tbl VALUES(7, '황교수', '모바일시스템공학', '네트워크');

SELECT lec.name as lecturer_name, cour.name, id, credit, CASE week WHEN 1 THEN '월요일' WHEN 2 THEN '화요일' WHEN 3 THEN '수요일' WHEN 4 THEN '목요일' WHEN 5 THEN '금요일' WHEN 6 THEN '토요일' END AS week, start_hour, end_end FROM lecturer_tbl lec, course_tbl cour WHERE lec.idx = cour.lecturer;