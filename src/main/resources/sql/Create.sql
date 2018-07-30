
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

alter table notice modify (content long);

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
insert into faq values(1, 3, '교환상품 배송지연으로 배송지연 보상을 받을수 있나요.', '<p><img id="preview" src="https://help.11st.co.kr/servlet/DownLoadAttach?fileInfo=KTllLV9rTGNCS0JsMEJDLksvfERfK3kjQC5lNC9dQ3kyL2VCWlwqYCE0bEp8XCgtIU0zTF5NbTRr%0AN3xjeUEtbjJEYGxtIWwsay80N31dKj8rfWBsbjJ7Tik4TFhOKS5DRCNKY3xcP3pfTmNMRTMmLClO%0AXTMrKSQufi9lQDI2JG5%2BXmU0akR7eTI6ZUw6fiUjTV5sWDtLNV1FTko%3D" width="20" height="20" align="absmiddle"><font size="4" color="#e95d00"><strong>교환상품 배송지연 보상제 불가</strong></font><img id="preview" alt="e¨¸e|￢e§？e？？" src="https://help.11st.co.kr/servlet/DownLoadAttach?fileInfo=KTllLV9rTGNCS0JsMEJDLksvfERfK3kjQC5lNC9dQ3kyL2VCWlwqIyE1bEp8XCgtIU0zTF5NbTRr%0AN3xjeUEtXTJFYGxtIWwsay80N31dKj8rfWBsbjJ7Tik4TFhOKS5DRCNKY3xcP3pfTmNMRTMmLClO%0AXTMrKSQufi9lQDI2P246XmM0akR7eTI6ZUw6fiUjTV5sWDtLal1BTko%3D" width="20" height="20" align="absmiddle"></p><p>&nbsp;</p><p>&nbsp;</p><p><a target="_blank" href="http://www.11st.co.kr/browsing/MembershipBenefitPlace.tmall?method=getCompensationBenefit&amp;addCtgrNo=952022&amp;tabIdx=4"><img id="preview" alt="e°？e¡？e°？e¸°" src="https://help.11st.co.kr/servlet/DownLoadAttach?fileInfo=KTllLV9rTGNCS0JsMEJDLksvfERfK3kjQC5lNC9dQ3kyL2VCWlwqeSF9bC18XH0jIV4zLTVNKjRr%0AN3xjeUEtZTIpYGNtS2wsay80N31dKjorO2BsbjJ7MSltTGBOa3h7RCEzfCtcbnpcTjFMRTMwLERO%0AXTMrKSQufi9uQDQ2YG5%2BXmM0akR7eTI6ZUx5fi0jQV4xWCtLYl1BTjM%3D" width="71" height="20" align="absmiddle">&nbsp;<font color="#d40a00"><strong>배송지연 보상제 </strong></font></a></p><p>&nbsp;</p><p>&nbsp;</p><p><font color="#767173">배송지연 보상제는&nbsp;구매한 상품이&nbsp;결제일 +3영업일 이내에 배송받지 못한 경우&nbsp;</font></p><p><font color="#767173">4일 차부터 쿠폰으로 보상하는 제도입니다. </font></p><p>&nbsp;</p><p><font color="#767173">교환상품은 배송이 지연되더라도 보상이 어려운 점 양해 부탁드립니다.</font></p><p><font color="#767173"></font>&nbsp;</p><p>&nbsp;</p>', 0);

insert into faq values(2, 1, '전담 고객센터 연락처를 알고 싶어요.', '<title>제목 없음</title><style>P { margin : 0px } </style>
<p><font face="맑은 고딕" color="#329F2B"><span style="font-size:11pt;"><b>√ 
전담 고객센터 번호</b></span></font><font face="맑은 고딕"><span style="font-size:10pt;"><br>&nbsp;</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">01. 구매고객 : 1566-5701 
/ 평일 오전9시~오후6시<br>02. 판매고객 : 1566-5707 / 평일 오전9시~오후6시</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">03. 스마일배송 : 1644-5718</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">04. 스마일클럽 : 1522-5700 
/ 오전9시~오후6시 (연중무휴)</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">05. 스마일페이 : 1644-0739 
/ 오전9시~오후11시 (연중무휴)</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">06. 스마일박스 : 1644-5713</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">07. </span></font><a href="http://www.g9.co.kr/" target="_blank"><span style="font-size:10pt;"><font face="맑은 고딕" color="blue"><u>G9</u></font></span></a><font face="맑은 고딕"><span style="font-size:10pt;"> 
: 1644-5702</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">08. </span></font><a href="http://bizon.gmarket.co.kr/" target="_blank"><span style="font-size:10pt;"><font face="맑은 고딕" color="blue"><u>비즈온</u></font></span></a><font face="맑은 고딕"><span style="font-size:10pt;"> 
: 1588-2194</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">09.<a href="http://category.gmarket.co.kr/listview/LTicket.asp" target="_blank"> </a></span></font><a href="http://category.gmarket.co.kr/listview/LTicket.asp" target="_blank"><span style="font-size:10pt;"><font face="맑은 고딕" color="blue"><u>E-티켓</u></font></span></a><font face="맑은 고딕"><span style="font-size:10pt;"> 
: 1566-5702</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">10. </span></font><a href="http://gtour.gmarket.co.kr/" target="_blank"><span style="font-size:10pt;"><font face="맑은 고딕" color="blue"><u>국내/해외여행</u></font></span></a><font face="맑은 고딕"><span style="font-size:10pt;"> 
: 1566-5705</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">11. 모바일전용 : 1644-5715</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">12. 렌탈전용 : 1644-5715</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">13. 배달전용 : 1566-5708 
/ 오전10시~24시</span></font></p>
<p><font face="맑은 고딕"><span style="font-size:10pt;">14. 해외배송 : 02-6277-6700</span></font><span style="font-size:9pt;"><b><font face="맑은 고딕"><br></font></b></span></p>', 0);
insert into faq values(3, 1, '', 0);
insert into faq values(4, 1, '', 0);
insert into faq values(5, 1, '', 0);
insert into faq values(6, 1, '', 0);
insert into faq values(7, 1, '', 0);
insert into faq values(8, 1, '', 0);
insert into faq values(9, 1, '', 0);
insert into faq values(10, 1, '', 0);
insert into faq values(11, 1, '', 0);
insert into faq values(12, 1, '', 0);
insert into faq values(13, 1, '', 0);
insert into faq values(14. 1, '', 0);
insert into faq values(15, 1, '', 0);
insert into faq values(16, 1, '', 0);
insert into faq values(17, 1, '', 0);
insert into faq values(18, 1, '', 0);
insert into faq values(19, 1, '', 0);
insert into faq values(20, 1, '', 0);
insert into faq values(21, 1, '', 0);
insert into faq values(22, 1, '', 0);
insert into faq values(23, 1, '', 0);
insert into faq values(24, 1, '', 0);
insert into faq values(25, 1, '', 0);
insert into faq values(26, 1, '', 0);
insert into faq values(27, 1, '', 0);
insert into faq values(28, 1, '', 0);
insert into faq values(29, 1, '', 0);
insert into faq values(30, 1, '', 0);
insert into faq values(31, 1, '', 0);




truncate table faq;
truncate table qna;
truncate table cs_category;
truncate table notice;