테이블생성
형식]
    creat table 테이블명(
        컬럼1 자료형 [not null ...],
        컬럼2 자료형 [제약조건 ...],
        .....
        primary key (컬럼명) 등 제약조건 ...
    );
*/
create table tb_member (
    member_idx number(10), --10자리의 정수표현
    userid varchar2(30),
    passwd varchar2(50),
    username varchar2(30),
    mileage number(7,2) --실수표현. 전체 7자리 소수이하 2자리
);
select * from tab;
/*
desc 테이블명 : 생성된 테이블의 속성(구조, 컬럼 타입)을 확인하기
    위한 명령어
*/
desc tb_member;
------------------------------------------------
-----------------DDL 연습문제--------------------
------------------------------------------------
--scott계정에서 진행합니다..

--1번--
create table pr_dept (
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
);

--2번--
create table pr_emp (
    eno number(4),
    ename varchar2(10),
    job varchar2(30),
    regist_date date
);


/*
기존 생성된 테이블에 새로운 컬럼 추가하기
    -> tb_member 테이블에 email 컬럼을 추가하시오.
    
    형식] alter table 테이블명 add 추가할 컬럼 자료형(크기) 제약조건;

alter table tb_member add email varchar2(100);
desc tb_member;
*/

/*
기존 생성된 테이블의 컬럼 수정하기
    -> tb_member테이블의 email 컬럼의 사이즈를 200으로 확장하시오.
    또한, 이름이 저장되는 username컬럼도 60으로 확장하시오.
    
    형식] alter table 테이블명 modify 수정할 컬럼명 자료형(크기);
    
alter table tb_member modify email varchar2(200);
alter table tb_member modify username varchar2(60);
desc tb_member;
*/


--3번--
alter table pr_emp modify ename varchar2(50);



--테이블을 레코드까지 복사하기
create table tb_member_copy
as
select * from tb_member where 1=1;

--4번--
create table pr_emp_clone
as select eno, ename, job from pr_emp where 1=1;
desc pr_emp_clone;

alter table pr_emp_clone rename column eno to e_no;
alter table pr_emp_clone rename column ename to e_name;
alter table pr_emp_clone rename column job to job_id;
desc pr_emp_clone;
/*
create table pr_emp_clone (
    e_no, e_name, job_id
)
as
select eno, ename, job from pr_emp where 1=1;
--추가]기존의 테이블을 그대로 복사하는 방법
create table pr_emp_clone
as
select * from pr_emp;
desc pre_emp_clone;
*/



--5번--
alter table pr_emp_clone rename to pr_emp_clone_rename;
desc pr_emp_clone_rename;
--rename pr_emp_clone to pr_emp_clone_rename;


/*
테이블에서 컬럼 삭제하기
    -> tb_member 테이블의 mileage컬럼을 삭제하시오.
    
    형식] alter table 테이블명 drop column 삭제할 컬럼명;

alter table tb_member drop column mileage;
desc tb_member;
*/

--6번--
alter table pr_dept drop column dname;
desc pr_dept;

--7번--
alter table pr_emp modify job varchar2(50);
desc pr_emp;



/*
테이블 삭제하기]
    -> tb_member 테이블은 더이상 사용하지 않으므로 삭제하시오.
    
    형식] drop table 삭제할 테이블명;?

drop table tb_member;
select * from tab;
*/
--8번--
drop table pr_emp_clone_rename;
select * from tab;

/*
DDL문 -> 테이블을 생성 및 조작하는 쿼리문
테이블생성 : create table 테이블명
컬럼추가 : alter table 테이블명 add
컬럼수정 : alter table 테이블명 modify 
컬럼삭제 : alter table 테이블명 drop column 컬럼명
테이블삭제 : drop table 테이블명
*/

------------------------------------------------
---------------------DML문----------------------
------------------------------------------------
--scott계정에서 진행합니다..
/*
desc tb_sample;
--방식1을 통한 레코드 입력
insert into tb_sample (deptno, deptname, deptloc, deptmanager)
    values (10, '기획실', '서울', '조이');
insert into tb_sample (deptno, deptname, deptloc, deptmanager)
    values (20, '전산팀', '수원', '나은');
--방식2
insert into tb_sample values (30, '영업팀', '대구', '슬기');
insert into tb_sample values (40, '인사팀', '부산', '모모');

select * from tb_sample;
*/

--1번--
desc pr_emp;
insert into pr_emp (eno, ename, job, regist_date)
    values (1, '엄태웅', '어른 승민', sysdate);
insert into pr_emp (eno, ename, job, regist_date)
    values (2, '이제훈', '대학생 승민', sysdate);
insert into pr_emp (eno, ename, job, regist_date)
    values (3, '한가인', '어른 서연', sysdate);
insert into pr_emp (eno, ename, job, regist_date)
    values (4, '수지', '대학생 서연', sysdate);
select * from pr_emp;

--2번--
insert into pr_emp (eno, ename, job, regist_date)
    values (5, '조정석', '납뜩이', to_date(sysdate-7, ‘yy/mm/dd’);
select * from pr_emp;

/*
--부서번호 40인 레코드의 지역을 미국으로 수정하시오.
update tb_sample set deptloc='미국' where deptno=40;
select * from tb_sample;
*/
--3번--
update pr_emp set job='난짝수레코드' where eno%2=0;
select * from pr_emp where mod(eno, 2)=0;
update pr_emp
    set job=job||'(난짝수레코드)'
    where mod(eno,2)=0;
select * from pr_emp;
    

--4번--
create table pr_employees
as select * from emp where 1=1;--where절에 참의 조건을 주면 모든 레코드를 복사한다.
desc pr_employees;
select * from pr_employees;

--사원번호 7900번 확인
select * from pr_employees where empno=7900;--결과 : 매니저사번 7698
--매니저가 7698인 사원을 확인
select * from pr_employees where mgr=7698;--결과 : 부서번호 30
update pr_employees set empno=7900 where ename='FORD';
--FORD의 부서번호 확인
select * from pr_employees where ename='FORD';--결과 : 부서번호 20
--최종업데이트
update pr_employees set deptno=20 where mgr=7698;
select * from pr_employees;


/*
--부서번호가 10인 레코드를 삭제하시오
delete from tb_sample where deptno=10;
select substrb('안녕하세요', 2) from dual;
*/
--5번--
delete from pr_employees where hiredate=to_date(like ___12%);
select substrb('안녕하세요', 2) from dual;
--입사월이 12월인 사원 가져오기
select * from pr_employees where to_char(hiredate, 'mm')=12;--날짜포맷 사용
select * from pr_employees where substr(hiredate,4,2)=12;--문자열자르기 사용
select * from pr_employees where hiredate like '___12%';--like절 사용
--레코드삭제
delete from pr_employees where to_char(hiredate, 'mm')=12;

--6번--
/*
--잘못작성한 예)
update pr_employees set ename='freshmen' where hiredate='..';
select * from pr_employees;
*/

select max(hiredate) from pr_employees;--결과 : 82/01/23
select * from pr_employees where hiredate='82/01/23';
update pr_employees set ename=concat(ename, '(신입사원)')
where hiredate='82/01/23';--컬럼의 크기가 부족하여 에러발생
--컬럼확장
alter table pr_employees modify ename varchar2(30);
--업데이트 확인
select * from pr_employees;

/*
DML문 -> 레코드를 입력 및 조작하는 쿼리문
레코드입력 : insert into 테이블명 (컬럼) values (값)
레코드수정 : update 테이블명 set 컬럼=값 where 조건
레코드삭제 : delete from 테이블명 where 조건
레코드조회 : select 컬럼 from 테이블명 where 조건
*/

------------------------------------------------
--------------------제약조건---------------------
------------------------------------------------
--scott계정에서 진행합니다..

/*
--1번--
--테이블복사
create table pr_emp_const
as
select * from emp where 1=2;--거짓의 조건으로 테이블의 구조만 복사한다.

--PK지정하기
alter table pr_emp_const
    add constraint pr_emp_pk primary key (empno);
    
--데이터사전에서 제약조건 확인하기
select * from user_cons_columns where constraint_name=upper(pr_emp_pk);
select * from user_constraints where lower(constraint_name)='pr_emp_pk';

--2번--
--테이블 구조만 복사--
create table pr_dept_const
as
select * from dept where 1=0;

--기본키 제약조건 추가
alter table pr_dept_const add constraint pr_dept_pk primary key (deptno);

--데이터사전에서 제약조건 확인하기
select * from user_cons_columns where constraint_name=upper(pr_dept_pk);


--3번--
alter table pr_emp_const
    add constraint pr_emp_dept_fk   --제약조건명 추가
    foreign key (deptno)            --자식테이블의 외래키(참조키) 컬럼
    references pr_dept_const (deptno); --부모테이블의 기본키(PK) 컬럼

--데이터사전에서 제약조건 확인하기    
select * from user_cons_columns where constraint_name=upper(pr_emp_dept_fk);


--4번--
alter table pr_emp_const add --[constraint 제약조건명] 생략
    check (comm > 0);
    
--제약조건 확인을 위한 레코드 삽입
insert into pr_emp_const values 
    (100, '아무개', '열정', null, sysdate, 1000, 0, 10);
        --입력실패:check 제약조건 위배
insert into pr_emp_const values 
    (100, '아무개', '열정', null, sysdate, 1000, 0.3, 10);
        --입력실패:외래키 제약조건 위배. 부모키 없음
        
--부모테이블에 레코드 입력
insert into pr_dept_const values (10, '꿈의방', '가산');
insert into pr_dept_const values (20, '열정의방', '디지털');

--앞에서 입력실패한 레코드 입력
insert into pr_emp_const values 
    (100, '아무개', '열정', null, sysdate, 1000, 0.3, 10);
insert into pr_emp_const values 
    (101, '고무개', '꿈', null, sysdate, 800, 0.45, 20);
select * from pr_emp_const;

--5번--
--부모테이블
select * from pr_dept_const;
--자식테이블
select * from pr_emp_const;
--부모테이블에서 레코드 삭제하기
delete from pr_dept_const where deptno=10;/*
                    자식레코드가 있으므로 삭제불가함
                    외래키 제약조건 위배.
                
--외래키 재설정을 위해 기존의 외래키를 삭제한다.
alter table pr_emp_const drop constraint pr_emp_dept_fk;

--외래키 재설정 : 부모레코드 삭제시 자식레코드까지 동시에 삭제되도록 설정
alter table pr_emp_const
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_dept_const (deptno)
    on delete cascade;
--자식레코드가 있는 상태에서 부모레코드 삭제하기
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;
select * from pr_emp_const;--정상적으로 삭제됨.

commit;
*/


--테이블을 레코드까지 복사하기
create table tb_member_copy
as
select * from tb_member where 1=1;

/*

/*
형식3] 테이블 생성후 alter문으로 제약조건 추가
    alter table 테이블명 add [constraint 제약명] primary key (컬럼명);
*/
create table tb_primary3 (
    idx number,
    user_id varchar2(30),
    user_name varchar2(50)
);
alter table tb_primary3 add 
	constraint tb_primary3_pk
		primary key (user_name);
desc tb_primary3;
select * from user_constraints;

--테이블을 삭제하면 부여했던 PK 제약조건도 같이 삭제된다. 
drop table tb_primary3;
select * from user_constraints;

1. emp 테이블의 구조를 복사하여 pr_emp_const 테이블을 만드시오. 
복사된 테이블의 사원번호 칼럼에 pr_emp_pk 라는 이름으로 primary key 제약조건을 지정하시오.
*/
create table pr_emp_const
as
select * from emp where 1=1;
select * from pr_emp_const;

alter table pr_emp_const add
    constraint pr_emp_pk
        primary key (empno);
desc pr_emp_const;



/*
2. dept 테이블의 구조를 복사해서 pr_dept_const 테이블을 만드시오. 
부서번호에 pr_dept_pk 라는 제약조건명으로 primary_key를 생성하시오.
*/
create table pr_dept_const
as
select * from dept where 1=1;
select * from pr_dept_const;

alter table pr_dept_const add
    constraint pr_dept_pk
        primary key (deptno);
desc pr_dept_const;

--drop table pr_dept_const;

/*
3. pr_dept_const 테이블에 존재하지 않는 부서의 사원이 배정되지 않도록 
외래키 제약조건을 지정하되 제약조건 이름은 pr_emp_dept_fk 로 지정하시오.

alter table pr_emp_const
    add constraint pr_emp_dept_fk   --제약조건명 추가
    foreign key (deptno)            --자식테이블의 외래키(참조키) 컬럼
    references pr_dept_const (deptno); --부모테이블의 기본키(PK) 컬럼
*/

alter table pr_emp_const
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_deot_const (deptno);
desc pr_emp_const;

/*
4. pr_emp_const 테이블의 comm 칼럼에 0보다 큰 값만을 입력할수 있도록 
제약조건을 지정하시오. 제약조건명은 지정하지 않아도 된다.
*/
alter table pr_emp_const add check(comm > 0);

alter table pr_emp_const add --[constraint 제약조건명] 생략
    check (comm > 0);
    
--제약조건 확인을 위한 레코드 삽입
insert into pr_emp_const values 
    (100, '아무개', '열정', null, sysdate, 1000, 0, 10);
        --입력실패:check 제약조건 위배
insert into pr_emp_const values 
    (100, '아무개', '열정', null, sysdate, 1000, 0.3, 10);
        --입력실패:외래키 제약조건 위배. 부모키 없음
        
--부모테이블에 레코드 입력
insert into pr_dept_const values (10, '꿈의방', '가산');
insert into pr_dept_const values (20, '열정의방', '디지털');

--앞에서 입력실패한 레코드 입력
insert into pr_emp_const values 
    (100, '아무개', '열정', null, sysdate, 1000, 0.3, 10);
insert into pr_emp_const values 
    (101, '고무개', '꿈', null, sysdate, 800, 0.45, 20);
select * from pr_emp_const;

/*
5. 위 3번에서는 두 테이블간에 외래키가 설정되어서 pr_dept_const 테이블에서 
레코드를 삭제할 수 없었다. 이 경우 부모 레코드를 삭제할 경우 
자식까지 같이 삭제될수 있도록 외래키를 지정하시오.
*/
alter table pr_dept_const add on delete cascade;

--자식 외래키 삭제
alter table pr_emp_const drop constraint pr_emp_dept_fk;

alter table pr_emp_const 
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_dept_const (deptno)
    on delete cascade;
    
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;    

commit;

--부모테이블
select * from pr_dept_const;
--자식테이블
select * from pr_emp_const;
--부모테이블에서 레코드 삭제하기
delete from pr_dept_const where deptno=10;/*
                    자식레코드가 있으므로 삭제불가함
                    외래키 제약조건 위배.
                
--외래키 재설정을 위해 기존의 외래키를 삭제한다.
alter table pr_emp_const drop constraint pr_emp_dept_fk;

--외래키 재설정 : 부모레코드 삭제시 자식레코드까지 동시에 삭제되도록 설정
alter table pr_emp_const
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_dept_const (deptno)
    on delete cascade;
--자식레코드가 있는 상태에서 부모레코드 삭제하기
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;
select * from pr_emp_const;--정상적으로 삭제됨.

commit;
*/



















