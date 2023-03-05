-- ���̺� �÷� ��ȸ

select * from tab;
select * from cafehi_member;
select * from cafehi_member_auth;
select * from cafehi_qna;
select * from cafehi_membership;
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

delete cafehi_member_auth;
delete cafehi_member;
delete cafehi_membership;
delete cafehi_admin;
delete cafehi_qna;
delete cafehi_menu;
delete cafehi_cart;
delete cafehi_order;
delete cafehi_order_menu;

update cafehi_membership set membership_point = 0, membership_grade = 'STANDARD' 
where member_code = 1;


-- ����
drop table cafehi_mem_coupon;
drop table cafehi_coupon;
drop table cafehi_order_menu;
drop table cafehi_order;
drop table cafehi_cart;
drop table cafehi_menu;
drop table cafehi_membership;
drop table cafehi_qna;
drop table cafehi_member_auth;
drop table cafehi_member;
	

------------------------------------ ���̺� ������ ���� ���� -------------------------------------

-- �������� ������ ���� 20�� ���̳��� ���� �̻� ���� �߰�
-- �˻��غ��� �������� �⺻������ ĳ���� �ϰ� �� �ɼ��� ���� �ֱ� �����̶�� ���
-- https://bae9086.tistory.com/297 ��α� ���� �����Ͽ� ������ �ɼ� ����

-- ����� ���� ������ 
create sequence seq_member_auth
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_MEMBER_AUTH'; -- ������ ���� ��ȸ

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_MEMBER_AUTH'; -- ������ ������ ��ȸ

drop sequence seq_member_auth;

-- ����� ������ 
create sequence seq_member
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_MEMBER';

drop sequence seq_member;

-- �Խ��� ������
create sequence seq_qna
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_QNA';

drop sequence seq_qna;

-- ����� ������
create sequence seq_membership
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_MEMBERSHIP';

drop sequence seq_membership;

-- �޴� ������
create sequence seq_menu
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_MENU';

drop sequence seq_menu;


-- ��ٱ��� ������ ����
create sequence seq_cart
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_CART';

drop sequence seq_cart;


-- �ֹ� ������
create sequence seq_order
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_ORDER';

drop sequence seq_order;

-- �ֹ� �޴� ������

create sequence seq_order_menu
start with 1
minvalue 1
nomaxvalue
increment by 1
nocycle
nocache
order;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_ORDER_MENU';

drop sequence seq_order_menu;



------------------------- ������ ���� �� --------------------------------------



--------------------------- ���̺� ���� ���� ------------------------------------ 

-- ����� ���� ���� ���̺�
create table cafehi_member_auth(
    member_auth_code number primary key, -- ����� ���� ���� �ڵ�
    member_auth varchar2(50) not null, -- ������ ��ť��Ƽ ����� ���� : ROLE_USER, ROLE_ADMIN ...
    member_auth_writetime timestamp not null, -- ����� ���� �����
    member_auth_updatetime timestamp not null -- ����� ���� ������
);


-- ����� ���� ���̺�
create table cafehi_member(
    member_code number primary key, -- ����� �ڵ� 
    member_id varchar2(50) not null, -- ����� ���̵�   
    member_pw varchar2(100) not null, -- ����� ��й�ȣ
    member_name varchar2(50) not null, -- ����� �̸� 
    member_contact varchar2(15) not null, -- ����� ����ó
    member_email varchar2(50) not null, -- ����� ���� ������ �̸���
    member_road_address varchar2(100), -- ����� ���θ� �ּ�
    member_jibun_address varchar2(100), -- ����� ���� �ּ�
    member_detail_address varchar2(100), -- ����� �� �ּ� 
    enabled char(1) default '1', -- ������ ��ť��Ƽ ���� ��� ����
    member_writetime timestamp not null, -- ����� �����
    member_updatetime timestamp not null, -- ����� ������
    member_auth_code number, -- ����� ���� ���� Ű (���� ���� �⺻Ű�� ��� ���̺��� �ܷ�Ű�� ����)
    constraint fk_member_auth foreign key(member_auth_code) references cafehi_member_auth(member_auth_code) on delete cascade
);


--  QnA �Խ��� 
create table cafehi_qna(
    qna_num number primary key, -- QnA �Խñ� ��ȣ
    qna_title varchar2(200) not null, -- QnA �Խñ� ����
    qna_title_classification varchar2(50), -- ����� ���Ѻ� QnA ���� �з� 
    qna_content varchar2(500) not null, -- QnA �Խñ� ����
    qna_writetime timestamp not null, -- QnA �Խñ� �ۼ���
    qna_updatetime timestamp not null, -- QnA �Խñ� ������
    qna_hit number not null, -- QnA �Խñ� ��ȸ��
    upload_path varchar2(500), -- QnA �Խñ� ���ε� ��� 
    store_file_name varchar2(300), -- QnA �Խñ� ���� ���� ���ϸ�
    upload_file_name varchar2(100), -- QnA �Խñ� Ŭ���̾�Ʈ ���� ���ϸ�
    member_code number not null, -- ����� �ڵ�
    constraint fk_qna_member_code foreign key(member_code) references cafehi_member (member_code) on delete cascade 
);


-- ī������ ����� 
create table cafehi_membership(
    membership_code number primary key, -- ����� �ڵ�
    member_code  number not null, -- ��� �ڵ� 
    constraint fk_my_membership_member_code foreign key(member_code) references cafehi_member (member_code) on delete cascade,
    membership_grade varchar2(30) not null, -- ����� ���
    membership_point number default 0 not null, -- ����� ����Ʈ
    membership_writetime timestamp not null, -- ����� �����
    membership_updatetime timestamp not null -- ����� ������
);


-- �޴�
create table cafehi_menu(
    menu_code number primary key, -- �޴� �ڵ�
    menu_price number not null, -- �޴� ����
    menu_type varchar2(50) not null, -- �޴� ����
    menu_name varchar2(50) not null, -- �޴� �̸�
    menu_explain varchar2(100) not null, -- �޴� ����
    menu_img_path varchar2(200) not null, -- �޴� �̹��� ���
    menu_stock_quantity number default 1000 not null, -- �޴� ��� ���� 
    menu_writetime timestamp not null, -- �޴� ����� 
    menu_updatetime timestamp not null -- �޴� ������
);

insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(01, 3000,'coffee','�Ƹ޸�ī��', 'ī������ �Ƹ޸�ī��', '/cafeHi/img/menu/coffee/IceAmericano.jpg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(02, 3000,'coffee','����������', 'ī������ ����������', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(03, 4500,'coffee','���ڸ޸�ī��', 'ī������ ���ڸ޸�ī��', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(04, 500,'coffee','���߰�', 'ī������ ���߰�', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(05, 1000,'coffee','����', 'ī������ ����', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(06, 4500,'coldbrew','�ݵ���', 'ī������ �ݵ���', '/cafeHi/img/menu/coffee/ColdBrew.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(07, 5000,'coldbrew','�����Ƽ(�̱ۿ���)', 'ī������ �����Ƽ(�̱ۿ���)', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(08, 5000,'coldbrew','�ݵ��� ��', 'ī������ �ݵ��� ��', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(09, 5500,'coldbrew','���ν����', 'ī������ ���ν����', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(10, 15000,'coldbrew','�ݵ���(��)', 'ī������ �ݵ� ���(��)', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(11, 5000,'latte','�ٴҶ� ��', 'ī������ �ٴҶ� ��', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(12, 6000,'latte','���̽�ũ�� ��', 'ī������ ���̽�ũ�� ��', '/cafeHi/img/menu/latte/IceCreamLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(13, 4700,'latte','ī���ī' ,'ī������ ī���ī', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(14, 4500,'latte','������� ��', 'ī������ ������� ��', '/cafeHi/img/menu/latte/HazelnutLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(15, 4700,'latte','��ü ��', 'ī������ ��ü ��', '/cafeHi/img/menu/latte/DolceLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(16, 5000,'latte','���ں����', 'ī������ ���ں����', '/cafeHi/img/menu/latte/CitronBianco.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(17, 4700,'latte','ī��� �����ƶ�', 'ī������ ī��� �����ƶ�', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(18, 4800,'smoothie','��ī ����Ǫġ��', 'ī������ ��ī ����Ǫġ��', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(19, 4800,'smoothie','ī��� ����Ǫġ��', 'ī������ ī��� ����Ǫġ��', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(20, 4500,'smoothie','�׸�Ƽ ����Ǫġ��', 'ī������ �׸�Ƽ ����Ǫġ��', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(21, 4500,'smoothie','���Ʈ ������', 'ī������ ���Ʈ ������', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(22, 5000,'smoothie','���� ���Ʈ ������', 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(23, 5500,'smoothie','���� ���Ʈ ������', 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(24, 3000,'side','ũ�οͻ�', 'ī������ ũ�οͻ�', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(25, 5000,'side','��ũ�� ũ����', 'ī������ ��ũ�� ũ����', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(26, 6000,'side','���� ġ�� ũ����', 'ī������ ���� ġ�� ũ����', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(27, 7000,'side','���̽�ũ�� ũ����', 'ī������ ���̽�ũ�� ũ����', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(28, 4500,'beverage','�׸�Ƽ ��', 'ī������ �׸�Ƽ ��', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(29, 4500,'beverage','���� ��', 'ī������ ���� ��', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(30, 5000,'beverage','���� ��', 'ī������ ���� ��', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(31, 5000,'beverage','�������� ��', 'ī������ �������� ��', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(32, 4700,'beverage','�м� �ĸ��� ���̵�', 'ī������ �м� �ĸ��� ���̵�', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(33, 5000,'beverage','�����̵�', 'ī������ �����̵�', '/cafeHi/img/menu/beverage/Lemonade.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(34, 5000,'beverage','û�ֿ��̵�', 'ī������ û�ֿ��̵�', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(35, 5500,'beverage','�ڸ����̵�', 'ī������ �ڸ����̵�', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(36, 5500,'beverage','��緹���̵�', 'ī������ ��緹���̵�', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(37, 5000,'fruitJuice','���� �꽺', 'ī������ ���� �꽺', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(38, 5000,'fruitJuice','�丶�� �꽺', 'ī������ �丶�� �꽺', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(39, 5000,'fruitJuice','�ٳ��� �꽺', 'ī������ �ٳ��� �꽺', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(40, 3500,'tea','ī���� ��', 'ī������ ī���� ��', '/cafeHi/img/menu/tea/chamomileTea.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(41, 3500,'tea','���۹�Ʈ ��', 'ī������ ���۹�Ʈ ��', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(42, 3500,'tea','����� ��', 'ī������ ����� ��', '/cafeHi/img/menu/tea/RosemaryTea.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(43, 3500,'tea','�����ö�� ��', 'ī������ �����ö�� ��', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(44, 3500,'tea','��� ��', 'ī������ ��� ��', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(45, 3500,'tea','����ڸ���Ƽ', 'ī������ ����ڸ���Ƽ', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(46, 4500,'tea','�̽���(����)', 'ī������ �̽���(����)', '/cafeHi/img/menu/tea/DewTea.jpg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(47, 3500,'tea','���̽�Ƽ', 'ī������ ���̽�Ƽ', '/cafeHi/img/menu/tea/IceTea.jpg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(48, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(49, 4500,'tea','�������ڸ���', 'ī������ �������ڸ���', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(50, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(51, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(52, 4500,'tea','������', 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(53, 4500,'tea','û����', 'ī������ û����', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);
insert into cafehi_menu(menu_code, menu_price, menu_type, menu_name, menu_explain, menu_img_path, menu_writetime, menu_updatetime) values(54, 4500,'tea','�ڸ���', 'ī������ �ڸ���', '/cafeHi/img/cafehi_logo.jpeg', systimestamp, systimestamp);

commit;

-- ��ٱ��� ���̺�

create table cafehi_cart(
    cart_code number not null primary key, -- ��ٱ��� �ڵ�
    member_code number not null, -- ����� �ڵ� 
    constraint fk_cart_member_code foreign key(member_code) references cafehi_member(member_code),
    menu_code number not null, -- �޴� �ڵ� 
    cart_amount number default 0, -- ��ٱ��� ��
    cart_writetime timestamp, -- ��ٱ��� �����
    cart_updatetime timestamp -- ��ٱ��� ������
);


-- �ֹ�
create table cafehi_order(
    order_code number not null primary key, -- �ֹ��ڵ� 
    member_code number not null, -- ������ڵ�
    constraint fk_order_membercode foreign key(member_code) references cafehi_member(member_code) on delete cascade,
    order_status varchar2(30), -- �ֹ� ����
    order_writetime timestamp, -- �ֹ�����
    order_updatetime timestamp, -- �������� 
    include_delivery char(1) -- ��ۺ� ���� ����
);

-- �ֹ� �޴� 
create table cafehi_order_menu(
    order_menu_code number primary key, -- �ֹ��޴� �ڵ� 
    order_code number not null, -- �ֹ� �ڵ�  
    constraint fk_order_menu_ordercode foreign key(order_code) references cafehi_order(order_code) on delete cascade,
    menu_code number not null, -- �޴� �ڵ� 
    constraint fk_order_menu_menucode foreign key(menu_code) references cafehi_menu(menu_code),
    total_order_price number not null, -- �ֹ� ����
    total_order_count number not null, -- �ֹ� �޴� ����
    order_menu_writetime timestamp, -- �ֹ� �޴� ����� 
    order_menu_updatetime timestamp -- �ֹ� �޴� ������
);




SELECT om.order_menu_code, om.order_code, om.menu_code, om.total_order_price, om.total_order_count, o.orderState, o.orderDate
FROM cafehi_order o LEFT OUTER JOIN cafehi_order_menu om
ON o.order_code = om.order_code AND o.member_code = 12;




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


