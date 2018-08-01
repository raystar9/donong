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


select * from goods;

insert into goods values(41, '방울토마토', 6000, 1, '제품 구성 - 종이케이스, 양철화분, 흙+분변토, 설명서, 씨앗','/donong/resource/image/market/seed/s17.jpg');

 commit;
drop table member;

select * from member;

create sequence member_num
start with 1
increment by 1
nomaxvalue;

drop sequence member_num;



