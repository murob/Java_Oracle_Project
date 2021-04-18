--��ǰ�ڵ���� : sh_product_code
create table sh_product_code
(
    p_code number primary key,
    category_name varchar2(50) not null
);
desc sh_product_code;

--��ǰ���� : sh_goods
create table sh_goods
(
    g_idx number primary key,
    goods_name varchar2(100) not null,
    goods_price number not null,
    regidate date default sysdate,
    p_code number not null, 
    
    foreign key (p_code)
        references sh_product_code(p_code)
);
desc sh_goods;

-- ��ǰ�����ͷα� : goods_log
create table sh_goods_log
(
    log_idx number primary key,
    goods_name varchar2(100) not null,
    goods_idx number not null,
    p_action char(6) not null
);
desc sh_goods_log;


/*
������ �����ϱ�
    product_code_seq
    goods_seq
    goods_log_seq
*/
create sequence product_code_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
create sequence goods_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
create sequence goods_log_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

--���̵����� �Է�
insert into sh_product_code values (1, '������ǰ');
insert into sh_product_code values (product_code_seq.nextval, '����');
insert into sh_product_code values (product_code_seq.nextval, '��ǻ��');
select * from sh_product_code;

insert into sh_goods 
    values (goods_seq.nextval, 'Sens��Ʈ��', 1200000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, 'Gram��Ʈ��', 1300000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, '�����', 1000000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�κ�û�ұ�', 500000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '�ڹ����α׷���', 30000, sysdate, 2);    
select * from sh_goods;

insert into sh_goods 
    values (goods_seq.nextval, 'DSLRī�޶�', 900000, sysdate, 4); /*
        �θ�Ű�� �����Ƿ� ���� �������� ����
    */

commit;
          




