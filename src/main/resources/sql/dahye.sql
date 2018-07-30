drop table rentals cascade constraints;

--회원 테이블
CREATE TABLE member(
num NUMBER CONSTRAINT member_num_pk PRIMARY KEY,
id VARCHAR2(100) UNIQUE NOT NULL,
nickname VARCHAR2(100) UNIQUE NOT NULL,
password VARCHAR2(100) NOT NULL,
realname VARCHAR2(100) NOT NULL,
postnum VARCHAR2(10) NOT NULL,
address VARCHAR2(200) NOT NULL,
addressdetail VARCHAR2(100) NOT NULL,
email VARCHAR2(100) NOT NULL,
emaildomain VARCHAR2(100) NOT NULL,
phone VARCHAR2(15) NOT NULL,
registdate DATE NOT NULL
);

-- 주소에서 '시,도' 테이블
CREATE TABLE sido(
num NUMBER CONSTRAINT sido_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL
);

-- 주소에서 '시,군,구' 테이블
CREATE TABLE sigungu(
num NUMBER CONSTRAINT sigungugungu_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
sido NUMBER CONSTRAINT sigungugungu_sido_fk REFERENCES sido(num) NOT NULL
);

select * from member;
select * from sigungu
drop table rentals;
drop table sigungu;
drop table do;
drop table files;

-- 농지 대여 테이블
CREATE TABLE rentals(
num NUMBER CONSTRAINT rentals_num_pk PRIMARY KEY,
member_num NUMBER CONSTRAINT rental_writer_fk REFERENCES member(num) NOT NULL,
writer VARCHAR(100) NOT NULL,
address varchar2(400) NOT NULL,
title varchar2(100) NOT NULL,
sido NUMBER CONSTRAINT rentals_sido_fk REFERENCES sido(num) NOT NULL,
sigungu NUMBER CONSTRAINT rentals_sigungu_fk REFERENCES sigungu(num) NOT NULL,
area number NOT NULL,
price NUMBER NOT NULL,
content VARCHAR2(4000) NOT NULL,
lat NUMBER,
lng NUMBER
);

drop table rentals;
drop table rentalfiles;
member_num NUMBER CONSTRAINT rental_writer_fk REFERENCES member(num) NOT NULL,

-- 파일 테이블
CREATE TABLE rentalfiles(
num NUMBER CONSTRAINT rental_files_num_pk PRIMARY KEY,
board_num NUMBER CONSTRAINT rental_board_num REFERENCES rentals(num) NOT NULL,			-- 그 테이블의 게시글 번호
filename1 VARCHAR2(200) NOT NULL,
filename2 VARCHAR2(200) ,
filename3 VARCHAR2(200) ,
filename4 VARCHAR2(200) ,
filepath1 VARCHAR2(200) NOT NULL,
filepath2 VARCHAR2(200) ,
filepath3 VARCHAR2(200) ,
filepath4 VARCHAR2(200) 
);

drop sequence do_num_seq;
drop sequence sigungu_num_seq;

CREATE SEQUENCE mem_num_seq
start with 1
increment by 1

CREATE SEQUENCE sido_num_seq
start with 1
increment by 1

CREATE SEQUENCE sigungu_num_seq
start with 1
increment by 1

CREATE SEQUENCE rental_num_seq
start with 1
increment by 1

CREATE SEQUENCE file_num_seq
start with 1
increment by 1

-------------------------------------------------------------------------------------

select * from member;

select * from RENTALS;

select * from sido;

select * from sigungu order by sido;

select * from files;

select * from rentalfiles;

alter table member ADD(addressdetail varchar(100));
----------------------------------------------------------------
insert into sido values (sido_num_seq.nextval, '강원도');
insert into sido values (sido_num_seq.nextval, '경기도');
insert into sido values (sido_num_seq.nextval, '경상남도');
insert into sido values (sido_num_seq.nextval, '광주광역시 ');
insert into sido values (sido_num_seq.nextval, '대구광역시');
insert into sido values (sido_num_seq.nextval, '대전광역시');
insert into sido values (sido_num_seq.nextval, '부산광역시');
insert into sido values (sido_num_seq.nextval, '서울특별시');
insert into sido values (sido_num_seq.nextval, '울산광역시');
insert into sido values (sido_num_seq.nextval, '인천광역시');
insert into sido values (sido_num_seq.nextval, '전라북도');
insert into sido values (sido_num_seq.nextval, '충청북도');
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '춘천시', 1);
insert into sigungu values (sigungu_num_seq.nextval, '원주시', 1);
insert into sigungu values (sigungu_num_seq.nextval, '강릉시', 1);
insert into sigungu values (sigungu_num_seq.nextval, '동해시', 1);
insert into sigungu values (sigungu_num_seq.nextval, '태백시', 1);
insert into sigungu values (sigungu_num_seq.nextval, '속초시', 1);
insert into sigungu values (sigungu_num_seq.nextval, '삼척시', 1);
insert into sigungu values (sigungu_num_seq.nextval, '홍천군', 1);
insert into sigungu values (sigungu_num_seq.nextval, '횡성군', 1);
insert into sigungu values (sigungu_num_seq.nextval, '영월군', 1);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '수원시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '성남시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '의정부시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '안양시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '부천시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '광명시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '평택시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '동두천시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '안산시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '고양시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '과천시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '남양주시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '오산시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '시흥시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '군포시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '의왕시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '하남시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '용인시', 2);
insert into sigungu values (sigungu_num_seq.nextval, '파주', 2);
insert into sigungu values (sigungu_num_seq.nextval, '이천시', 2);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '창원시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '진주시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '통영시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '사천시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '김해시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '밀양시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '거제시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '양산시', 3);
insert into sigungu values (sigungu_num_seq.nextval, '의령군', 3);
insert into sigungu values (sigungu_num_seq.nextval, '함안군', 3);
insert into sigungu values (sigungu_num_seq.nextval, '창녕군', 3);
insert into sigungu values (sigungu_num_seq.nextval, '고성군', 3);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '동구', 4);
insert into sigungu values (sigungu_num_seq.nextval, '서구', 4);
insert into sigungu values (sigungu_num_seq.nextval, '남구', 4);
insert into sigungu values (sigungu_num_seq.nextval, '북구', 4);
insert into sigungu values (sigungu_num_seq.nextval, '광산구', 4);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '중구', 5);
insert into sigungu values (sigungu_num_seq.nextval, '동구', 5);
insert into sigungu values (sigungu_num_seq.nextval, '서구', 5);
insert into sigungu values (sigungu_num_seq.nextval, '남구', 5);
insert into sigungu values (sigungu_num_seq.nextval, '북구', 5);
insert into sigungu values (sigungu_num_seq.nextval, '수성구', 5);
insert into sigungu values (sigungu_num_seq.nextval, '달서구', 5);
insert into sigungu values (sigungu_num_seq.nextval, '달성군', 5);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '중구', 6);
insert into sigungu values (sigungu_num_seq.nextval, '동구', 6);
insert into sigungu values (sigungu_num_seq.nextval, '서구', 6);
insert into sigungu values (sigungu_num_seq.nextval, '유성구', 6);
insert into sigungu values (sigungu_num_seq.nextval, '대덕구', 6);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '중구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '동구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '서구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '남구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '북구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '영도구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '부산진구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '동래구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '해운대구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '사하구', 7);
insert into sigungu values (sigungu_num_seq.nextval, '금정구', 7);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '종로구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '중구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '용산구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '성동구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '광진구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '동대문구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '중랑구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '성북구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '강북구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '도봉구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '노원구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '은평구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '서대문구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '마포구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '양천구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '강서구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '구로구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '금천구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '영등포구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '동작구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '관악구', 8);
insert into sigungu values (sigungu_num_seq.nextval, '서초구', 8);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '중구', 9);
insert into sigungu values (sigungu_num_seq.nextval, '동구', 9);
insert into sigungu values (sigungu_num_seq.nextval, '남구', 9);
insert into sigungu values (sigungu_num_seq.nextval, '북구', 9);
insert into sigungu values (sigungu_num_seq.nextval, '울주군', 9);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '전주시', 11);
insert into sigungu values (sigungu_num_seq.nextval, '군산시', 11);
insert into sigungu values (sigungu_num_seq.nextval, '익산시', 11);
insert into sigungu values (sigungu_num_seq.nextval, '정읍시', 11);
insert into sigungu values (sigungu_num_seq.nextval, '남원시', 11);
insert into sigungu values (sigungu_num_seq.nextval, '김제시', 11);
insert into sigungu values (sigungu_num_seq.nextval, '완주군', 11);
insert into sigungu values (sigungu_num_seq.nextval, '진안군', 11);
insert into sigungu values (sigungu_num_seq.nextval, '무주군', 11);
insert into sigungu values (sigungu_num_seq.nextval, '장수군', 11);
insert into sigungu values (sigungu_num_seq.nextval, '임실군', 11);
insert into sigungu values (sigungu_num_seq.nextval, '순창군', 11);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '중구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '동구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '미추홀구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '연수구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '남동구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '부평구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '계양구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '서구', 10);
insert into sigungu values (sigungu_num_seq.nextval, '강화군', 10);
insert into sigungu values (sigungu_num_seq.nextval, '옹진군', 10);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '청주시', 12);
insert into sigungu values (sigungu_num_seq.nextval, '충주시', 12);
insert into sigungu values (sigungu_num_seq.nextval, '제천시', 12);
insert into sigungu values (sigungu_num_seq.nextval, '보은군', 12);
insert into sigungu values (sigungu_num_seq.nextval, '옥천군', 12);
insert into sigungu values (sigungu_num_seq.nextval, '영동군', 12);
insert into sigungu values (sigungu_num_seq.nextval, '증평군', 12);
insert into sigungu values (sigungu_num_seq.nextval, '진천군', 12);
insert into sigungu values (sigungu_num_seq.nextval, '괴산군', 12);
insert into sigungu values (sigungu_num_seq.nextval, '음성군', 12);
insert into sigungu values (sigungu_num_seq.nextval, '단양군', 12);
----------------------------------------------------------------



