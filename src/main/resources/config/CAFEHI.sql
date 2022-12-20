select * from tab;
select * from cafehi_member;
select * from cafehi_member_auth;
select * from cafehi_admin;
select * from cafehi_qna;
select * from cafehi_membership;
select * from my_membership;
select mymem.member_id, camem.membership_grade, mymem.membership_point from my_membership mymem, cafehi_membership camem 
where mymem.membership_code = camem.membership_code and mymem.member_id = 'user12';

select myMembership.member_id, membership.membership_grade, myMembership.membership_point from my_membership myMembership, cafehi_membership membership 
where myMembership.membership_code = membership.membership_code and myMembership.member_id ='hi12345'; 
 	
select member.member_id, membership.membership_grade, myMembership.membership_point from my_membership myMembership, cafehi_member member, cafehi_membership membership 
			where myMembership.membership_code = membership.membership_code and member.member_id = 'user1234';

desc cafehi_member;
desc cafehi_member_auth;
desc cafehi_admin;
desc cafehi_qna;

-- 컬럼 제거

delete cafehi_member;
delete my_membership;
delete cafehi_admin;
delete cafehi_qna;

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
drop table cafehi_sub_category;
drop table cafehi_category;
drop table cafehi_menu;
drop table cafehi_option;

commit;
rollback;



-- 더미 데이터 생성(오류가 발생함 - 왜일까?) 
--BEGIN
--FOR i IN 1..50 LOOP
--INSERT INTO cafehi_qna(qna_title, qna_content, qna_writetime, qna_hit, user_id) 
--VALUES(CONCAT('제목', i), CONCAT('내용', i), '22/11/17', 0, 'user1');
--END LOOP;
--END;



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
    qna_select varchar2(30),
    qna_search varchar2(100),
    upload_path varchar2(300),
    fileName varchar2(50),
    
    member_id varchar2(50),
    constraint fk_member_id foreign key(member_id) references cafehi_member (member_id) on delete cascade 
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

-- 쿠폰
create table cafehi_coupon(
    coupon_code number not null primary key,
    coupon_name varchar2(50) ,
    coupon_price number,
    coupon_start Date,
    coupon_end Date
);

-- 나의 멤버쉽 
create table my_membership(
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

-- 카테고리 

create table cafehi_category(
    category_code number not null primary key,
    category_type varchar2(15),
    category_name varchar2(30)
);

insert into cafehi_category values(01, 'menu', 'coffee');
insert into cafehi_category values(02, 'menu', 'coldbrew');
insert into cafehi_category values(03, 'menu', 'latte');
insert into cafehi_category values(04, 'menu', 'smoothie');
insert into cafehi_category values(05, 'menu', 'side');
insert into cafehi_category values(06, 'menu', 'beverage');
insert into cafehi_category values(07, 'menu', 'fruitJuice');
insert into cafehi_category values(08, 'menu', 'tea');

-- 서브 카테고리 

create table cafehi_sub_category(
    category_sub_code number not null primary key,
    category_sub_type varchar2(15),
    category_sub_name varchar2(30),
    
    category_code number not null,
    constraint fk_sub_category_code foreign key(category_code) references cafehi_category (category_code)
);

-- 커피 메뉴

insert into cafehi_sub_category values(01, 'coffee', 'americano', 01);
insert into cafehi_sub_category values(02, 'coffee', 'espresso', 01);
insert into cafehi_sub_category values(03, 'coffee', 'citronAmericano', 01);
insert into cafehi_sub_category values(04, 'coffee', 'addShot', 01);
insert into cafehi_sub_category values(05, 'coffee', 'refill', 01);

-- 콜드브루

insert into cafehi_sub_category values(01, 'coldbrew', 'coldbrew', 02);
insert into cafehi_sub_category values(02, 'coldbrew', 'specialTea', 02);
insert into cafehi_sub_category values(03, 'coldbrew', 'coldbrewLatte', 02);
insert into cafehi_sub_category values(04, 'coldbrew', 'einstephener', 02);
insert into cafehi_sub_category values(05, 'coldbrew', 'coldbrewBottle', 02);

-- 라떼

insert into cafehi_sub_category values(01, 'latte', 'vanillaLatte', 03);
insert into cafehi_sub_category values(02, 'latte', 'icecreamLatte', 03);
insert into cafehi_sub_category values(03, 'latte', 'caffeMocha', 03);
insert into cafehi_sub_category values(04, 'latte', 'hazelnutLatte', 03);
insert into cafehi_sub_category values(05, 'latte', 'dolceLatte', 03);
insert into cafehi_sub_category values(06, 'latte', 'yuzabianco', 03);
insert into cafehi_sub_category values(07, 'latte', 'caramelMacchiato', 03);

-- 스무디

insert into cafehi_sub_category values(01, 'smoothie', 'mochaFrappuccino', 04);
insert into cafehi_sub_category values(02, 'smoothie', 'caramelFrappuccino', 04);
insert into cafehi_sub_category values(03, 'smoothie', 'greenTeaFrappuccino', 04);
insert into cafehi_sub_category values(04, 'smoothie', 'yogurtSmoothie', 04);
insert into cafehi_sub_category values(05, 'smoothie', 'cloudYogurtSmoothie', 04);
insert into cafehi_sub_category values(06, 'smoothie', 'strawberryYogurtSmoothie', 04);

-- 사이드 

insert into cafehi_sub_category values(01, 'side', 'croissant', 05);
insert into cafehi_sub_category values(02, 'side', 'whippedCreamCrople', 05);
insert into cafehi_sub_category values(03, 'side', 'brownCheeseCrople', 05);
insert into cafehi_sub_category values(04, 'side', 'icecreamCrople', 05);

-- 음료

insert into cafehi_sub_category values(01, 'beverage', 'greenTeaLatte', 06);
insert into cafehi_sub_category values(02, 'beverage', 'chocoLatte', 06);
insert into cafehi_sub_category values(03, 'beverage', 'strawberryLatte', 06);
insert into cafehi_sub_category values(04, 'beverage', 'berryberryLatte', 06);
insert into cafehi_sub_category values(05, 'beverage', 'passionFruitAde', 06);
insert into cafehi_sub_category values(06, 'beverage', 'lemonade', 06);
insert into cafehi_sub_category values(07, 'beverage', 'greenTangerineAde', 06);
insert into cafehi_sub_category values(08, 'beverage', 'grapefruitAde', 06);
insert into cafehi_sub_category values(09, 'beverage', 'blueLemonade', 06);

-- 생과일 주스 
insert into cafehi_sub_category values(01, 'fruitJuice', 'watermelonJuice', 07);
insert into cafehi_sub_category values(02, 'fruitJuice', 'tomatoJuice', 07);
insert into cafehi_sub_category values(03, 'fruitJuice', 'bananaJuice', 07);

-- 차
insert into cafehi_sub_category values(01, 'tea', 'chamomileTea', 08);
insert into cafehi_sub_category values(02, 'tea', 'rooibosTea', 08);
insert into cafehi_sub_category values(03, 'tea', 'peppermintTea', 08);
insert into cafehi_sub_category values(04, 'tea', 'rosemaryTea', 08);
insert into cafehi_sub_category values(05, 'tea', 'roseFlowerTea', 08);
insert into cafehi_sub_category values(06, 'tea', 'oolongTea', 08);
insert into cafehi_sub_category values(07, 'tea', 'honeyGrapefruitBlackTea', 08);
insert into cafehi_sub_category values(08, 'tea', 'dewTea', 08);
insert into cafehi_sub_category values(09, 'tea', 'icedTea', 08);
insert into cafehi_sub_category values(10, 'tea', 'yuzaTea', 08);
insert into cafehi_sub_category values(11, 'tea', 'orangeGrapefruitTea', 08);
insert into cafehi_sub_category values(12, 'tea', 'gingerTea', 08);
insert into cafehi_sub_category values(13, 'tea', 'lemonTea', 08);
insert into cafehi_sub_category values(14, 'tea', 'berryTea', 08);
insert into cafehi_sub_category values(15, 'tea', 'greenTangerineTea', 08);
insert into cafehi_sub_category values(16, 'tea', 'GrapefruitTea', 08);

insert into

-- 메뉴
create table cafehi_menu(
    menu_code number not null primary key,
    menu_name varchar2(50),
    menu_price number,
    menu_explain varchar2(100), 
    menu_img_path varchar2(200),
    
    category_sub_code number not null,
    constraint fk_menu_sub_category_code foreign key(category_sub_code) references cafehi_sub_category (category_sub_code)
);


-- 옵션

create table cafehi_option(
    option_code number not null primary key,
    option_name varchar2(30) ,
    option_price number
);

-- 멤버쉽 쿠폰
create table cafehi_mem_coupon(
     user_id varchar2(30) not null,
    constraint fk_user_id_coupon foreign key(user_id) references cafehi_user (user_id),
    mem_code number not null,
     constraint fk_mem_code_coupon foreign key(mem_code) references cafehi_membership (mem_code),
    coupon_code number not null, 
    constraint fk_coupon_code_coupon foreign key(coupon_code) references cafehi_coupon (coupon_code)
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












    
    
