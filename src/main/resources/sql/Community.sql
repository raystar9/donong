create table com (
com_num number primary key,/*글의 번호*/
com_id varchar2(20) not null,/*ID*/
com_pass varchar2(20) not null,/*비밀번호*/
com_name varchar2(20) not null,/*이름*/
com_subject varchar2(100) not null,/*제목*/
com_class varchar2(30) not null,/*분류*/
com_cont varchar2(300) not null,/*내용*/
com_date date not null,/*날짜*/
com_readcount number not null,/*조회수*/
com_file varchar2(30),/*파일 첨부*/
com_re_ref number,/*답변글 번호*/
com_re_lev number,/*답변글 레벨*/
com_re_seq number/*답변글 레벨 순서*/
);
create sequence com_num_seq
increment by 1 start with 1

insert into com (com_num,com_id,com_pass,com_name,
com_subject,com_class,com_cont,com_date,com_readcount,
com_file,com_re_ref,com_re_lev,com_re_seq) values(1,'admin',
1234,'admin','hi','정보','안녕',sysdate,0,0,0,0,0);