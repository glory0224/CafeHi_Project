select * from tab;
select * from cafehi_user;
select * from cafehi_admin;
select * from cafehi_qna;

desc cafehi_user;
desc cafehi_admin;
desc cafehi_qna;


delete cafehi_user;
delete cafehi_admin;
delete cafehi_qna;

commit;
rollback;

-- ����� ���� ����
insert into cafehi_user values(1, 'user1', '1234', '������', '12341234', '����');
insert into cafehi_user values(2, 'user2', '5678', '������', '11111111', '�λ�');
insert into cafehi_admin values(1, 'admin1', '1234', '������1', '12341234');
commit;

-- ���� ������ ����(������ �߻��� - ���ϱ�?) 
--BEGIN
--FOR i IN 1..50 LOOP
--INSERT INTO cafehi_qna(qna_title, qna_content, qna_writetime, qna_hit, user_id) 
--VALUES(CONCAT('����', i), CONCAT('����', i), '22/11/17', 0, 'user1');
--END LOOP;
--END;

-- ���� ����غ��� 


SELECT rownum rn, q.qna_num, q.qna_title, q.qna_content, q.qna_writetime,q.qna_hit, u.user_id
FROM cafehi_user u, cafehi_qna q
WHERE u.user_seq = q.user_seq ;

SELECT qna_num, qna_title, qna_content, qna_writetime, qna_hit, user_id FROM(
SELECT rownum rn, q.qna_num, q.qna_title, q.qna_content, q.qna_writetime,q.qna_hit, u.user_id FROM
(SELECT * FROM cafehi_qna ORDER BY qna_num DESC) q, cafehi_user u
WHERE u.user_seq = q.user_seq)
WHERE rn > 0 and rn <=10
;


-- ����� ���� ���̺�
create table cafehi_user(
    user_seq number primary key,
    user_id varchar2(30),  
    user_pw varchar2(30),
    user_name varchar2(15),
    user_contact varchar2(15),
    user_road_address varchar2(100),
    user_jibun_address varchar2(100),
    user_detail_address varchar2(100)
);
-- ������ ���� ���̺�
create table cafehi_admin(
    admin_seq number primary key ,
    admin_id varchar2(30),
    admin_pw varchar2(30),
    admin_name varchar2(15),
    admin_contact varchar2(15)
);
--  QnA �Խ��� 
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
    
    user_seq number,
    constraint fk_user_seq foreign key(user_seq) references cafehi_user (user_seq) on delete cascade,
    admin_seq number,
    constraint fk_admin_seq foreign key(admin_seq) references cafehi_admin (admin_seq)on delete cascade
    
);

-- QnA �Խ��� ����¡ ����

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
        AND qna_title LIKE '%' || '����' || '%' 
 		ORDER BY qna_num DESC;

-- ����
create table cafehi_coupon(
    coupon_code number not null primary key,
    coupon_name varchar2(50) ,
    coupon_price number,
    coupon_start Date,
    coupon_end Date
);

-- ����� 
create table cafehi_membership(
    mem_code number not null primary key,
    mem_grade varchar2(30) ,
    mem_point number
);


-- ī�װ� 

create table cafehi_category(
    category_code number not null primary key,
    category_type varchar2(15),
    category_name varchar2(30)
);

-- ���� ī�װ� 

create table cafehi_sub_category(
    category_sub_code number not null primary key,
    category_sub_type varchar2(15),
    category_sub_name varchar2(30),
    
    category_code number not null,
    constraint fk_sub_category_code foreign key(category_code) references cafehi_category (category_code)
);

-- �޴�
create table cafehi_menu(
    menu_code number not null primary key,
    menu_name varchar2(50),
    menu_price number,
    menu_explain varchar2(100), 
    menu_img_path varchar2(200),
    
    category_sub_code number not null,
    constraint fk_menu_sub_category_code foreign key(category_sub_code) references cafehi_sub_category (category_sub_code)
);


-- �ɼ�

create table cafehi_option(
    option_code number not null primary key,
    option_name varchar2(30) ,
    option_price number
);

-- ����� ����
create table cafehi_mem_coupon(
     user_id varchar2(30) not null,
    constraint fk_user_id_coupon foreign key(user_id) references cafehi_user (user_id),
    mem_code number not null,
     constraint fk_mem_code_coupon foreign key(mem_code) references cafehi_membership (mem_code),
    coupon_code number not null, 
    constraint fk_coupon_code_coupon foreign key(coupon_code) references cafehi_coupon (coupon_code)
);

-- �ֹ� ����
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


-- ���̺� ���� 

drop table cafehi_qna;
drop table cafehi_mem_coupon;
drop table cafehi_orderlist;
drop table cafehi_user;
drop table cafehi_admin;
drop table cafehi_coupon;
drop table cafehi_membership;
drop table cafehi_sub_category;
drop table cafehi_category;
drop table cafehi_menu;
drop table cafehi_option;









    
    
