CREATE TABLE member(
num	NUMBER CONSTRAINT member_num_pk PRIMARY KEY,
id	VARCHAR2(100) UNIQUE NOT NULL,
nickname VARCHAR2(100) UNIQUE NOT NULL,
password VARCHAR2(100) NOT NULL,
realname VARCHAR2(100) NOT NULL,
address VARCHAR2(200) NOT NULL,
postcode NUMBER NOT NULL,
email	VARCHAR2(100) NOT NULL,
phone	VARCHAR2(15) NOT NULL,
registdate DATE NOT NULL
);

CREATE TABLE goods_category(
num	NUMBER PRIMARY KEY,
name	VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE goods(
num NUMBER PRIMARY KEY,
name VARCHAR2(100) NOT NULL,
category NUMBER CONSTRAINT goods_category_fk REFERENCES goods_category(num) NOT NULL,
writer NUMBER CONSTRAINT goods_writer_fk REFERENCES member(num) NOT NULL,
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
goods_num NUMBER CONSTRAINT order_goods_num_fk REFERENCES goods(num) NOT NULL,
member_num NUMBER CONSTRAINT order_member_num_fk REFERENCES member(num) NOT NULL,
quantity NUMBER NOT NULL,
status varchar2(20) NOT NULL
);

CREATE TABLE do(
num NUMBER CONSTRAINT do_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL
);

CREATE TABLE si(
num NUMBER CONSTRAINT si_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
do NUMBER CONSTRAINT si_do_fk REFERENCES do(num) NOT NULL
);

CREATE TABLE rentals(
num NUMBER CONSTRAINT rentals_num_pk PRIMARY KEY,
writer NUMBER CONSTRAINT rentals_writer_fk REFERENCES member(num) NOT NULL,
address varchar2(400) NOT NULL,
do NUMBER CONSTRAINT rentals_do_fk REFERENCES do(num) NOT NULL,
si NUMBER CONSTRAINT rentals_si_fk REFERENCES si(num) NOT NULL,
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
writer NUMBER CONSTRAINT community_writer_fk REFERENCES member(num) NOT NULL,
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
content VARCHAR2(4000) NOT NULL
);

CREATE TABLE qna(
num NUMBER CONSTRAINT qna_num_pk PRIMARY KEY,
category NUMBER CONSTRAINT qna_category_fk REFERENCES cs_category(num) NOT NULL, 
writer NUMBER CONSTRAINT qna_writer_fk REFERENCES member(num) NOT NULL,
title VARCHAR2(200) NOT NULL,
content varchar2(4000) NOT NULL
);


