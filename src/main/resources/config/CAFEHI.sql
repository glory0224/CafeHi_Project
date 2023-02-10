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
delete cafehi_order;
delete cafehi_order_menu;

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

SELECT order_code, m.menu_code, cm.member_id, member_name, menu_name, order_count, order_price, (menu_price * order_count) money
		
FROM cafehi_member cm, cafehi_order o, cafehi_menu m
	
WHERE cm.member_code = o.member_code and o.menu_code = m.menu_code and o.member_code = '12' 
ORDER BY order_code;  		
 



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
    menu_quantity number default 1000 not null
);



insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(01, 3000,'coffee','아메리카노', '카페하이 아메리카노', '/cafeHi/img/menu/coffee/IceAmericano.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(02, 3000,'coffee','에스프레소', '카페하이 에스프레소', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(03, 4500,'coffee','유자메리카노', '카페하이 유자메리카노', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(04, 500,'coffee','샷추가', '카페하이 샷추가', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(05, 1000,'coffee','리필', '카페하이 리필', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(06, 4500,'coldbrew','콜드브루', '카페하이 콜드브루', '/cafeHi/img/menu/coffee/ColdBrew.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(07, 5000,'coldbrew','스페셜티(싱글원두)', '카페하이 스페셜티(싱글원두)', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(08, 5000,'coldbrew','콜드브루 라떼', '카페하이 콜드브루 라떼', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(09, 5500,'coldbrew','아인슈페너', '카페하이 아인슈페너', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(10, 15000,'coldbrew','콜드브루(병)', '카페하이 콜드 브루(병)', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(11, 5000,'latte','바닐라 라떼', '카페하이 바닐라 라떼', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(12, 6000,'latte','아이스크림 라떼', '카페하이 아이스크림 라떼', '/cafeHi/img/menu/latte/IceCreamLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(13, 4700,'latte','카페모카' ,'카페하이 카페모카', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(14, 4500,'latte','헤이즐넛 라떼', '카페하이 헤이즐넛 라떼', '/cafeHi/img/menu/latte/HazelnutLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(15, 4700,'latte','돌체 라떼', '카페하이 돌체 라떼', '/cafeHi/img/menu/latte/DolceLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(16, 5000,'latte','유자비앙코', '카페하이 유자비앙코', '/cafeHi/img/menu/latte/CitronBianco.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(17, 4700,'latte','카라멜 마끼아또', '카페하이 카라멜 마끼아또', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(18, 4800,'smoothie','모카 프라푸치노', '카페하이 모카 프라푸치노', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(19, 4800,'smoothie','카라멜 프라푸치노', '카페하이 카라멜 프라푸치노', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(20, 4500,'smoothie','그린티 프라푸치노', '카페하이 그린티 프라푸치노', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(21, 4500,'smoothie','요거트 스무디', '카페하이 요거트 스무디', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(22, 5000,'smoothie','구름 요거트 스무디', '카페하이 구름 요거트 스무디', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(23, 5500,'smoothie','딸기 요거트 스무디', '카페하이 딸기 요거트 스무디', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(24, 3000,'side','크로와상', '카페하이 크로와상', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(25, 5000,'side','생크림 크로플', '카페하이 생크림 크로플', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(26, 6000,'side','브라운 치즈 크로플', '카페하이 브라운 치즈 크로플', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(27, 7000,'side','아이스크림 크로플', '카페하이 아이스크림 크로플', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(28, 4500,'beverage','그린티 라떼', '카페하이 그린티 라떼', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(29, 4500,'beverage','초코 라떼', '카페하이 초코 라떼', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(30, 5000,'beverage','딸기 라떼', '카페하이 딸기 라떼', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(31, 5000,'beverage','베리베리 라떼', '카페하이 베리베리 라떼', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(32, 4700,'beverage','패션 후르츠 에이드', '카페하이 패션 후르츠 에이드', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(33, 5000,'beverage','레몬에이드', '카페하이 레몬에이드', '/cafeHi/img/menu/beverage/Lemonade.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(34, 5000,'beverage','청귤에이드', '카페하이 청귤에이드', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(35, 5500,'beverage','자몽에이드', '카페하이 자몽에이드', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(36, 5500,'beverage','블루레몬에이드', '카페하이 블루레몬에이드', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(37, 5000,'fruitJuice','수박 쥬스', '카페하이 수박 쥬스', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(38, 5000,'fruitJuice','토마토 쥬스', '카페하이 토마토 쥬스', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(39, 5000,'fruitJuice','바나나 쥬스', '카페하이 바나나 쥬스', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(40, 3500,'tea','카모마일 차', '카페하이 카모마일 차', '/cafeHi/img/menu/tea/chamomileTea.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(41, 3500,'tea','페퍼민트 차', '카페하이 페퍼민트 차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(42, 3500,'tea','로즈마리 차', '카페하이 로즈마리 차', '/cafeHi/img/menu/tea/RosemaryTea.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(43, 3500,'tea','로즈플라워 차', '카페하이 로즈플라워 차', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(44, 3500,'tea','우롱 차', '카페하이 우롱 차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(45, 3500,'tea','허니자몽블랙티', '카페하이 허니자몽블랙티', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(46, 4500,'tea','이슬차(수국)', '카페하이 이슬차(수국)', '/cafeHi/img/menu/tea/DewTea.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(47, 3500,'tea','아이스티', '카페하이 아이스티', '/cafeHi/img/menu/tea/IceTea.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(48, 4500,'tea','유자차', '카페하이 유자차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(49, 4500,'tea','오렌지자몽차', '카페하이 오렌지자몽차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(50, 4500,'tea','생강차', '카페하이 생강차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(51, 4500,'tea','레몬차', '카페하이 레몬차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(52, 4500,'tea','베리차', '카페하이 베리차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(53, 4500,'tea','청귤차', '카페하이 청귤차', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(54, 4500,'tea','자몽차', '카페하이 자몽차', '/cafeHi/img/cafehi_logo.jpeg');

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

-- 주문 2
--create table cafehi_order(
--    order_code number not null primary key,
--    member_code number not null,
--    constraint fk_order_membercode foreign key(member_code) references cafehi_member(member_code),
--    menu_code number not null,
--    constraint fk_order_menu_menucode foreign key(menu_code) references cafehi_menu(menu_code),
--    total_order_price number not null,
--    total_order_count number not null, 
--    orderState varchar2(30) not null,
--    orderDate Date not null
--);

-- 주문 메뉴 
create table cafehi_order_menu(
    order_menu_code number primary key, 
    order_code number not null,
    constraint fk_order_menu_ordercode foreign key(order_code) references cafehi_order(order_code),
    menu_code number not null,
    constraint fk_order_menu_menucode foreign key(menu_code) references cafehi_menu(menu_code),
    total_order_price number not null, 
    total_order_count number not null
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


