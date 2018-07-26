
DROP TABLE qna;
DROP TABLE faq;
DROP TABLE cs_category;
DROP TABLE community;
DROP TABLE files;
DROP TABLE rentals;
DROP TABLE si;
DROP TABLE do;
DROP TABLE goodsorders;
DROP TABLE orders;
DROP TABLE cart;
DROP TABLE goods;
DROP TABLE goods_category;
DROP TABLE member;
DROP TABLE notice;

CREATE TABLE member(
num NUMBER CONSTRAINT member_num_pk PRIMARY KEY,
id VARCHAR2(100) UNIQUE NOT NULL,
nickname VARCHAR2(100) UNIQUE NOT NULL,
password VARCHAR2(100) NOT NULL,
realname VARCHAR2(100) NOT NULL,
address VARCHAR2(200) NOT NULL,
postcode NUMBER NOT NULL,
email VARCHAR2(100) NOT NULL,
phone VARCHAR2(15) NOT NULL,
registdate DATE NOT NULL
);

CREATE TABLE goods_category(
num NUMBER PRIMARY KEY,
name VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE goods(
num NUMBER PRIMARY KEY,
name VARCHAR2(100) NOT NULL,
category NUMBER CONSTRAINT goods_category_fk REFERENCES goods_category(num) NOT NULL,
title VARCHAR2(100) NOT NULL,
regitdate DATE NOT NULL,
content VARCHAR2(4000) NOT NULL
);

CREATE TABLE cart(
num NUMBER CONSTRAINT cart_num_pk PRIMARY KEY,
goods_num NUMBER CONSTRAINT cart_goods_num_fk REFERENCES goods(num) NOT NULL,
member_num NUMBER CONSTRAINT cart_member_num_fk REFERENCES member(num) NOT NULL,
quantity NUMBER NOT NULL
);

CREATE TABLE orders(
num NUMBER CONSTRAINT order_num_pk PRIMARY KEY,
member_num NUMBER CONSTRAINT order_member_num_fk REFERENCES member(num) NOT NULL,
status varchar2(20) NOT NULL
);

CREATE TABLE goodsorders(
order_num NUMBER CONSTRAINT goodsorders_order_num_fk REFERENCES orders(num) NOT NULL,
goods_num NUMBER CONSTRAINT goodsorders_goods_num_fk REFERENCES goods(num) NOT NULL,
quantity NUMBER,
PRIMARY KEY(order_num, goods_num)
);

CREATE TABLE sido(
num NUMBER CONSTRAINT sido_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL
);

CREATE TABLE sigungu(
num NUMBER CONSTRAINT sigungu_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
sido NUMBER CONSTRAINT sigungu_sido_fk REFERENCES sido(num) NOT NULL
);

CREATE TABLE rentals(
num NUMBER CONSTRAINT rentals_num_pk PRIMARY KEY,
member_num NUMBER CONSTRAINT rental_writer_fk REFERENCES member(num) NOT NULL,
writer VARCHAR(100) NOT NULL,
address varchar2(400) NOT NULL,
sido NUMBER CONSTRAINT rentals_sido_fk REFERENCES sido(num) NOT NULL,
sigungu NUMBER CONSTRAINT rentals_sigungu_fk REFERENCES sigungu(num) NOT NULL,
area number NOT NULL,
price NUMBER NOT NULL,
content VARCHAR2(4000) NOT NULL,
lat NUMBER,
lng NUMBER
);

CREATE TABLE files(
num NUMBER CONSTRAINT rental_files_num_pk PRIMARY KEY,
board_name VARCHAR2(30) NOT NULL,
board_num NUMBER NOT NULL,
filename VARCHAR2(200) NOT NULL,
filepath VARCHAR2(200) NOT NULL
);

CREATE TABLE community(
num NUMBER CONSTRAINT community_num_pk PRIMARY KEY,
member_num NUMBER CONSTRAINT community_writer_fk REFERENCES member(num) NOT NULL,
writer VARCHAR(100) NOT NULL,
password VARCHAR2(100) NOT NULL,
subject VARCHAR2(200) NOT NULL,
category VARCHAR2(50) NOT NULL,
content VARCHAR2(4000) NOT NULL,
regitdate DATE NOT NULL,
readcount NUMBER,
re_ref NUMBER,
re_lev NUMBER,
re_seq NUMBER
);

CREATE TABLE cs_category(
num NUMBER CONSTRAINT cs_category_num_pk PRIMARY KEY,
name VARCHAR2(50) NOT NULL
);

CREATE TABLE faq(
num NUMBER CONSTRAINT faq_num_pk PRIMARY KEY,
category NUMBER CONSTRAINT faq_category_fk REFERENCES cs_category(num) NOT NULL,
title VARCHAR2(200) NOT NULL,
content VARCHAR2(4000) NOT NULL,
readcount number
);

CREATE TABLE qna(
num NUMBER CONSTRAINT qna_num_pk PRIMARY KEY,
category NUMBER CONSTRAINT qna_category_fk REFERENCES cs_category(num) NOT NULL, 
writer NUMBER CONSTRAINT qna_writer_fk REFERENCES member(num) NOT NULL,
title VARCHAR2(200) NOT NULL,
content varchar2(4000) NOT NULL,
regitdate DATE NOT NULL,
answer varchar2(4000),
ansdate DATE,
state varchar2(20)
);

CREATE TABLE notice(
num NUMBER CONSTRAINT notice_num_pk PRIMARY KEY,
title VARCHAR2(200) NOT NULL,
content VARCHAR2(4000) NOT NULL,
regitdate DATE NOT NULL
);


insert into member values(1, 'admin', 'admin', '1111', 'admin', '서울시 중구 남대문로 120 kh정보교육원', '02879', 'admin@donong.com', '010-1234-1234', sysdate);
insert into member values(2, 'user1', 'user1', '1111', 'user1', '서울시 중구 남대문로 120 kh정보교육원', '02879', 'user1@donong.com', '010-1234-1234', sysdate);
alter table qna add(state varchar2(20));
alter table faq modify(readcount number default 0);
insert into faq values(2, 2, 'test', 'test');
insert into qna (num, category, writer, title, content, regitdate, state) values (1, 1, 1, 'abc', 'abc', sysdate, '답변 대기');
select * from CS_CATEGORY;
insert into CS_CATEGORY values(1, '고객정보');
insert into CS_CATEGORY values(2, '주문/결제');
insert into CS_CATEGORY values(3, '배송');
insert into CS_CATEGORY values(4, '상품/상품평');
insert into CS_CATEGORY values(5, '취소');
insert into CS_CATEGORY values(6, '반품');
insert into CS_CATEGORY values(7, '교환');
insert into CS_CATEGORY values(8, '이벤트/제휴/기타');
insert into CS_CATEGORY values(9, '고객의소리');
insert into NOTICE values(2, 'test', 'test', sysdate);
insert into NOTICE values(3, 'test', 'test', sysdate);
insert into NOTICE values(4, 'test', 'test', sysdate);
insert into NOTICE values(5, 'test', 'test', sysdate);
insert into NOTICE values(6, 'test', 'test', sysdate);
insert into NOTICE values(7, 'test', 'test', sysdate);
insert into NOTICE values(8, 'test', 'test', sysdate);
insert into NOTICE values(9, 'test', 'test', sysdate);
insert into NOTICE values(10, 'test', 'test', sysdate);
insert into NOTICE values(11, 'test', 'test', sysdate);
insert into NOTICE values(12, 'test', 'test', sysdate);
insert into NOTICE values(13, 'test', 'test', sysdate);
insert into NOTICE values(14, 'test', 'test', sysdate);
insert into NOTICE values(15, 'test', 'test', sysdate);
insert into NOTICE values(16, 'test', 'test', sysdate);
insert into NOTICE values(17, 'test', 'test', sysdate);
insert into NOTICE values(18, 'test', 'test', sysdate);
insert into NOTICE values(19, 'test', 'test', sysdate);
insert into NOTICE values(20, 'test', 'test', sysdate);
insert into NOTICE values(21, 'test', 'test', sysdate);
insert into NOTICE values(22, 'test', 'test', sysdate);
insert into faq values(1, 1, 'test', 'test', 0);
insert into faq values(2, 1, 'test', 'test', 0);
insert into faq values(3, 2, 'test', 'test', 0);
insert into faq values(4, 2, 'test', 'test', 0);
insert into faq values(5, 3, 'test', 'test', 0);
insert into faq values(6, 3, 'test', 'test', 0);
insert into faq values(7, 4, 'test', 'test', 0);
insert into faq values(8, 5, 'test', 'test', 0);
insert into faq values(9, 5, 'test', 'test', 0);
insert into faq values(10, 6, 'test', 'test', 0);
insert into faq values(11, 6, 'test', 'test', 0);
insert into faq values(12, 7, 'test', 'test', 0);

