insert into member values(1,'1','1','1','1','1','1','1','1','1','1',sysdate);

insert into community values(1,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(2,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(3,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(4,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(5,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(6,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(7,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(8,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(9,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(10,1,'admin','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(11,1,'admin','1111','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(12,1,'admin','1111','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(12,1,'admin','1111','제목','잡담','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(13,1,'admin','1111','제목','정보','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(14,1,'admin','1111','제목','정보','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(15,1,'admin','1111','제목','모임','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(16,1,'admin','1111','제목','모임','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(17,1,'admin','1111','제목','질문','내용',sysdate,1,0,0,0,'s.png','s.png');
insert into community values(18,1,'admin','1111','제목','질문','내용',sysdate,1,0,0,0,'s.png','s.png');

drop table community;
select * from COMMUNITY where category ='모임';

select * from COMMUNITY ;

            
drop sequence community_num_seq;
create sequence community_num_seq1
increment by 1 start with 1

update community
		set
		subject='gd', content='gd'
		where num= 21;