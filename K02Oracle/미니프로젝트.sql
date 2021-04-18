--상품코드관리 : sh_product_code
create table sh_product_code
(
    p_code number primary key,
    category_name varchar2(50) not null
);
desc sh_product_code;

--상품관리 : sh_goods
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

-- 상품데이터로그 : goods_log
create table sh_goods_log
(
    log_idx number primary key,
    goods_name varchar2(100) not null,
    goods_idx number not null,
    p_action char(6) not null
);
desc sh_goods_log;


/*
시퀀스 생성하기
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

--더미데이터 입력
insert into sh_product_code values (1, '가전제품');
insert into sh_product_code values (product_code_seq.nextval, '도서');
insert into sh_product_code values (product_code_seq.nextval, '컴퓨터');
select * from sh_product_code;

insert into sh_goods 
    values (goods_seq.nextval, 'Sens노트북', 1200000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, 'Gram노트북', 1300000, sysdate, 3);
insert into sh_goods 
    values (goods_seq.nextval, '냉장고', 1000000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '로봇청소기', 500000, sysdate, 1);
insert into sh_goods 
    values (goods_seq.nextval, '자바프로그래밍', 30000, sysdate, 2);    
select * from sh_goods;

insert into sh_goods 
    values (goods_seq.nextval, 'DSLR카메라', 900000, sysdate, 4); /*
        부모키가 없으므로 참조 제약조건 위배
    */

commit;
          




