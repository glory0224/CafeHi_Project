-- 테이블 컬럼 조회

select * from tab;
select * from cafehi_member;
select * from cafehi_member_auth;
select * from cafehi_qna;
select * from cafehi_membership;
select * from my_membership;
select * from cafehi_menu;
select * from cafehi_cart;
select * from cafehi_order;
select * from cafehi_order_menu;
select * from cafehi_coupon;
select * from cafehi_mem_coupon;


-- 테이블 컬럼 타입 조회

desc cafehi_member;
desc cafehi_member_auth;
desc cafehi_qna;
desc cafehi_menu;
desc cafehi_cart;
desc cafehi_membership;
desc cafehi_order;
desc cafehi_order_menu;
desc cafehi_coupon;
desc cafehi_mem_coupon;

-- 테이블 컬럼 제거

delete cafehi_member;
delete cafehi_member_auth;
delete my_membership;
delete cafehi_admin;
delete cafehi_qna;
delete cafehi_menu;
delete cafehi_cart;

commit;

rollback;


-- 삭제
drop table cafehi_mem_coupon;
drop table cafehi_coupon;
drop table cafehi_order_menu;
drop table cafehi_order;
drop table cafehi_cart;
drop table cafehi_menu;
drop table my_membership;
drop table cafehi_membership;
drop table cafehi_qna;
drop table cafehi_member_auth;
drop table cafehi_member;



-- 사용자 정보 테이블
create table cafehi_member(
    member_code number primary key,
    member_id varchar2(50) not null,   
    member_pw varchar2(100) not null,
    member_name varchar2(50) not null,
    member_contact varchar2(15) not null,
    member_email varchar2(50) not null, -- 사용자 계정 인증용
    member_road_address varchar2(100),
    member_jibun_address varchar2(100),
    member_detail_address varchar2(100),
    enabled char(1) default '1'
);

-- 테스트용 관리자 계정

insert into cafehi_member values(0, 'admin', 'admin', '관리자', '01012341234', 'admin@naver.com', '서울 강남', '강남로', '비밀',1 );
insert into cafehi_member_auth values(0, 0, 'ROLE_ADMIN');

commit;

-- 사용자 정보 권한 테이블
create table cafehi_member_auth(
    member_auth_code number primary key,
    member_code number not null,
    member_auth varchar2(50) not null,
    constraint fk_member_auth foreign key(member_code) references cafehi_member(member_code) on delete cascade
);


--  QnA 게시판 
create table cafehi_qna(
    qna_num number primary key,
    qna_title varchar2(200) not null,
    classification varchar2(50),
    qna_content varchar2(500) not null,
    qna_writetime Date not null,
    qna_hit number not null,
    upload_path varchar2(500),
    store_file_name varchar2(300),
    upload_file_name varchar2(100),
    member_code number not null,
    constraint fk_qna_member_code foreign key(member_code) references cafehi_member (member_code) on delete cascade 
);

-- 멤버쉽 분류
create table cafehi_membership(
    membership_code number primary key,
    membership_grade varchar2(15) not null
);


insert into cafehi_membership values(01, 'standard');
insert into cafehi_membership values(02, 'silver'); 
insert into cafehi_membership values(03, 'gold'); 
insert into cafehi_membership values(04, 'vip'); 

commit;

-- 나의 멤버쉽 
create table my_membership(
    my_membership_code number not null primary key, 
    membership_code number not null,
    constraint fk_my_membership_code foreign key(membership_code) references cafehi_membership (membership_code),
    member_code  number not null, 
    constraint fk_my_membership_member_code foreign key(member_code) references cafehi_member (member_code) on delete cascade,
    membership_point number default 0 not null
);


-- 메뉴 카테고리
--create table cafehi_menu_category(
--    category_name varchar2(50) not null,
--    category_type varchar2(30),
--    category_code number primary key,
--    category_sub_code number,
--    constraint fk_sub_category_code foreign key(category_sub_code) references cafehi_menu_category(category_code)
--    
--);
--
--alter table cafehi_menu_category drop constraint fk_sub_category_code;
--alter table cafehi_menu drop constraint fk_menu_category_code;
--
--select * from cafehi_menu_category;
--
---- 상위 카테고리와 서브 카테고리 이용 방식 (테이블 확장성을 높이고자)
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 커피 메뉴', 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('아메리카노', 'coffee', 101, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('에스프레소','coffee', 102, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('유자메리카노','coffee', 103, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('샷추가','coffee', 104, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('리필','coffee', 105, 100);
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 콜드브루 메뉴', 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('콜드브루', 'coldbrew', 201, 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('콜드브루 라떼', 'coldbrew', 202, 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('아인슈페너', 'coldbrew', 203, 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('콜드브루(병)', 'coldbrew', 204, 200);
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 라떼 메뉴', 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('바닐라 라떼', 'latte', 300, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('아이스크림 라떼', 'latte', 301, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('카페모카', 'latte', 302, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('헤이즐넛 라떼', 'latte', 303, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('돌체 라떼', 'latte', 304, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('유자비앙코', 'latte', 305, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('카라멜 마끼아또', 'latte', 306, 300);
--
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 스무디 메뉴', 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('모카 프라푸치노', 'smoothie', 401, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('카라멜 프라푸치노', 'smoothie', 402, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('그린티 프라푸치노', 'smoothie', 403, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('요거트 스무디', 'smoothie', 404, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('구름 요거트 스무디', 'smoothie', 405, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('딸기 요거트 스무디', 'smoothie', 406, 400);
--
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 사이드 메뉴', 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('크로와상', 'side', 501, 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('생크림 크로플', 'side', 502, 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('브라운 치즈 크로플', 'side', 503, 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('아이스크림 크로플', 'side', 504, 500);
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 음료 메뉴', 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('그린티 라떼', 'beverage', 601, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('초코 라떼', 'beverage', 602, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('딸기 라떼', 'beverage', 603, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('베리베리 라떼', 'beverage', 604, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('패션 후르츠 에이드', 'beverage', 605, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('레몬에이드', 'beverage', 606, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('청귤에이드', 'beverage', 607, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('자몽에이드', 'beverage', 608, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('블루레몬에이드', 'beverage', 609, 600);
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 과일주스 메뉴', 700);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('수박 쥬스', 'fruitJuice', 701, 700);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('토마토 쥬스', 'fruitJuice', 702, 700);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('바나나 쥬스', 'fruitJuice', 703, 700);
--
--insert into cafehi_menu_category(category_name,category_code) values('카페하이 차 메뉴', 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('카모마일 차', 'tea', 801, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('페퍼민트 차', 'tea', 802, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('로즈마리 차', 'tea', 803, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('로즈플라워 차', 'tea', 804, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('우롱 차', 'tea', 805, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('허니자몽블랙티', 'tea', 806, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('이슬차(수국)', 'tea', 807, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('아이스티', 'tea', 808, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('유자차', 'tea', 809, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('오렌지자몽차', 'tea', 810, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('생강차', 'tea', 811, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('레몬차', 'tea', 812, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('베리차', 'tea', 813, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('청귤차', 'tea', 814, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('자몽차', 'tea', 815, 800);
--
--commit;


-- 메뉴
create table cafehi_menu(
    menu_code number primary key,
--    category_code number not null,
--    constraint fk_menu_category_code foreign key(category_code) references cafehi_menu_category(category_code),
    menu_price number not null,
    menu_type varchar2(50) not null,
    menu_name varchar2(50) not null,
    menu_explain varchar2(100) not null, 
    menu_img_path varchar2(200) not null,
    menu_count number default 0 not null
);

-- 카테고리와 메뉴 조인 
--select cmc.category_code, cmc.category_name, cmc.category_type, cm.menu_explain, cm.menu_img_path, cm.menu_count  
--from cafehi_menu_category cmc, cafehi_menu cm 
--where cmc.category_code = cm.category_code;

--insert into cafehi_menu values(01, 100, 3000, '카페하이 아메리카노', '/cafeHi/img/menu/coffee/IceAmericano.jpg',0);
--insert into cafehi_menu values(02, 100, 3000, '카페하이 에스프레소', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(03, 100, 4500, '카페하이 유자메리카노', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(04, 100, 500, '카페하이 샷추가', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(05, 100, 1000,'카페하이 리필', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(06, 200, 4500,'카페하이 콜드브루', '/cafeHi/img/menu/coffee/ColdBrew.JPG',0);
--insert into cafehi_menu values(07, 200, 5000, '카페하이 스페셜티(싱글원두)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(08, 200, 5000, '카페하이 콜드브루 라떼', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(09, 200, 5500, '카페하이 아인슈페너', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(10, 200, 15000, '카페하이 콜드 브루(병)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(11, 300, 5000, '카페하이 바닐라 라떼', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG',0);
--insert into cafehi_menu values(12, 300, 6000, '카페하이 아이스크림 라떼', '/cafeHi/img/menu/latte/IceCreamLatte.JPG',0);
--insert into cafehi_menu values(13, 300, 4700,'카페하이 카페모카', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG',0);
--insert into cafehi_menu values(14, 300, 4500, '카페하이 헤이즐넛 라떼', '/cafeHi/img/menu/latte/HazelnutLatte.JPG',0);
--insert into cafehi_menu values(15, 300, 4700, '카페하이 돌체 라떼', '/cafeHi/img/menu/latte/DolceLatte.JPG',0);
--insert into cafehi_menu values(16, 300, 5000, '카페하이 유자비앙코', '/cafeHi/img/menu/latte/CitronBianco.JPG',0);
--insert into cafehi_menu values(17, 300, 4700, '카페하이 카라멜 마끼아또', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG',0);
--insert into cafehi_menu values(18, 400, 4800, '카페하이 모카 프라푸치노', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(19, 400. 4800, '카페하이 카라멜 프라푸치노', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG',0);
--insert into cafehi_menu values(20, 400, 4500, '카페하이 그린티 프라푸치노', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG',0);
--insert into cafehi_menu values(21, 400, 4500, '카페하이 요거트 스무디', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG',0);
--insert into cafehi_menu values(22, 400, 5000, '카페하이 구름 요거트 스무디', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG',0);
--insert into cafehi_menu values(23, 400, 5500, '카페하이 딸기 요거트 스무디', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(24, 500, 3000, '카페하이 크로와상', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(25, 500, 5000, '카페하이 생크림 크로플', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg',0);
--insert into cafehi_menu values(26, 500, 6000, '카페하이 브라운 치즈 크로플', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG',0);
--insert into cafehi_menu values(27, 500, 7000, '카페하이 아이스크림 크로플', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(28, 600, 4500, '카페하이 그린티 라떼', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG',0);
--insert into cafehi_menu values(29, 600, 4500, '카페하이 초코 라떼', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG',0);
--insert into cafehi_menu values(30, 600, 5000, '카페하이 딸기 라떼', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG',0);
--insert into cafehi_menu values(31, 600, 5000, '카페하이 베리베리 라떼', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG',0);
--insert into cafehi_menu values(32, 600, 4700, '카페하이 패션 후르츠 에이드', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG',0);
--insert into cafehi_menu values(33, 600, 5000, '카페하이 레몬에이드', '/cafeHi/img/menu/beverage/Lemonade.JPG',0);
--insert into cafehi_menu values(34, 600, 5000, '카페하이 청귤에이드', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG',0);
--insert into cafehi_menu values(35, 600, 5500, '카페하이 자몽에이드', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG',0);
--insert into cafehi_menu values(36, 600, 5500, '카페하이 블루레몬에이드', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG',0);
--insert into cafehi_menu values(37, 700, 5000, '카페하이 수박 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(38, 700, 5000, '카페하이 토마토 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(39, 700, 5000, '카페하이 바나나 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(40, 800, 3500,'카페하이 카모마일 차', '/cafeHi/img/menu/tea/chamomileTea.JPG',0);
--insert into cafehi_menu values(41, 800, 3500, '카페하이 페퍼민트 차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(42, 800, 3500,'카페하이 로즈마리 차', '/cafeHi/img/menu/tea/RosemaryTea.JPG',0);
--insert into cafehi_menu values(43, 800, 3500, '카페하이 로즈플라워 차', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG',0);
--insert into cafehi_menu values(44, 800, 3500, '카페하이 우롱 차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(45, 800, 3500, '카페하이 허니자몽블랙티', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg',0);
--insert into cafehi_menu values(46, 800, 4500, '카페하이 이슬차(수국)', '/cafeHi/img/menu/tea/DewTea.jpg',0);
--insert into cafehi_menu values(47, 800, 3500, '카페하이 아이스티', '/cafeHi/img/menu/tea/IceTea.jpg',0);
--insert into cafehi_menu values(48, 800, 4500, '카페하이 유자차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(49, 800, 4500, '카페하이 오렌지자몽차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(50, 800, 4500, '카페하이 생강차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(51, 800, 4500, '카페하이 레몬차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(52, 800, 4500, '카페하이 베리차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(53, 800, 4500, '카페하이 청귤차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(54, 800, 4500, '카페하이 자몽차', '/cafeHi/img/cafehi_logo.jpeg',0);


--
--insert into cafehi_menu values(01, 101, 3000, '카페하이 아메리카노', '/cafeHi/img/menu/coffee/IceAmericano.jpg',0);
--insert into cafehi_menu values(02, 102, 3000, '카페하이 에스프레소', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(03, 103, 4500, '카페하이 유자메리카노', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(04, 104, 500, '카페하이 샷추가', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(05, 105, 1000,'카페하이 리필', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(06, 201, 4500,'카페하이 콜드브루', '/cafeHi/img/menu/coffee/ColdBrew.JPG',0);
--insert into cafehi_menu values(07, 202, 5000, '카페하이 스페셜티(싱글원두)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(08, 203, 5000, '카페하이 콜드브루 라떼', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(09, 204, 5500, '카페하이 아인슈페너', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(10, 205, 15000, '카페하이 콜드 브루(병)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(11, 301, 5000, '카페하이 바닐라 라떼', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG',0);
--insert into cafehi_menu values(12, 302, 6000, '카페하이 아이스크림 라떼', '/cafeHi/img/menu/latte/IceCreamLatte.JPG',0);
--insert into cafehi_menu values(13, 303, 4700,'카페하이 카페모카', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG',0);
--insert into cafehi_menu values(14, 304, 4500, '카페하이 헤이즐넛 라떼', '/cafeHi/img/menu/latte/HazelnutLatte.JPG',0);
--insert into cafehi_menu values(15, 305, 4700, '카페하이 돌체 라떼', '/cafeHi/img/menu/latte/DolceLatte.JPG',0);
--insert into cafehi_menu values(16, 306, 5000, '카페하이 유자비앙코', '/cafeHi/img/menu/latte/CitronBianco.JPG',0);
--insert into cafehi_menu values(17, 307, 4700, '카페하이 카라멜 마끼아또', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG',0);
--insert into cafehi_menu values(18, 401, 4800, '카페하이 모카 프라푸치노', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(19, 402. 4800, '카페하이 카라멜 프라푸치노', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG',0);
--insert into cafehi_menu values(20, 403, 4500, '카페하이 그린티 프라푸치노', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG',0);
--insert into cafehi_menu values(21, 404, 4500, '카페하이 요거트 스무디', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG',0);
--insert into cafehi_menu values(22, 405, 5000, '카페하이 구름 요거트 스무디', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG',0);
--insert into cafehi_menu values(23, 406, 5500, '카페하이 딸기 요거트 스무디', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(24, 501, 3000, '카페하이 크로와상', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(25, 502, 5000, '카페하이 생크림 크로플', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg',0);
--insert into cafehi_menu values(26, 503, 6000, '카페하이 브라운 치즈 크로플', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG',0);
--insert into cafehi_menu values(27, 504, 7000, '카페하이 아이스크림 크로플', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(28, 601, 4500, '카페하이 그린티 라떼', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG',0);
--insert into cafehi_menu values(29, 602, 4500, '카페하이 초코 라떼', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG',0);
--insert into cafehi_menu values(30, 603, 5000, '카페하이 딸기 라떼', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG',0);
--insert into cafehi_menu values(31, 604, 5000, '카페하이 베리베리 라떼', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG',0);
--insert into cafehi_menu values(32, 605, 4700, '카페하이 패션 후르츠 에이드', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG',0);
--insert into cafehi_menu values(33, 606, 5000, '카페하이 레몬에이드', '/cafeHi/img/menu/beverage/Lemonade.JPG',0);
--insert into cafehi_menu values(34, 607, 5000, '카페하이 청귤에이드', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG',0);
--insert into cafehi_menu values(35, 608, 5500, '카페하이 자몽에이드', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG',0);
--insert into cafehi_menu values(36, 609, 5500, '카페하이 블루레몬에이드', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG',0);
--insert into cafehi_menu values(37, 701, 5000, '카페하이 수박 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(38, 702, 5000, '카페하이 토마토 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(39, 703, 5000, '카페하이 바나나 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(40, 801, 3500,'카페하이 카모마일 차', '/cafeHi/img/menu/tea/chamomileTea.JPG',0);
--insert into cafehi_menu values(41, 802, 3500, '카페하이 페퍼민트 차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(42, 803, 3500,'카페하이 로즈마리 차', '/cafeHi/img/menu/tea/RosemaryTea.JPG',0);
--insert into cafehi_menu values(43, 804, 3500, '카페하이 로즈플라워 차', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG',0);
--insert into cafehi_menu values(44, 805, 3500, '카페하이 우롱 차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(45, 806, 3500, '카페하이 허니자몽블랙티', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg',0);
--insert into cafehi_menu values(46, 807, 4500, '카페하이 이슬차(수국)', '/cafeHi/img/menu/tea/DewTea.jpg',0);
--insert into cafehi_menu values(47, 808, 3500, '카페하이 아이스티', '/cafeHi/img/menu/tea/IceTea.jpg',0);
--insert into cafehi_menu values(48, 809, 4500, '카페하이 유자차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(49, 810, 4500, '카페하이 오렌지자몽차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(50, 811, 4500, '카페하이 생강차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(51, 812, 4500, '카페하이 레몬차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(52, 813, 4500, '카페하이 베리차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(53, 814, 4500, '카페하이 청귤차', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(54, 815, 4500, '카페하이 자몽차', '/cafeHi/img/cafehi_logo.jpeg',0);


-- 직접 테이블에 다 넣는 방식 

insert into cafehi_menu values(01, 3000,'coffee','아메리카노', '카페하이 아메리카노', '/cafeHi/img/menu/coffee/IceAmericano.jpg',0);
insert into cafehi_menu values(02, 3000,'coffee','에스프레소', '카페하이 에스프레소', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(03, 4500,'coffee','유자메리카노', '카페하이 유자메리카노', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(04, 500,'coffee','샷추가', '카페하이 샷추가', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(05, 1000,'coffee','리필', '카페하이 리필', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(06, 4500,'coldbrew','콜드브루', '카페하이 콜드브루', '/cafeHi/img/menu/coffee/ColdBrew.JPG',0);
insert into cafehi_menu values(07, 5000,'coldbrew','스페셜티(싱글원두)', '카페하이 스페셜티(싱글원두)', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(08, 5000,'coldbrew','콜드브루 라떼', '카페하이 콜드브루 라떼', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(09, 5500,'coldbrew','아인슈페너', '카페하이 아인슈페너', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(10, 15000,'coldbrew','콜드브루(병)', '카페하이 콜드 브루(병)', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(11, 5000,'latte','바닐라 라떼', '카페하이 바닐라 라떼', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG',0);
insert into cafehi_menu values(12, 6000,'latte','아이스크림 라떼', '카페하이 아이스크림 라떼', '/cafeHi/img/menu/latte/IceCreamLatte.JPG',0);
insert into cafehi_menu values(13, 4700,'latte','카페모카' ,'카페하이 카페모카', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG',0);
insert into cafehi_menu values(14, 4500,'latte','헤이즐넛 라떼', '카페하이 헤이즐넛 라떼', '/cafeHi/img/menu/latte/HazelnutLatte.JPG',0);
insert into cafehi_menu values(15, 4700,'latte','돌체 라떼', '카페하이 돌체 라떼', '/cafeHi/img/menu/latte/DolceLatte.JPG',0);
insert into cafehi_menu values(16, 5000,'latte','유자비앙코', '카페하이 유자비앙코', '/cafeHi/img/menu/latte/CitronBianco.JPG',0);
insert into cafehi_menu values(17, 4700,'latte','카라멜 마끼아또', '카페하이 카라멜 마끼아또', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG',0);
insert into cafehi_menu values(18, 4800,'smoothie','모카 프라푸치노', '카페하이 모카 프라푸치노', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
insert into cafehi_menu values(19, 4800,'smoothie','카라멜 프라푸치노', '카페하이 카라멜 프라푸치노', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG',0);
insert into cafehi_menu values(20, 4500,'smoothie','그린티 프라푸치노', '카페하이 그린티 프라푸치노', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG',0);
insert into cafehi_menu values(21, 4500,'smoothie','요거트 스무디', '카페하이 요거트 스무디', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG',0);
insert into cafehi_menu values(22, 5000,'smoothie','구름 요거트 스무디', '카페하이 구름 요거트 스무디', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG',0);
insert into cafehi_menu values(23, 5500,'smoothie','딸기 요거트 스무디', '카페하이 딸기 요거트 스무디', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
insert into cafehi_menu values(24, 3000,'side','크로와상', '카페하이 크로와상', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(25, 5000,'side','생크림 크로플', '카페하이 생크림 크로플', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg',0);
insert into cafehi_menu values(26, 6000,'side','브라운 치즈 크로플', '카페하이 브라운 치즈 크로플', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG',0);
insert into cafehi_menu values(27, 7000,'side','아이스크림 크로플', '카페하이 아이스크림 크로플', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(28, 4500,'beverage','그린티 라떼', '카페하이 그린티 라떼', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG',0);
insert into cafehi_menu values(29, 4500,'beverage','초코 라떼', '카페하이 초코 라떼', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG',0);
insert into cafehi_menu values(30, 5000,'beverage','딸기 라떼', '카페하이 딸기 라떼', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG',0);
insert into cafehi_menu values(31, 5000,'beverage','베리베리 라떼', '카페하이 베리베리 라떼', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG',0);
insert into cafehi_menu values(32, 4700,'beverage','패션 후르츠 에이드', '카페하이 패션 후르츠 에이드', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG',0);
insert into cafehi_menu values(33, 5000,'beverage','레몬에이드', '카페하이 레몬에이드', '/cafeHi/img/menu/beverage/Lemonade.JPG',0);
insert into cafehi_menu values(34, 5000,'beverage','청귤에이드', '카페하이 청귤에이드', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG',0);
insert into cafehi_menu values(35, 5500,'beverage','자몽에이드', '카페하이 자몽에이드', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG',0);
insert into cafehi_menu values(36, 5500,'beverage','블루레몬에이드', '카페하이 블루레몬에이드', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG',0);
insert into cafehi_menu values(37, 5000,'fruitJuice','수박 쥬스', '카페하이 수박 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(38, 5000,'fruitJuice','토마토 쥬스', '카페하이 토마토 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(39, 5000,'fruitJuice','바나나 쥬스', '카페하이 바나나 쥬스', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(40, 3500,'tea','카모마일 차', '카페하이 카모마일 차', '/cafeHi/img/menu/tea/chamomileTea.JPG',0);
insert into cafehi_menu values(41, 3500,'tea','페퍼민트 차', '카페하이 페퍼민트 차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(42, 3500,'tea','로즈마리 차', '카페하이 로즈마리 차', '/cafeHi/img/menu/tea/RosemaryTea.JPG',0);
insert into cafehi_menu values(43, 3500,'tea','로즈플라워 차', '카페하이 로즈플라워 차', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG',0);
insert into cafehi_menu values(44, 3500,'tea','우롱 차', '카페하이 우롱 차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(45, 3500,'tea','허니자몽블랙티', '카페하이 허니자몽블랙티', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg',0);
insert into cafehi_menu values(46, 4500,'tea','이슬차(수국)', '카페하이 이슬차(수국)', '/cafeHi/img/menu/tea/DewTea.jpg',0);
insert into cafehi_menu values(47, 3500,'tea','아이스티', '카페하이 아이스티', '/cafeHi/img/menu/tea/IceTea.jpg',0);
insert into cafehi_menu values(48, 4500,'tea','유자차', '카페하이 유자차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(49, 4500,'tea','오렌지자몽차', '카페하이 오렌지자몽차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(50, 4500,'tea','생강차', '카페하이 생강차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(51, 4500,'tea','레몬차', '카페하이 레몬차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(52, 4500,'tea','베리차', '카페하이 베리차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(53, 4500,'tea','청귤차', '카페하이 청귤차', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(54, 4500,'tea','자몽차', '카페하이 자몽차', '/cafeHi/img/cafehi_logo.jpeg',0);

commit;

select Menu.menu_price, Menu.menu_explain from cafehi_sub_category subCategory, cafehi_menu Menu
where subCategory.category_sub_code = Menu.category_sub_code and subCategory.category_sub_name = 'coldbrew';

-- 장바구니 테이블

create table cafehi_cart(
    cart_code number not null primary key,
    member_code number not null,
    constraint fk_cart_member_code foreign key(member_code) references cafehi_member(member_code),
    menu_code number not null,
    cart_amount number default 0
);


-- 장바구니 기본키 시퀀스 생성
create sequence seq_cart
start with 0
minvalue 0
increment by 1;

drop sequence seq_cart;

-- 주문
create table cafehi_order(
    order_code number not null primary key,
    member_code number not null,
    constraint fk_order_membercode foreign key(member_code) references cafehi_member(member_code),
    orderState varchar2(30),
    orderDate Date
);

-- 주문 메뉴 
create table cafehi_order_menu(
    order_menu_code number primary key, 
    order_code number not null,
    constraint fk_order_menu_ordercode foreign key(order_code) references cafehi_order(order_code),
    menu_code number not null,
    constraint fk_order_menu_menucode foreign key(menu_code) references cafehi_menu(menu_code),
    member_code number not null,
    constraint fk_order_menu_membercode foreign key(member_code) references cafehi_member(member_code),
    order_menu_price number not null, 
    order_menu_count number not null
);

-- 쿠폰
create table cafehi_coupon(
    coupon_code number not null primary key,
    coupon_name varchar2(50) not null,
    coupon_content varchar2(300) not null,
    coupon_price number not null,
    coupon_start Date,
    coupon_end Date
);

-- 멤버쉽 쿠폰
create table cafehi_mem_coupon(
    mem_coupon_code number primary key,
    member_code number not null,
    constraint fk_mem_coupon_membercode foreign key(member_code) references cafehi_member(member_code),
    membership_code number not null,
     constraint fk_mem_coupon_membershipcode foreign key(membership_code) references cafehi_membership (membership_code),
    coupon_code number not null, 
    constraint fk_mem_coupon_couponcode foreign key(coupon_code) references cafehi_coupon (coupon_code)
);



-- QnA 게시판 페이징 쿼리

 select rownum as rn, qna_num, qna_title, qna_content, qna_writetime, qna_hit, user_id
    from cafehi_qna where rownum <= 20;


select rn, qna_num, qna_title, qna_content, qna_writetime, qna_hit, user_id from(
    select rownum as rn, qna_num, qna_title, qna_content, qna_writetime, qna_hit, user_id
    from cafehi_qna where rownum <= 10)
where rn > 20

order by qna_num desc
;



SELECT qna_num, qna_title, qna_writetime, user_id, qna_content, qna_hit FROM(
				SELECT rownum as rn, qna_num, qna_title, qna_writetime, user_id, qna_content, qna_hit 
				FROM cafehi_qna WHERE rownum <= 10)
			
			WHERE rn >= 1;
            

SELECT * FROM (
 		SELECT qna_num, qna_title, qna_writetime, user_id, qna_content, qna_hit FROM(
 		SELECT rownum as rn, qna_num, qna_title, qna_writetime, user_id, qna_content, qna_hit
 		FROM cafehi_qna WHERE rownum <= 10)
 		WHERE rn > 0)
 		WHERE 1=1
        AND qna_title LIKE '%' || '제목' || '%' 
 		ORDER BY qna_num DESC;
