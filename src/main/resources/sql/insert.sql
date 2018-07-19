INSERT INTO member VALUES(1, 'admin', 'admin', '1234', '구명회', '12202', '경기도 남양주시', '와부읍', 'raystar9', 'naver.com', '010-9195-0999', '2018-07-15');
INSERT INTO member VALUES(2, 'gildong12', 'Hong', '1234', '홍길동', '12202', '서울시 성동구', '왕십리동',  'gildong', 'naver.com', '010-1234-5678', '2018-07-13');

INSERT INTO goods_category VALUES(1, 'seed');
INSERT INTO goods_category VALUES(2, 'fertilizer');
INSERT INTO goods_category VALUES(3, 'tool');

INSERT INTO goods VALUES (1, '모종삽',1000, 3,  '철제 모종삽', '2018-07-19', '쉽게 망가지지 않는 강인한 모종삽입니다.', '/donong/resources/image/market/tools/tool1.jpg');
INSERT INTO goods VALUES (2, '물뿌리개',3000, 3,  '청색 표준 물뿌리개', '2018-07-18', '흔히 볼 수 있는 청색 물뿌리개입니다.', '/donong/resources/image/market/tools/tool2.jpg');
INSERT INTO goods VALUES (3, '화분(중)',5000, 3,  '300x1200 화분', '2018-07-18', '중형 크기의 화분입니다.', '/donong/resources/image/market/tools/tool3.jpg');

INSERT INTO cart VALUES(1, 1, 1, 2);
INSERT INTO cart VALUES(2, 2, 1, 1);
INSERT INTO cart VALUES(3, 3, 2, 5);

INSERT INTO orders VALUES(1, 1, 'npay');
INSERT INTO orders VALUES(2, 1, 'prep');

INSERT INTO goodsorders VALUES(1, 3, 5);
INSERT INTO goodsorders VALUES(1, 2, 1);
INSERT INTO goodsorders VALUES(2, 1, 2);
INSERT INTO goodsorders VALUES(2, 2, 1);
