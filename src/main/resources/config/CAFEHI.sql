-- 테이블 컬럼 조회

select * from tab;
select * from cafehi_member;
select * from cafehi_member_auth;
select * from cafehi_admin;
select * from cafehi_qna;
select * from cafehi_membership;
select * from my_membership;
select * from cafehi_menu;
select * from cafehi_cart;


-- 테이블 컬럼 타입 조회

desc cafehi_member;
desc cafehi_member_auth;
desc cafehi_admin;
desc cafehi_qna;
desc cafehi_menu;
desc cafehi_cart;

-- 테이블 컬럼 제거

delete cafehi_member;
delete cafehi_member_auth;
delete my_membership;
delete cafehi_admin;
delete cafehi_qna;
delete cafehi_menu;
delete cafehi_cart;

-- 테이블 삭제 

drop table cafehi_qna;
drop table cafehi_admin;
drop table cafehi_member;
drop table cafehi_member_auth;
drop table cafehi_membership;
drop table my_membership;
drop table cafehi_mem_coupon;
drop table cafehi_orderlist;
drop table cafehi_coupon;
drop table cafehi_menu;
drop table cafehi_option;

commit;
rollback;

SELECT rownum rn, q.qna_num, q.qna_title, q.qna_content, q.qna_writetime,q.qna_hit, u.user_id
FROM cafehi_user u, cafehi_qna q
WHERE u.user_seq = q.user_seq ;

SELECT qna_num, qna_title, qna_content, qna_writetime, qna_hit, user_id FROM(
SELECT rownum rn, q.qna_num, q.qna_title, q.qna_content, q.qna_writetime,q.qna_hit, u.user_id FROM
(SELECT * FROM cafehi_qna ORDER BY qna_num DESC) q, cafehi_user u
WHERE u.user_seq = q.user_seq)
WHERE rn > 0 and rn <=10
;


-- 사용자 정보 테이블
create table cafehi_member(
    member_seq number,
    member_id varchar2(50) primary key,  
    member_pw varchar2(100),
    member_name varchar2(50),
    member_contact varchar2(15),
    member_email varchar2(50), -- 사용자 계정 인증용
    member_road_address varchar2(100),
    member_jibun_address varchar2(100),
    member_detail_address varchar2(100),
    enabled char(1) default '1'
);

-- 사용자 정보 권한 테이블
create table cafehi_member_auth(
    member_id varchar2(50),
    auth varchar2(50),
    constraint fk_cfmember_auth foreign key(member_id) references cafehi_member(member_id) on delete cascade
);


-- 관리자 정보 테이블
create table cafehi_admin(
    admin_seq number primary key ,
    admin_id varchar2(30),
    admin_pw varchar2(30),
    admin_name varchar2(15),
    admin_contact varchar2(15)
);


--  QnA 게시판 
create table cafehi_qna(
    qna_num number primary key,
    qna_title varchar2(200),
    qna_content varchar2(500),
    qna_writetime Date,
    qna_hit number,
    upload_path varchar2(300),
    fileName varchar2(50),
    
    member_id varchar2(50),
    constraint fk_member_id foreign key(member_id) references cafehi_member (member_id) on delete cascade 
);

-- 나의 멤버쉽 
create table my_membership(
    my_membership_code number not null primary key, 
    membership_code number,
    constraint fk_membership_code foreign key(membership_code) references cafehi_membership (membership_code),
    member_id  varchar2(50), 
    constraint fk_membership_id foreign key(member_id) references cafehi_member (member_id) on delete cascade,
    membership_point number
);

insert into my_membership values(1, 'user12', 0);
insert into my_membership values(2,'hi12345', 5500 );
insert into my_membership values(3, 'user1234', 11000);
insert into my_membership values(4, 'kara12345', 16000);


-- 멤버쉽 분류
create table cafehi_membership(
    membership_code number primary key,
    membership_grade varchar2(15)
);

insert into cafehi_membership values(01, 'standard');
insert into cafehi_membership values(02, 'silver'); 
insert into cafehi_membership values(03, 'gold'); 
insert into cafehi_membership values(04, 'vip'); 

commit;


-- 메뉴(카테고리를 외래키로 사용해서 써보려 했으나 오히려 복잡성이 높아지는거 같아서 그냥 독립적으로 생성)
create table cafehi_menu(
    menu_code number not null primary key,
    menu_price number,
    menu_type varchar2(50),
    menu_name varchar2(50),
    menu_explain varchar2(100), 
    menu_img_path varchar2(200),
    menu_count number default 0
);

-- 메뉴 데이터(이미지 경로는 메뉴 사진이 없는 경우 로고 사진으로 대체, 추후 사진 추가 예정)

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
    member_id varchar2(50)not null,
    constraint cart_member_id_fk foreign key(member_id) references cafehi_member(member_id),
    menu_code number not null,
    amount number default 0
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
    member_id varchar2(50)not null,
    constraint order_member_id_fk foreign key(member_id) references cafehi_member(member_id),
    my_membership_code number not null,
    constraint order_membership_code_fk foreign key(my_membership_code) references my_membership(my_membership_code),
    menu_code number not null,
    constraint order_menu_code_fk foreign key(menu_code) references cafehi_menu(menu_code),
    orderState varchar2(30),
    orderDate Date
);


-- 하단) 초기 작업 테이블(수정 필요)

-- 멤버쉽 쿠폰
create table cafehi_mem_coupon(
     user_id varchar2(30) not null,
    constraint fk_user_id_coupon foreign key(user_id) references cafehi_user (user_id),
    mem_code number not null,
     constraint fk_mem_code_coupon foreign key(mem_code) references cafehi_membership (mem_code),
    coupon_code number not null, 
    constraint fk_coupon_code_coupon foreign key(coupon_code) references cafehi_coupon (coupon_code)
);

-- 쿠폰
create table cafehi_coupon(
    coupon_code number not null primary key,
    coupon_name varchar2(50) ,
    coupon_price number,
    coupon_start Date,
    coupon_end Date
);

-- 주문 내역
create table cafehi_orderlist(
     user_id varchar2(30) not null,
    constraint fk_user_id_order foreign key(user_id) references cafehi_user (user_id),
     menu_code number not null,
    constraint fk_menu_code_order foreign key(menu_code) references cafehi_menu (menu_code),
    option_code number not null,
    constraint fk_option_code_order foreign key(option_code) references cafehi_option (option_code),
    category_sub_code number not null,
    constraint fk_order_category_code_order foreign key(category_sub_code) references cafehi_sub_category (category_sub_code)
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
