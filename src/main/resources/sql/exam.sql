insert into member
values (mem_num_seq.nextval, 'dahye', 'dada', '1234', '이다혜', 123456, '경기도 부천시 원미구', '금강시티빌 111-111', 'dahye3059', 'naver.com', '010-2350-3059', sysdate);

select * from member;

truncate table rentals;
truncate table rentalFiles; 

select * from SIGUNGU
where name = '이문동';

select * from RENTALS;

insert into RENTALS
values (rental_num_seq.nextval, 1, '이다혜', '경기도 부천시 원미구 상동 226-11', '경기도', '부천시', 2400, );

select * from RENTALFILES

select * from RENTALFILES;

select num, id, nickname, realname, postnum, address, addressdetail, email, emaildomain, phone, registdate
		from member 
		where num = 2
		
select * from rentalFiles;

INSERT INTO


	INSERT INTO rentals
  	VALUES (rental_num_seq.nextval, 2, '이다혜', '대한민국 경기도 부천시', '경기도 부천시', 
  		    2, 15, 2400, 10000000, '장소가좋아요^^', 24, 24);
  		    
  		    SELECT max(num) 
  		FROM rentals
  		WHERE member_num = 2

CREATE SEQUENCE rental_num_seq
start with 1
increment by 1  	

select * from sido;
select * from sigungu;

select num
from sido
where name like '%강원도%'

select * from RENTALS;

select sido.num, sigungu.num
from sido , sigungu
where sido.name = '경기도'
and sigungu.name = '부천시';

SELECT sido.num as sido, sigungu.num as sigunu
	FROM sido , sigungu
	WHERE sido.name = '경기도'
	AND sigungu.name = '부천시';
	
	SELECT sido.num as sido
	FROM sido
	WHERE sido.name like '%경기도%'	
  		    
	delete from rentals cascade constraints;
  		    
 SELECT max(num) 
  		FROM rentals
  		WHERE member_num = 2 	
  		
select * from rentals;

select filepath1
from RENTALFILES

select * from RENTALS
where num = 53;

select filepath1, filepath2, filepath3, filepath4  from RENTALFILES
where board_num = #{num};
  		    
select * from sigungu;
select * from rentalFiles;

select * from sido;