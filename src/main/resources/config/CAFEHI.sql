-- ���̺� �÷� ��ȸ

select * from tab;
select * from cafehi_member;
select * from cafehi_member_auth;
select * from cafehi_admin;
select * from cafehi_qna;
select * from cafehi_membership;
select * from my_membership;
select * from cafehi_menu;
select * from cafehi_cart;


-- ���̺� �÷� Ÿ�� ��ȸ

desc cafehi_member;
desc cafehi_member_auth;
desc cafehi_admin;
desc cafehi_qna;
desc cafehi_menu;
desc cafehi_cart;

-- ���̺� �÷� ����

delete cafehi_member;
delete cafehi_member_auth;
delete my_membership;
delete cafehi_admin;
delete cafehi_qna;
delete cafehi_menu;
delete cafehi_cart;

-- ���̺� ���� 

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


-- ����� ���� ���̺�
create table cafehi_member(
    member_seq number,
    member_id varchar2(50) primary key,  
    member_pw varchar2(100),
    member_name varchar2(50),
    member_contact varchar2(15),
    member_email varchar2(50), -- ����� ���� ������
    member_road_address varchar2(100),
    member_jibun_address varchar2(100),
    member_detail_address varchar2(100),
    enabled char(1) default '1'
);

-- ����� ���� ���� ���̺�
create table cafehi_member_auth(
    member_id varchar2(50),
    auth varchar2(50),
    constraint fk_cfmember_auth foreign key(member_id) references cafehi_member(member_id) on delete cascade
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
    upload_path varchar2(300),
    fileName varchar2(50),
    
    member_id varchar2(50),
    constraint fk_member_id foreign key(member_id) references cafehi_member (member_id) on delete cascade 
);

-- ���� ����� 
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


-- ����� �з�
create table cafehi_membership(
    membership_code number primary key,
    membership_grade varchar2(15)
);

insert into cafehi_membership values(01, 'standard');
insert into cafehi_membership values(02, 'silver'); 
insert into cafehi_membership values(03, 'gold'); 
insert into cafehi_membership values(04, 'vip'); 

commit;


-- �޴�(ī�װ��� �ܷ�Ű�� ����ؼ� �Ẹ�� ������ ������ ���⼺�� �������°� ���Ƽ� �׳� ���������� ����)
create table cafehi_menu(
    menu_code number not null primary key,
    menu_price number,
    menu_type varchar2(50),
    menu_name varchar2(50),
    menu_explain varchar2(100), 
    menu_img_path varchar2(200),
    menu_count number default 0
);

-- �޴� ������(�̹��� ��δ� �޴� ������ ���� ��� �ΰ� �������� ��ü, ���� ���� �߰� ����)

insert into cafehi_menu values(01, 3000,'coffee','�Ƹ޸�ī��', 'ī������ �Ƹ޸�ī��', '/cafeHi/img/menu/coffee/IceAmericano.jpg',0);
insert into cafehi_menu values(02, 3000,'coffee','����������', 'ī������ ����������', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(03, 4500,'coffee','���ڸ޸�ī��', 'ī������ ���ڸ޸�ī��', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(04, 500,'coffee','���߰�', 'ī������ ���߰�', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(05, 1000,'coffee','����', 'ī������ ����', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(06, 4500,'coldbrew','�ݵ���', 'ī������ �ݵ���', '/cafeHi/img/menu/coffee/ColdBrew.JPG',0);
insert into cafehi_menu values(07, 5000,'coldbrew','�����Ƽ(�̱ۿ���)', 'ī������ �����Ƽ(�̱ۿ���)', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(08, 5000,'coldbrew','�ݵ��� ��', 'ī������ �ݵ��� ��', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(09, 5500,'coldbrew','���ν����', 'ī������ ���ν����', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(10, 15000,'coldbrew','�ݵ���(��)', 'ī������ �ݵ� ���(��)', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(11, 5000,'latte','�ٴҶ� ��', 'ī������ �ٴҶ� ��', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG',0);
insert into cafehi_menu values(12, 6000,'latte','���̽�ũ�� ��', 'ī������ ���̽�ũ�� ��', '/cafeHi/img/menu/latte/IceCreamLatte.JPG',0);
insert into cafehi_menu values(13, 4700,'latte','ī���ī' ,'ī������ ī���ī', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG',0);
insert into cafehi_menu values(14, 4500,'latte','������� ��', 'ī������ ������� ��', '/cafeHi/img/menu/latte/HazelnutLatte.JPG',0);
insert into cafehi_menu values(15, 4700,'latte','��ü ��', 'ī������ ��ü ��', '/cafeHi/img/menu/latte/DolceLatte.JPG',0);
insert into cafehi_menu values(16, 5000,'latte','���ں����', 'ī������ ���ں����', '/cafeHi/img/menu/latte/CitronBianco.JPG',0);
insert into cafehi_menu values(17, 4700,'latte','ī��� �����ƶ�', 'ī������ ī��� �����ƶ�', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG',0);
insert into cafehi_menu values(18, 4800,'smoothie','��ī ����Ǫġ��', 'ī������ ��ī ����Ǫġ��', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
insert into cafehi_menu values(19, 4800,'smoothie','ī��� ����Ǫġ��', 'ī������ ī��� ����Ǫġ��', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG',0);
insert into cafehi_menu values(20, 4500,'smoothie','�׸�Ƽ ����Ǫġ��', 'ī������ �׸�Ƽ ����Ǫġ��', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG',0);
insert into cafehi_menu values(21, 4500,'smoothie','���Ʈ ������', 'ī������ ���Ʈ ������', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG',0);
insert into cafehi_menu values(22, 5000,'smoothie','���� ���Ʈ ������', 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG',0);
insert into cafehi_menu values(23, 5500,'smoothie','���� ���Ʈ ������', 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
insert into cafehi_menu values(24, 3000,'side','ũ�οͻ�', 'ī������ ũ�οͻ�', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(25, 5000,'side','��ũ�� ũ����', 'ī������ ��ũ�� ũ����', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg',0);
insert into cafehi_menu values(26, 6000,'side','���� ġ�� ũ����', 'ī������ ���� ġ�� ũ����', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG',0);
insert into cafehi_menu values(27, 7000,'side','���̽�ũ�� ũ����', 'ī������ ���̽�ũ�� ũ����', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(28, 4500,'beverage','�׸�Ƽ ��', 'ī������ �׸�Ƽ ��', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG',0);
insert into cafehi_menu values(29, 4500,'beverage','���� ��', 'ī������ ���� ��', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG',0);
insert into cafehi_menu values(30, 5000,'beverage','���� ��', 'ī������ ���� ��', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG',0);
insert into cafehi_menu values(31, 5000,'beverage','�������� ��', 'ī������ �������� ��', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG',0);
insert into cafehi_menu values(32, 4700,'beverage','�м� �ĸ��� ���̵�', 'ī������ �м� �ĸ��� ���̵�', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG',0);
insert into cafehi_menu values(33, 5000,'beverage','�����̵�', 'ī������ �����̵�', '/cafeHi/img/menu/beverage/Lemonade.JPG',0);
insert into cafehi_menu values(34, 5000,'beverage','û�ֿ��̵�', 'ī������ û�ֿ��̵�', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG',0);
insert into cafehi_menu values(35, 5500,'beverage','�ڸ����̵�', 'ī������ �ڸ����̵�', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG',0);
insert into cafehi_menu values(36, 5500,'beverage','��緹���̵�', 'ī������ ��緹���̵�', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG',0);
insert into cafehi_menu values(37, 5000,'fruitJuice','���� �꽺', 'ī������ ���� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(38, 5000,'fruitJuice','�丶�� �꽺', 'ī������ �丶�� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(39, 5000,'fruitJuice','�ٳ��� �꽺', 'ī������ �ٳ��� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(40, 3500,'tea','ī���� ��', 'ī������ ī���� ��', '/cafeHi/img/menu/tea/chamomileTea.JPG',0);
insert into cafehi_menu values(41, 3500,'tea','���۹�Ʈ ��', 'ī������ ���۹�Ʈ ��', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(42, 3500,'tea','����� ��', 'ī������ ����� ��', '/cafeHi/img/menu/tea/RosemaryTea.JPG',0);
insert into cafehi_menu values(43, 3500,'tea','�����ö�� ��', 'ī������ �����ö�� ��', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG',0);
insert into cafehi_menu values(44, 3500,'tea','��� ��', 'ī������ ��� ��', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(45, 3500,'tea','����ڸ���Ƽ', 'ī������ ����ڸ���Ƽ', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg',0);
insert into cafehi_menu values(46, 4500,'tea','�̽���(����)', 'ī������ �̽���(����)', '/cafeHi/img/menu/tea/DewTea.jpg',0);
insert into cafehi_menu values(47, 3500,'tea','���̽�Ƽ', 'ī������ ���̽�Ƽ', '/cafeHi/img/menu/tea/IceTea.jpg',0);
insert into cafehi_menu values(48, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(49, 4500,'tea','�������ڸ���', 'ī������ �������ڸ���', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(50, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(51, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(52, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(53, 4500,'tea','û����', 'ī������ û����', '/cafeHi/img/cafehi_logo.jpeg',0);
insert into cafehi_menu values(54, 4500,'tea','�ڸ���', 'ī������ �ڸ���', '/cafeHi/img/cafehi_logo.jpeg',0);

commit;

select Menu.menu_price, Menu.menu_explain from cafehi_sub_category subCategory, cafehi_menu Menu
where subCategory.category_sub_code = Menu.category_sub_code and subCategory.category_sub_name = 'coldbrew';

-- ��ٱ��� ���̺�

create table cafehi_cart(
    cart_code number not null primary key,
    member_id varchar2(50)not null,
    constraint cart_member_id_fk foreign key(member_id) references cafehi_member(member_id),
    menu_code number not null,
    amount number default 0
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
    member_id varchar2(50)not null,
    constraint order_member_id_fk foreign key(member_id) references cafehi_member(member_id),
    my_membership_code number not null,
    constraint order_membership_code_fk foreign key(my_membership_code) references my_membership(my_membership_code),
    menu_code number not null,
    constraint order_menu_code_fk foreign key(menu_code) references cafehi_menu(menu_code),
    orderState varchar2(30),
    orderDate Date
);


-- �ϴ�) �ʱ� �۾� ���̺�(���� �ʿ�)

-- ����� ����
create table cafehi_mem_coupon(
     user_id varchar2(30) not null,
    constraint fk_user_id_coupon foreign key(user_id) references cafehi_user (user_id),
    mem_code number not null,
     constraint fk_mem_code_coupon foreign key(mem_code) references cafehi_membership (mem_code),
    coupon_code number not null, 
    constraint fk_coupon_code_coupon foreign key(coupon_code) references cafehi_coupon (coupon_code)
);

-- ����
create table cafehi_coupon(
    coupon_code number not null primary key,
    coupon_name varchar2(50) ,
    coupon_price number,
    coupon_start Date,
    coupon_end Date
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
