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

select * from orders where member_num=1;
select * from member;
select * from goods;

select num, subject, regitdate from COMMUNITY where member_num=1 and rownum<=5 order by num desc

update goods set filepath='/donong/resources/image/market/fertilizer/f7.jpg' where num=7;

update goods set content='철재재질 관목용 삽입니다.' where num=53;

select filepath from goods as of timestamp(systimestamp-interval '15'minute);

select * from community

ROLLBACK;
select * from goods;

create sequence member_num
start with 1
increment by 1
nomaxvalue;

drop sequence member_num;



