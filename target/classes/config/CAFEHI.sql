select * from tab;
select * from cafehi_member;
select * from cafehi_member_auth;
select * from cafehi_admin;
select * from cafehi_qna;

desc cafehi_member;
desc cafehi_member_auth;
desc cafehi_admin;
desc cafehi_qna;

-- 컬럼 제거

delete cafehi_member;
delete cafehi_admin;
delete cafehi_qna;

-- 테이블 삭제 

drop table cafehi_qna;
drop table cafehi_member;
drop table cafehi_member_auth;
drop table cafehi_mem_coupon;
drop table cafehi_orderlist;
drop table cafehi_admin;
drop table cafehi_coupon;
drop table cafehi_membership;
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
    admin_name varchar2(),
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

-- 멤버쉽 
create table cafehi_membership(
    mem_code number not null primary key,
    mem_grade varchar2(30) ,
    mem_point number
);


-- 카테고리 

create table cafehi_category(
    category_code number not null primary key,
    category_type varchar2(15),
    category_name varchar2(30)
);

-- 서브 카테고리 

create table cafehi_sub_category(
    category_sub_code number not null primary key,
    category_sub_type varchar2(15),
    category_sub_name varchar2(30),
    
    category_code number not null,
    constraint fk_sub_category_code foreign key(category_code) references cafehi_category (category_code)
);

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












    
    
