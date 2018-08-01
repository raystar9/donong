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

insert into goods values(23, '인터팜 과일나라', 9200, 2, '인터팜 과일나라',sysdate, '황산칼리가 함유되어 맛, 때깔, 향기, 저장성을 증대','/donong/resource/image/market/fertilizer/f20.jpg');
commit;
drop table member;

select * from member;

create sequence member_num
start with 1
increment by 1
nomaxvalue;

drop sequence member_num;



