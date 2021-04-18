/*
Java에서 처음으로 JDBC프로그래밍 해보기
*/
--우선 system계정을 연결한 후 새로운 계정을 생성한다.
create user kosmo identified by 1234;
grant connect, resource to kosmo;

--계정을 생성한 후 접속창에 kosmo계정을 등록하고 해당 문서에 연결한다.
--회원관리 테이블 : member 생성
create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate,
    primary key(id)
);
--더미데이터 입력하기
insert into member (id, pass, name) values ('test', '1234', '테스트');
select * from member;
select to_char(regidate, 'yyyy-mm-dd hh24:mi:ss') "회원가입일" from member;
commit;

/*
퀴즈] 위에서 생성한 테이블에 외래키와 시퀀스를 설정하시오.
1. 외래키명 : bbs_mem_fk
tb_bbs테이블의 id 컬럼이 member 테이블의 id 컬럼을 참조하도록 외래키를 생성
2. 시퀀스명 : seq_bbs_num
tb_bbs테이블에 데이터를 입력시 num 컬럼이 자동증가 할수있도록 시퀀스를 생성
*/

--게시판 테이블 생성하기
CREATE TABLE tb_bbs
(
	num NUMBER NOT NULL ,
	title VARCHAR2(100) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	postdate DATE DEFAULT SYSDATE,
	id VARCHAR2(10) NOT NULL,
	PRIMARY KEY (num)
);


--1.외래키 생성
alter table tb_bbs add
    constraint bbs_mem_fk
        foreign key (id) references member (id);
        
--1-1.데이터사전에서 확인
select * from user_constraints;
--2.시퀀스생성
create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--2-1.시퀀스 확인
select * seq_bbs_num.nextval from dual;


--레코드 삭제하기 : delete
delete from member where id='test3';
commit;

--레코드 수정하기 : update
update member set pass='9999', name='홍길동', regidate=sysdate
    where id='test2';
select * from member;
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;

--레코드 입력하기 : insert
insert into member (id, pass, name) values ('test99', '9999', '테스트99');
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;
commit;
/*
    오라클에서 직접 insert를 한후 commit하지 않으면 외부에서는
    변경된 레코드를 확인할 수 없으므로 실행에 오류가 발생하거나
    전혀 적용되지 않게된다. 처음 insert를 했을때에는 임시테이블에
    저장되고, commit 후에 실제 테이블에 저장된다.
*/

--like를 이용한 이름검색
select * from member where name like '%길동%';
select * from member where name like '%테%';



















