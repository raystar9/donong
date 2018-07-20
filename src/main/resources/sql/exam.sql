insert into member
values (mem_num_seq.nextval, 'dahye', 'dada', '1234', '이다혜', 123456, '경기도 부천시 원미구', '금강시티빌 111-111', 'dahye3059', 'naver.com', '010-2350-3059', sysdate);

select * from member;

select * from RENTALS;

insert into RENTALS
values (rental_num_seq.nextval, 1, '이다혜', '경기도 부천시 원미구 상동 226-11', '경기도', '부천시', 2400, );

select * from RENTALFILES

select * from RENTALFILES;

select num, id, nickname, realname, postnum, address, addressdetail, email, emaildomain, phone, registdate
		from member 
		where num = 2
		
select * from rentalFiles;

	INSERT INTO rentals
  	VALUES (rental_num_seq.nextval, 2, #{writer}, #{address}, #{title}, 
  		    #{sido}, #{sigungu}, #{area}, #{price}, #{content}, #{lat}, #{lng});
  		    
  		    SELECT max(num) 
  		FROM rentals
  		WHERE member_num = 2

CREATE SEQUENCE rental_num_seq
start with 1
increment by 1  	

select * from sido;

select num
from sido
where name like '%강원도%'
  		    
  		    
  		    
  		    