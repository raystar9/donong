insert into member
values (mem_num_seq.nextval, 'dahye', 'dada', '1234', '이다혜', '경기도 부천시 원미구', 123456, 'dahye3059@naver.com', '010-2350-3059', sysdate);

select * from member;

select * from RENTALS;

insert into RENTALS
values (rental_num_seq.nextval, 1, '이다혜', '경기도 부천시 원미구 상동 226-11', '경기도', '부천시', 2400, );

