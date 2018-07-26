DROP TABLE notice;
DROP TABLE qna;
DROP TABLE faq;
DROP TABLE cs_category;
DROP TABLE community;
DROP TABLE rentalFiles;
DROP TABLE rentals;
DROP TABLE sigungu;
DROP TABLE sido;
DROP TABLE goodsorders;
DROP TABLE orders;
DROP TABLE cart;
DROP TABLE goods;
DROP TABLE goods_category;
DROP TABLE member;

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

CREATE TABLE goods_category(
num NUMBER PRIMARY KEY,
name VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE goods(
num NUMBER PRIMARY KEY,
name VARCHAR2(100) NOT NULL,
price NUMBER NOT NULL,
category NUMBER CONSTRAINT goods_category_fk REFERENCES goods_category(num) NOT NULL,
title VARCHAR2(100) NOT NULL,
regitdate DATE NOT NULL,
content VARCHAR2(4000) NOT NULL,
filepath VARCHAR2(200)
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
name VARCHAR2(100) NOT NULL,
orderdate DATE NOT NULL,
address VARCHAR2(200) NOT NULL,
phone VARCHAR2(15) NOT NULL,
comments VARCHAR2(300) NOT NULL,
waybill number,
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
title varchar2(100) NOT NULL,
sido NUMBER CONSTRAINT rentals_sido_fk REFERENCES sido(num) NOT NULL,
sigungu NUMBER CONSTRAINT rentals_sigungu_fk REFERENCES sigungu(num) NOT NULL,
area number NOT NULL,
price NUMBER NOT NULL,
content VARCHAR2(4000) NOT NULL,
lat NUMBER,
lng NUMBER
);

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

CREATE TABLE community(
num NUMBER CONSTRAINT community_num_pk PRIMARY KEY,
member_num NUMBER CONSTRAINT community_writer_fk REFERENCES member(num) NOT NULL,
writer VARCHAR(100) NOT NULL,
password VARCHAR2(100) NOT NULL,
subject VARCHAR2(200) NOT NULL,
category VARCHAR2(50) NOT NULL,
content VARCHAR2(4000) NOT NULL,
regitdate DATE NOT NULL,
readcount NUMBER NOT NULL,
re_ref NUMBER NOT NULL,
re_lev NUMBER NOT NULL,
re_seq NUMBER NOT NULL,
filename VARCHAR2(200),
filepath VARCHAR2(200)
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