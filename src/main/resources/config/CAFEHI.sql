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

-- �׽�Ʈ�� ������ ����

insert into cafehi_member values(0, 'admin', 'admin', '������', '01012341234', 'admin@naver.com', '���� ����', '������', '���',1 );
insert into cafehi_member_auth values(0, 0, 'ROLE_ADMIN');

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


-- �޴� ī�װ�
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
---- ���� ī�װ��� ���� ī�װ� �̿� ��� (���̺� Ȯ�强�� ���̰���)
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ Ŀ�� �޴�', 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�Ƹ޸�ī��', 'coffee', 101, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('����������','coffee', 102, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���ڸ޸�ī��','coffee', 103, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���߰�','coffee', 104, 100);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('����','coffee', 105, 100);
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ �ݵ��� �޴�', 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�ݵ���', 'coldbrew', 201, 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�ݵ��� ��', 'coldbrew', 202, 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���ν����', 'coldbrew', 203, 200);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�ݵ���(��)', 'coldbrew', 204, 200);
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ �� �޴�', 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�ٴҶ� ��', 'latte', 300, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���̽�ũ�� ��', 'latte', 301, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('ī���ī', 'latte', 302, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('������� ��', 'latte', 303, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('��ü ��', 'latte', 304, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���ں����', 'latte', 305, 300);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('ī��� �����ƶ�', 'latte', 306, 300);
--
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ ������ �޴�', 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('��ī ����Ǫġ��', 'smoothie', 401, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('ī��� ����Ǫġ��', 'smoothie', 402, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�׸�Ƽ ����Ǫġ��', 'smoothie', 403, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���Ʈ ������', 'smoothie', 404, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���� ���Ʈ ������', 'smoothie', 405, 400);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���� ���Ʈ ������', 'smoothie', 406, 400);
--
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ ���̵� �޴�', 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('ũ�οͻ�', 'side', 501, 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('��ũ�� ũ����', 'side', 502, 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���� ġ�� ũ����', 'side', 503, 500);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���̽�ũ�� ũ����', 'side', 504, 500);
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ ���� �޴�', 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�׸�Ƽ ��', 'beverage', 601, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���� ��', 'beverage', 602, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���� ��', 'beverage', 603, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�������� ��', 'beverage', 604, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�м� �ĸ��� ���̵�', 'beverage', 605, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�����̵�', 'beverage', 606, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('û�ֿ��̵�', 'beverage', 607, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�ڸ����̵�', 'beverage', 608, 600);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('��緹���̵�', 'beverage', 609, 600);
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ �����ֽ� �޴�', 700);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���� �꽺', 'fruitJuice', 701, 700);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�丶�� �꽺', 'fruitJuice', 702, 700);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�ٳ��� �꽺', 'fruitJuice', 703, 700);
--
--insert into cafehi_menu_category(category_name,category_code) values('ī������ �� �޴�', 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('ī���� ��', 'tea', 801, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���۹�Ʈ ��', 'tea', 802, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('����� ��', 'tea', 803, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�����ö�� ��', 'tea', 804, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('��� ��', 'tea', 805, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('����ڸ���Ƽ', 'tea', 806, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�̽���(����)', 'tea', 807, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('���̽�Ƽ', 'tea', 808, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('������', 'tea', 809, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�������ڸ���', 'tea', 810, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('������', 'tea', 811, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('������', 'tea', 812, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('������', 'tea', 813, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('û����', 'tea', 814, 800);
--insert into cafehi_menu_category(category_name,category_type,category_code,category_sub_code) values('�ڸ���', 'tea', 815, 800);
--
--commit;


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
    menu_count number default 0 not null
);

-- ī�װ��� �޴� ���� 
--select cmc.category_code, cmc.category_name, cmc.category_type, cm.menu_explain, cm.menu_img_path, cm.menu_count  
--from cafehi_menu_category cmc, cafehi_menu cm 
--where cmc.category_code = cm.category_code;

--insert into cafehi_menu values(01, 100, 3000, 'ī������ �Ƹ޸�ī��', '/cafeHi/img/menu/coffee/IceAmericano.jpg',0);
--insert into cafehi_menu values(02, 100, 3000, 'ī������ ����������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(03, 100, 4500, 'ī������ ���ڸ޸�ī��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(04, 100, 500, 'ī������ ���߰�', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(05, 100, 1000,'ī������ ����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(06, 200, 4500,'ī������ �ݵ���', '/cafeHi/img/menu/coffee/ColdBrew.JPG',0);
--insert into cafehi_menu values(07, 200, 5000, 'ī������ �����Ƽ(�̱ۿ���)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(08, 200, 5000, 'ī������ �ݵ��� ��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(09, 200, 5500, 'ī������ ���ν����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(10, 200, 15000, 'ī������ �ݵ� ���(��)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(11, 300, 5000, 'ī������ �ٴҶ� ��', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG',0);
--insert into cafehi_menu values(12, 300, 6000, 'ī������ ���̽�ũ�� ��', '/cafeHi/img/menu/latte/IceCreamLatte.JPG',0);
--insert into cafehi_menu values(13, 300, 4700,'ī������ ī���ī', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG',0);
--insert into cafehi_menu values(14, 300, 4500, 'ī������ ������� ��', '/cafeHi/img/menu/latte/HazelnutLatte.JPG',0);
--insert into cafehi_menu values(15, 300, 4700, 'ī������ ��ü ��', '/cafeHi/img/menu/latte/DolceLatte.JPG',0);
--insert into cafehi_menu values(16, 300, 5000, 'ī������ ���ں����', '/cafeHi/img/menu/latte/CitronBianco.JPG',0);
--insert into cafehi_menu values(17, 300, 4700, 'ī������ ī��� �����ƶ�', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG',0);
--insert into cafehi_menu values(18, 400, 4800, 'ī������ ��ī ����Ǫġ��', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(19, 400. 4800, 'ī������ ī��� ����Ǫġ��', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG',0);
--insert into cafehi_menu values(20, 400, 4500, 'ī������ �׸�Ƽ ����Ǫġ��', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG',0);
--insert into cafehi_menu values(21, 400, 4500, 'ī������ ���Ʈ ������', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG',0);
--insert into cafehi_menu values(22, 400, 5000, 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG',0);
--insert into cafehi_menu values(23, 400, 5500, 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(24, 500, 3000, 'ī������ ũ�οͻ�', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(25, 500, 5000, 'ī������ ��ũ�� ũ����', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg',0);
--insert into cafehi_menu values(26, 500, 6000, 'ī������ ���� ġ�� ũ����', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG',0);
--insert into cafehi_menu values(27, 500, 7000, 'ī������ ���̽�ũ�� ũ����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(28, 600, 4500, 'ī������ �׸�Ƽ ��', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG',0);
--insert into cafehi_menu values(29, 600, 4500, 'ī������ ���� ��', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG',0);
--insert into cafehi_menu values(30, 600, 5000, 'ī������ ���� ��', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG',0);
--insert into cafehi_menu values(31, 600, 5000, 'ī������ �������� ��', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG',0);
--insert into cafehi_menu values(32, 600, 4700, 'ī������ �м� �ĸ��� ���̵�', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG',0);
--insert into cafehi_menu values(33, 600, 5000, 'ī������ �����̵�', '/cafeHi/img/menu/beverage/Lemonade.JPG',0);
--insert into cafehi_menu values(34, 600, 5000, 'ī������ û�ֿ��̵�', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG',0);
--insert into cafehi_menu values(35, 600, 5500, 'ī������ �ڸ����̵�', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG',0);
--insert into cafehi_menu values(36, 600, 5500, 'ī������ ��緹���̵�', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG',0);
--insert into cafehi_menu values(37, 700, 5000, 'ī������ ���� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(38, 700, 5000, 'ī������ �丶�� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(39, 700, 5000, 'ī������ �ٳ��� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(40, 800, 3500,'ī������ ī���� ��', '/cafeHi/img/menu/tea/chamomileTea.JPG',0);
--insert into cafehi_menu values(41, 800, 3500, 'ī������ ���۹�Ʈ ��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(42, 800, 3500,'ī������ ����� ��', '/cafeHi/img/menu/tea/RosemaryTea.JPG',0);
--insert into cafehi_menu values(43, 800, 3500, 'ī������ �����ö�� ��', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG',0);
--insert into cafehi_menu values(44, 800, 3500, 'ī������ ��� ��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(45, 800, 3500, 'ī������ ����ڸ���Ƽ', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg',0);
--insert into cafehi_menu values(46, 800, 4500, 'ī������ �̽���(����)', '/cafeHi/img/menu/tea/DewTea.jpg',0);
--insert into cafehi_menu values(47, 800, 3500, 'ī������ ���̽�Ƽ', '/cafeHi/img/menu/tea/IceTea.jpg',0);
--insert into cafehi_menu values(48, 800, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(49, 800, 4500, 'ī������ �������ڸ���', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(50, 800, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(51, 800, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(52, 800, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(53, 800, 4500, 'ī������ û����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(54, 800, 4500, 'ī������ �ڸ���', '/cafeHi/img/cafehi_logo.jpeg',0);


--
--insert into cafehi_menu values(01, 101, 3000, 'ī������ �Ƹ޸�ī��', '/cafeHi/img/menu/coffee/IceAmericano.jpg',0);
--insert into cafehi_menu values(02, 102, 3000, 'ī������ ����������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(03, 103, 4500, 'ī������ ���ڸ޸�ī��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(04, 104, 500, 'ī������ ���߰�', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(05, 105, 1000,'ī������ ����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(06, 201, 4500,'ī������ �ݵ���', '/cafeHi/img/menu/coffee/ColdBrew.JPG',0);
--insert into cafehi_menu values(07, 202, 5000, 'ī������ �����Ƽ(�̱ۿ���)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(08, 203, 5000, 'ī������ �ݵ��� ��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(09, 204, 5500, 'ī������ ���ν����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(10, 205, 15000, 'ī������ �ݵ� ���(��)', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(11, 301, 5000, 'ī������ �ٴҶ� ��', '/cafeHi/img/menu/latte/IceVinilaLatte.JPG',0);
--insert into cafehi_menu values(12, 302, 6000, 'ī������ ���̽�ũ�� ��', '/cafeHi/img/menu/latte/IceCreamLatte.JPG',0);
--insert into cafehi_menu values(13, 303, 4700,'ī������ ī���ī', '/cafeHi/img/menu/latte/IceCaffeMoca.JPG',0);
--insert into cafehi_menu values(14, 304, 4500, 'ī������ ������� ��', '/cafeHi/img/menu/latte/HazelnutLatte.JPG',0);
--insert into cafehi_menu values(15, 305, 4700, 'ī������ ��ü ��', '/cafeHi/img/menu/latte/DolceLatte.JPG',0);
--insert into cafehi_menu values(16, 306, 5000, 'ī������ ���ں����', '/cafeHi/img/menu/latte/CitronBianco.JPG',0);
--insert into cafehi_menu values(17, 307, 4700, 'ī������ ī��� �����ƶ�', '/cafeHi/img/menu/latte/CaramelMacchiato.JPG',0);
--insert into cafehi_menu values(18, 401, 4800, 'ī������ ��ī ����Ǫġ��', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(19, 402. 4800, 'ī������ ī��� ����Ǫġ��', '/cafeHi/img/menu/smoothie/CaramelFrappuccino.JPG',0);
--insert into cafehi_menu values(20, 403, 4500, 'ī������ �׸�Ƽ ����Ǫġ��', '/cafeHi/img/menu/smoothie/greenteaFrappuccino.JPG',0);
--insert into cafehi_menu values(21, 404, 4500, 'ī������ ���Ʈ ������', '/cafeHi/img/menu/smoothie/yogurtSmoothie.JPG',0);
--insert into cafehi_menu values(22, 405, 5000, 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/cloudSmoothie.JPG',0);
--insert into cafehi_menu values(23, 406, 5500, 'ī������ ���� ���Ʈ ������', '/cafeHi/img/menu/smoothie/MocaFrappuccino.JPG',0);
--insert into cafehi_menu values(24, 501, 3000, 'ī������ ũ�οͻ�', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(25, 502, 5000, 'ī������ ��ũ�� ũ����', '/cafeHi/img/menu/side/WhippedCreamCrople.jpg',0);
--insert into cafehi_menu values(26, 503, 6000, 'ī������ ���� ġ�� ũ����', '/cafeHi/img/menu/side/BrownCheeseCrople.JPG',0);
--insert into cafehi_menu values(27, 504, 7000, 'ī������ ���̽�ũ�� ũ����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(28, 601, 4500, 'ī������ �׸�Ƽ ��', '/cafeHi/img/menu/beverage/GreenTeaLatte.JPG',0);
--insert into cafehi_menu values(29, 602, 4500, 'ī������ ���� ��', '/cafeHi/img/menu/beverage/ChocolateLatte.JPG',0);
--insert into cafehi_menu values(30, 603, 5000, 'ī������ ���� ��', '/cafeHi/img/menu/beverage/StrawberryLatte.JPG',0);
--insert into cafehi_menu values(31, 604, 5000, 'ī������ �������� ��', '/cafeHi/img/menu/beverage/BerryBerryLatte.JPG',0);
--insert into cafehi_menu values(32, 605, 4700, 'ī������ �м� �ĸ��� ���̵�', '/cafeHi/img/menu/beverage/PassionFruitAde.JPG',0);
--insert into cafehi_menu values(33, 606, 5000, 'ī������ �����̵�', '/cafeHi/img/menu/beverage/Lemonade.JPG',0);
--insert into cafehi_menu values(34, 607, 5000, 'ī������ û�ֿ��̵�', '/cafeHi/img/menu/beverage/GreenTangerineAde.JPG',0);
--insert into cafehi_menu values(35, 608, 5500, 'ī������ �ڸ����̵�', '/cafeHi/img/menu/beverage/GrapefruitAde.JPG',0);
--insert into cafehi_menu values(36, 609, 5500, 'ī������ ��緹���̵�', '/cafeHi/img/menu/beverage/BlueLemonAde.JPG',0);
--insert into cafehi_menu values(37, 701, 5000, 'ī������ ���� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(38, 702, 5000, 'ī������ �丶�� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(39, 703, 5000, 'ī������ �ٳ��� �꽺', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(40, 801, 3500,'ī������ ī���� ��', '/cafeHi/img/menu/tea/chamomileTea.JPG',0);
--insert into cafehi_menu values(41, 802, 3500, 'ī������ ���۹�Ʈ ��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(42, 803, 3500,'ī������ ����� ��', '/cafeHi/img/menu/tea/RosemaryTea.JPG',0);
--insert into cafehi_menu values(43, 804, 3500, 'ī������ �����ö�� ��', '/cafeHi/img/menu/tea/RoseFlowerTea.JPG',0);
--insert into cafehi_menu values(44, 805, 3500, 'ī������ ��� ��', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(45, 806, 3500, 'ī������ ����ڸ���Ƽ', '/cafeHi/img/menu/tea/HoneyGrapefruitBlackTea.jpg',0);
--insert into cafehi_menu values(46, 807, 4500, 'ī������ �̽���(����)', '/cafeHi/img/menu/tea/DewTea.jpg',0);
--insert into cafehi_menu values(47, 808, 3500, 'ī������ ���̽�Ƽ', '/cafeHi/img/menu/tea/IceTea.jpg',0);
--insert into cafehi_menu values(48, 809, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(49, 810, 4500, 'ī������ �������ڸ���', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(50, 811, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(51, 812, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(52, 813, 4500, 'ī������ ������', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(53, 814, 4500, 'ī������ û����', '/cafeHi/img/cafehi_logo.jpeg',0);
--insert into cafehi_menu values(54, 815, 4500, 'ī������ �ڸ���', '/cafeHi/img/cafehi_logo.jpeg',0);


-- ���� ���̺� �� �ִ� ��� 

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

-- �ֹ� �޴� 
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
