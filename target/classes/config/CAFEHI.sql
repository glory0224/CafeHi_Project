-- ���̺� �÷� ��ȸ

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


-- ���̺� �÷� Ÿ�� ��ȸ

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

-- ���̺� �÷� ����

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


-- ����
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
 



-- ����� ���� ���̺�
create table cafehi_member(
    member_code number primary key,
    member_id varchar2(50) not null,   
    member_pw varchar2(100) not null,
    member_name varchar2(50) not null,
    member_contact varchar2(15) not null,
    member_email varchar2(50) not null, -- ����� ���� ������
    member_road_address varchar2(100),
    member_jibun_address varchar2(100),
    member_detail_address varchar2(100),
    enabled char(1) default '1'
);

commit;

-- ����� ���� ���� ���̺�
create table cafehi_member_auth(
    member_auth_code number primary key,
    member_code number not null,
    member_auth varchar2(50) not null,
    constraint fk_member_auth foreign key(member_code) references cafehi_member(member_code) on delete cascade
);


--  QnA �Խ��� 
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

-- ����� �з�
create table cafehi_membership(
    membership_code number primary key,
    membership_grade varchar2(15) not null
);


insert into cafehi_membership values(01, 'standard');
insert into cafehi_membership values(02, 'silver'); 
insert into cafehi_membership values(03, 'gold'); 
insert into cafehi_membership values(04, 'vip'); 

commit;

-- ���� ����� 
create table my_membership(
    my_membership_code number not null primary key, 
    membership_code number not null,
    constraint fk_my_membership_code foreign key(membership_code) references cafehi_membership (membership_code),
    member_code  number not null, 
    constraint fk_my_membership_member_code foreign key(member_code) references cafehi_member (member_code) on delete cascade,
    membership_point number default 0 not null
);




-- �޴�
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



insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(01, 3000,'coffee','�Ƹ޸�ī��', 'ī������ �Ƹ޸�ī��', '/cafeHi/img/menu/coffee/IceAmericano.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(02, 3000,'coffee','����������', 'ī������ ����������', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(03, 4500,'coffee','���ڸ޸�ī��', 'ī������ ���ڸ޸�ī��', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(04, 500,'coffee','���߰�', 'ī������ ���߰�', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(05, 1000,'coffee','����', 'ī������ ����', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(06, 4500,'coldbrew','�ݵ���', 'ī������ �ݵ���', '/cafeHi/img/menu/coffee/ColdBrew.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(07, 5000,'coldbrew','�����Ƽ(�̱ۿ���)', 'ī������ �����Ƽ(�̱ۿ���)', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(08, 5000,'coldbrew','�ݵ��� ��', 'ī������ �ݵ��� ��', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(09, 5500,'coldbrew','���ν����', 'ī������ ���ν����', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(10, 15000,'coldbrew','�ݵ���(��)', 'ī������ �ݵ� ���(��)', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(11, 5000,'latte','�ٴҶ� ��', 'ī������ �ٴҶ� ��', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(12, 6000,'latte','���̽�ũ�� ��', 'ī������ ���̽�ũ�� ��', '/cafeHi/img/menu/latte/IceCreamLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(13, 4700,'latte','ī���ī' ,'ī������ ī���ī', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(14, 4500,'latte','������� ��', 'ī������ ������� ��', '/cafeHi/img/menu/latte/HazelnutLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(15, 4700,'latte','��ü ��', 'ī������ ��ü ��', '/cafeHi/img/menu/latte/DolceLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(16, 5000,'latte','���ں����', 'ī������ ���ں����', '/cafeHi/img/menu/latte/CitronBianco.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(17, 4700,'latte','ī��� �����ƶ�', 'ī������ ī��� �����ƶ�', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(18, 4800,'smoothie','��ī ����Ǫġ��', 'ī������ ��ī ����Ǫġ��', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(19, 4800,'smoothie','ī��� ����Ǫġ��', 'ī������ ī��� ����Ǫġ��', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(20, 4500,'smoothie','�׸�Ƽ ����Ǫġ��', 'ī������ �׸�Ƽ ����Ǫġ��', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(21, 4500,'smoothie','���Ʈ ������', 'ī������ ���Ʈ ������', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(22, 5000,'smoothie','���� ���Ʈ ������', 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(23, 5500,'smoothie','���� ���Ʈ ������', 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(24, 3000,'side','ũ�οͻ�', 'ī������ ũ�οͻ�', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(25, 5000,'side','��ũ�� ũ����', 'ī������ ��ũ�� ũ����', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(26, 6000,'side','���� ġ�� ũ����', 'ī������ ���� ġ�� ũ����', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(27, 7000,'side','���̽�ũ�� ũ����', 'ī������ ���̽�ũ�� ũ����', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(28, 4500,'beverage','�׸�Ƽ ��', 'ī������ �׸�Ƽ ��', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(29, 4500,'beverage','���� ��', 'ī������ ���� ��', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(30, 5000,'beverage','���� ��', 'ī������ ���� ��', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(31, 5000,'beverage','�������� ��', 'ī������ �������� ��', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(32, 4700,'beverage','�м� �ĸ��� ���̵�', 'ī������ �м� �ĸ��� ���̵�', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(33, 5000,'beverage','�����̵�', 'ī������ �����̵�', '/cafeHi/img/menu/beverage/Lemonade.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(34, 5000,'beverage','û�ֿ��̵�', 'ī������ û�ֿ��̵�', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(35, 5500,'beverage','�ڸ����̵�', 'ī������ �ڸ����̵�', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(36, 5500,'beverage','��緹���̵�', 'ī������ ��緹���̵�', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(37, 5000,'fruitJuice','���� �꽺', 'ī������ ���� �꽺', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(38, 5000,'fruitJuice','�丶�� �꽺', 'ī������ �丶�� �꽺', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(39, 5000,'fruitJuice','�ٳ��� �꽺', 'ī������ �ٳ��� �꽺', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(40, 3500,'tea','ī���� ��', 'ī������ ī���� ��', '/cafeHi/img/menu/tea/chamomileTea.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(41, 3500,'tea','���۹�Ʈ ��', 'ī������ ���۹�Ʈ ��', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(42, 3500,'tea','����� ��', 'ī������ ����� ��', '/cafeHi/img/menu/tea/RosemaryTea.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(43, 3500,'tea','�����ö�� ��', 'ī������ �����ö�� ��', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(44, 3500,'tea','��� ��', 'ī������ ��� ��', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(45, 3500,'tea','����ڸ���Ƽ', 'ī������ ����ڸ���Ƽ', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(46, 4500,'tea','�̽���(����)', 'ī������ �̽���(����)', '/cafeHi/img/menu/tea/DewTea.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(47, 3500,'tea','���̽�Ƽ', 'ī������ ���̽�Ƽ', '/cafeHi/img/menu/tea/IceTea.jpg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(48, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(49, 4500,'tea','�������ڸ���', 'ī������ �������ڸ���', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(50, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(51, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(52, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(53, 4500,'tea','û����', 'ī������ û����', '/cafeHi/img/cafehi_logo.jpeg');
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path) values(54, 4500,'tea','�ڸ���', 'ī������ �ڸ���', '/cafeHi/img/cafehi_logo.jpeg');

commit;

select Menu.menu_price, Menu.menu_explain from cafehi_sub_category subCategory, cafehi_menu Menu
where subCategory.category_sub_code = Menu.category_sub_code and subCategory.category_sub_name = 'coldbrew';

-- ��ٱ��� ���̺�

create table cafehi_cart(
    cart_code number not null primary key,
    member_code number not null,
    constraint fk_cart_member_code foreign key(member_code) references cafehi_member(member_code),
    menu_code number not null,
    cart_amount number default 0
);


-- ��ٱ��� �⺻Ű ������ ����
create sequence seq_cart
start with 0
minvalue 0
increment by 1;

drop sequence seq_cart;


-- �ֹ�
create table cafehi_order(
    order_code number not null primary key,
    member_code number not null,
    constraint fk_order_membercode foreign key(member_code) references cafehi_member(member_code),
    orderState varchar2(30),
    orderDate Date
);

-- �ֹ� 2
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

-- �ֹ� �޴� 
create table cafehi_order_menu(
    order_menu_code number primary key, 
    order_code number not null,
    constraint fk_order_menu_ordercode foreign key(order_code) references cafehi_order(order_code),
    menu_code number not null,
    constraint fk_order_menu_menucode foreign key(menu_code) references cafehi_menu(menu_code),
    total_order_price number not null, 
    total_order_count number not null
);

-- ����
create table cafehi_coupon(
    coupon_code number not null primary key,
    coupon_name varchar2(50) not null,
    coupon_content varchar2(300) not null,
    coupon_price number not null,
    coupon_start Date,
    coupon_end Date
);

-- ����� ����
create table cafehi_mem_coupon(
    mem_coupon_code number primary key,
    member_code number not null,
    constraint fk_mem_coupon_membercode foreign key(member_code) references cafehi_member(member_code),
    membership_code number not null,
     constraint fk_mem_coupon_membershipcode foreign key(membership_code) references cafehi_membership (membership_code),
    coupon_code number not null, 
    constraint fk_mem_coupon_couponcode foreign key(coupon_code) references cafehi_coupon (coupon_code)
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


