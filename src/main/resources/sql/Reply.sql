create table reply(
rno number not null, /*댓글번호*/
num number references community(num) ,/*게시글 번호*/
replytext varchar2(100), /*댓글 내용*/
replyer varchar2(50), /*댓글 작성자*/
userName varchar2(50), /*회원 이름*/
regdate date, /*댓글 작성일자*/
updatedate date /*댓글 수정일자*/
);

CREATE TABLE COMMUNITY_REPLY(
num NUMBER CONSTRAINT community_reply_num_pk PRIMARY KEY,
community_num NUMBER REFERENCES community(num) NOT NULL,
member_num NUMBER REFERENCES member(num) NOT NULL,
replyer VARCHAR2(100) NOT NULL,
contents VARCHAR2(300) NOT NULL,
regdate DATE NOT NULL,
updatedate DATE
)

create sequence reply_seq
increment by 1 start with 1

select * from reply;
drop table reply;

select rno, num, replytext, replyer, userName, regdate, updatedate
	from reply  
	where  num= 74
	order by rno;

select rno, r.num, replytext, replyer, r.userName, r.regdate, r.updatedate
from reply r, community c 
where replyer = writer;

select * from REPLY;
select * from community_reply;