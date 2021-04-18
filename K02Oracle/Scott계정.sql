���̺����
����]
    creat table ���̺��(
        �÷�1 �ڷ��� [not null ...],
        �÷�2 �ڷ��� [�������� ...],
        .....
        primary key (�÷���) �� �������� ...
    );
*/
create table tb_member (
    member_idx number(10), --10�ڸ��� ����ǥ��
    userid varchar2(30),
    passwd varchar2(50),
    username varchar2(30),
    mileage number(7,2) --�Ǽ�ǥ��. ��ü 7�ڸ� �Ҽ����� 2�ڸ�
);
select * from tab;
/*
desc ���̺�� : ������ ���̺��� �Ӽ�(����, �÷� Ÿ��)�� Ȯ���ϱ�
    ���� ��ɾ�
*/
desc tb_member;
------------------------------------------------
-----------------DDL ��������--------------------
------------------------------------------------
--scott�������� �����մϴ�..

--1��--
create table pr_dept (
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
);

--2��--
create table pr_emp (
    eno number(4),
    ename varchar2(10),
    job varchar2(30),
    regist_date date
);


/*
���� ������ ���̺� ���ο� �÷� �߰��ϱ�
    -> tb_member ���̺� email �÷��� �߰��Ͻÿ�.
    
    ����] alter table ���̺�� add �߰��� �÷� �ڷ���(ũ��) ��������;

alter table tb_member add email varchar2(100);
desc tb_member;
*/

/*
���� ������ ���̺��� �÷� �����ϱ�
    -> tb_member���̺��� email �÷��� ����� 200���� Ȯ���Ͻÿ�.
    ����, �̸��� ����Ǵ� username�÷��� 60���� Ȯ���Ͻÿ�.
    
    ����] alter table ���̺�� modify ������ �÷��� �ڷ���(ũ��);
    
alter table tb_member modify email varchar2(200);
alter table tb_member modify username varchar2(60);
desc tb_member;
*/


--3��--
alter table pr_emp modify ename varchar2(50);



--���̺��� ���ڵ���� �����ϱ�
create table tb_member_copy
as
select * from tb_member where 1=1;

--4��--
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
--�߰�]������ ���̺��� �״�� �����ϴ� ���
create table pr_emp_clone
as
select * from pr_emp;
desc pre_emp_clone;
*/



--5��--
alter table pr_emp_clone rename to pr_emp_clone_rename;
desc pr_emp_clone_rename;
--rename pr_emp_clone to pr_emp_clone_rename;


/*
���̺��� �÷� �����ϱ�
    -> tb_member ���̺��� mileage�÷��� �����Ͻÿ�.
    
    ����] alter table ���̺�� drop column ������ �÷���;

alter table tb_member drop column mileage;
desc tb_member;
*/

--6��--
alter table pr_dept drop column dname;
desc pr_dept;

--7��--
alter table pr_emp modify job varchar2(50);
desc pr_emp;



/*
���̺� �����ϱ�]
    -> tb_member ���̺��� ���̻� ������� �����Ƿ� �����Ͻÿ�.
    
    ����] drop table ������ ���̺��;?

drop table tb_member;
select * from tab;
*/
--8��--
drop table pr_emp_clone_rename;
select * from tab;

/*
DDL�� -> ���̺��� ���� �� �����ϴ� ������
���̺���� : create table ���̺��
�÷��߰� : alter table ���̺�� add
�÷����� : alter table ���̺�� modify 
�÷����� : alter table ���̺�� drop column �÷���
���̺���� : drop table ���̺��
*/

------------------------------------------------
---------------------DML��----------------------
------------------------------------------------
--scott�������� �����մϴ�..
/*
desc tb_sample;
--���1�� ���� ���ڵ� �Է�
insert into tb_sample (deptno, deptname, deptloc, deptmanager)
    values (10, '��ȹ��', '����', '����');
insert into tb_sample (deptno, deptname, deptloc, deptmanager)
    values (20, '������', '����', '����');
--���2
insert into tb_sample values (30, '������', '�뱸', '����');
insert into tb_sample values (40, '�λ���', '�λ�', '���');

select * from tb_sample;
*/

--1��--
desc pr_emp;
insert into pr_emp (eno, ename, job, regist_date)
    values (1, '���¿�', '� �¹�', sysdate);
insert into pr_emp (eno, ename, job, regist_date)
    values (2, '������', '���л� �¹�', sysdate);
insert into pr_emp (eno, ename, job, regist_date)
    values (3, '�Ѱ���', '� ����', sysdate);
insert into pr_emp (eno, ename, job, regist_date)
    values (4, '����', '���л� ����', sysdate);
select * from pr_emp;

--2��--
insert into pr_emp (eno, ename, job, regist_date)
    values (5, '������', '������', to_date(sysdate-7, ��yy/mm/dd��);
select * from pr_emp;

/*
--�μ���ȣ 40�� ���ڵ��� ������ �̱����� �����Ͻÿ�.
update tb_sample set deptloc='�̱�' where deptno=40;
select * from tb_sample;
*/
--3��--
update pr_emp set job='��¦�����ڵ�' where eno%2=0;
select * from pr_emp where mod(eno, 2)=0;
update pr_emp
    set job=job||'(��¦�����ڵ�)'
    where mod(eno,2)=0;
select * from pr_emp;
    

--4��--
create table pr_employees
as select * from emp where 1=1;--where���� ���� ������ �ָ� ��� ���ڵ带 �����Ѵ�.
desc pr_employees;
select * from pr_employees;

--�����ȣ 7900�� Ȯ��
select * from pr_employees where empno=7900;--��� : �Ŵ������ 7698
--�Ŵ����� 7698�� ����� Ȯ��
select * from pr_employees where mgr=7698;--��� : �μ���ȣ 30
update pr_employees set empno=7900 where ename='FORD';
--FORD�� �μ���ȣ Ȯ��
select * from pr_employees where ename='FORD';--��� : �μ���ȣ 20
--����������Ʈ
update pr_employees set deptno=20 where mgr=7698;
select * from pr_employees;


/*
--�μ���ȣ�� 10�� ���ڵ带 �����Ͻÿ�
delete from tb_sample where deptno=10;
select substrb('�ȳ��ϼ���', 2) from dual;
*/
--5��--
delete from pr_employees where hiredate=to_date(like ___12%);
select substrb('�ȳ��ϼ���', 2) from dual;
--�Ի���� 12���� ��� ��������
select * from pr_employees where to_char(hiredate, 'mm')=12;--��¥���� ���
select * from pr_employees where substr(hiredate,4,2)=12;--���ڿ��ڸ��� ���
select * from pr_employees where hiredate like '___12%';--like�� ���
--���ڵ����
delete from pr_employees where to_char(hiredate, 'mm')=12;

--6��--
/*
--�߸��ۼ��� ��)
update pr_employees set ename='freshmen' where hiredate='..';
select * from pr_employees;
*/

select max(hiredate) from pr_employees;--��� : 82/01/23
select * from pr_employees where hiredate='82/01/23';
update pr_employees set ename=concat(ename, '(���Ի��)')
where hiredate='82/01/23';--�÷��� ũ�Ⱑ �����Ͽ� �����߻�
--�÷�Ȯ��
alter table pr_employees modify ename varchar2(30);
--������Ʈ Ȯ��
select * from pr_employees;

/*
DML�� -> ���ڵ带 �Է� �� �����ϴ� ������
���ڵ��Է� : insert into ���̺�� (�÷�) values (��)
���ڵ���� : update ���̺�� set �÷�=�� where ����
���ڵ���� : delete from ���̺�� where ����
���ڵ���ȸ : select �÷� from ���̺�� where ����
*/

------------------------------------------------
--------------------��������---------------------
------------------------------------------------
--scott�������� �����մϴ�..

/*
--1��--
--���̺���
create table pr_emp_const
as
select * from emp where 1=2;--������ �������� ���̺��� ������ �����Ѵ�.

--PK�����ϱ�
alter table pr_emp_const
    add constraint pr_emp_pk primary key (empno);
    
--�����ͻ������� �������� Ȯ���ϱ�
select * from user_cons_columns where constraint_name=upper(pr_emp_pk);
select * from user_constraints where lower(constraint_name)='pr_emp_pk';

--2��--
--���̺� ������ ����--
create table pr_dept_const
as
select * from dept where 1=0;

--�⺻Ű �������� �߰�
alter table pr_dept_const add constraint pr_dept_pk primary key (deptno);

--�����ͻ������� �������� Ȯ���ϱ�
select * from user_cons_columns where constraint_name=upper(pr_dept_pk);


--3��--
alter table pr_emp_const
    add constraint pr_emp_dept_fk   --�������Ǹ� �߰�
    foreign key (deptno)            --�ڽ����̺��� �ܷ�Ű(����Ű) �÷�
    references pr_dept_const (deptno); --�θ����̺��� �⺻Ű(PK) �÷�

--�����ͻ������� �������� Ȯ���ϱ�    
select * from user_cons_columns where constraint_name=upper(pr_emp_dept_fk);


--4��--
alter table pr_emp_const add --[constraint �������Ǹ�] ����
    check (comm > 0);
    
--�������� Ȯ���� ���� ���ڵ� ����
insert into pr_emp_const values 
    (100, '�ƹ���', '����', null, sysdate, 1000, 0, 10);
        --�Է½���:check �������� ����
insert into pr_emp_const values 
    (100, '�ƹ���', '����', null, sysdate, 1000, 0.3, 10);
        --�Է½���:�ܷ�Ű �������� ����. �θ�Ű ����
        
--�θ����̺� ���ڵ� �Է�
insert into pr_dept_const values (10, '���ǹ�', '����');
insert into pr_dept_const values (20, '�����ǹ�', '������');

--�տ��� �Է½����� ���ڵ� �Է�
insert into pr_emp_const values 
    (100, '�ƹ���', '����', null, sysdate, 1000, 0.3, 10);
insert into pr_emp_const values 
    (101, '����', '��', null, sysdate, 800, 0.45, 20);
select * from pr_emp_const;

--5��--
--�θ����̺�
select * from pr_dept_const;
--�ڽ����̺�
select * from pr_emp_const;
--�θ����̺��� ���ڵ� �����ϱ�
delete from pr_dept_const where deptno=10;/*
                    �ڽķ��ڵ尡 �����Ƿ� �����Ұ���
                    �ܷ�Ű �������� ����.
                
--�ܷ�Ű �缳���� ���� ������ �ܷ�Ű�� �����Ѵ�.
alter table pr_emp_const drop constraint pr_emp_dept_fk;

--�ܷ�Ű �缳�� : �θ��ڵ� ������ �ڽķ��ڵ���� ���ÿ� �����ǵ��� ����
alter table pr_emp_const
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_dept_const (deptno)
    on delete cascade;
--�ڽķ��ڵ尡 �ִ� ���¿��� �θ��ڵ� �����ϱ�
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;
select * from pr_emp_const;--���������� ������.

commit;
*/


--���̺��� ���ڵ���� �����ϱ�
create table tb_member_copy
as
select * from tb_member where 1=1;

/*

/*
����3] ���̺� ������ alter������ �������� �߰�
    alter table ���̺�� add [constraint �����] primary key (�÷���);
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

--���̺��� �����ϸ� �ο��ߴ� PK �������ǵ� ���� �����ȴ�. 
drop table tb_primary3;
select * from user_constraints;

1. emp ���̺��� ������ �����Ͽ� pr_emp_const ���̺��� ����ÿ�. 
����� ���̺��� �����ȣ Į���� pr_emp_pk ��� �̸����� primary key ���������� �����Ͻÿ�.
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
2. dept ���̺��� ������ �����ؼ� pr_dept_const ���̺��� ����ÿ�. 
�μ���ȣ�� pr_dept_pk ��� �������Ǹ����� primary_key�� �����Ͻÿ�.
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
3. pr_dept_const ���̺� �������� �ʴ� �μ��� ����� �������� �ʵ��� 
�ܷ�Ű ���������� �����ϵ� �������� �̸��� pr_emp_dept_fk �� �����Ͻÿ�.

alter table pr_emp_const
    add constraint pr_emp_dept_fk   --�������Ǹ� �߰�
    foreign key (deptno)            --�ڽ����̺��� �ܷ�Ű(����Ű) �÷�
    references pr_dept_const (deptno); --�θ����̺��� �⺻Ű(PK) �÷�
*/

alter table pr_emp_const
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_deot_const (deptno);
desc pr_emp_const;

/*
4. pr_emp_const ���̺��� comm Į���� 0���� ū ������ �Է��Ҽ� �ֵ��� 
���������� �����Ͻÿ�. �������Ǹ��� �������� �ʾƵ� �ȴ�.
*/
alter table pr_emp_const add check(comm > 0);

alter table pr_emp_const add --[constraint �������Ǹ�] ����
    check (comm > 0);
    
--�������� Ȯ���� ���� ���ڵ� ����
insert into pr_emp_const values 
    (100, '�ƹ���', '����', null, sysdate, 1000, 0, 10);
        --�Է½���:check �������� ����
insert into pr_emp_const values 
    (100, '�ƹ���', '����', null, sysdate, 1000, 0.3, 10);
        --�Է½���:�ܷ�Ű �������� ����. �θ�Ű ����
        
--�θ����̺� ���ڵ� �Է�
insert into pr_dept_const values (10, '���ǹ�', '����');
insert into pr_dept_const values (20, '�����ǹ�', '������');

--�տ��� �Է½����� ���ڵ� �Է�
insert into pr_emp_const values 
    (100, '�ƹ���', '����', null, sysdate, 1000, 0.3, 10);
insert into pr_emp_const values 
    (101, '����', '��', null, sysdate, 800, 0.45, 20);
select * from pr_emp_const;

/*
5. �� 3�������� �� ���̺��� �ܷ�Ű�� �����Ǿ pr_dept_const ���̺��� 
���ڵ带 ������ �� ������. �� ��� �θ� ���ڵ带 ������ ��� 
�ڽı��� ���� �����ɼ� �ֵ��� �ܷ�Ű�� �����Ͻÿ�.
*/
alter table pr_dept_const add on delete cascade;

--�ڽ� �ܷ�Ű ����
alter table pr_emp_const drop constraint pr_emp_dept_fk;

alter table pr_emp_const 
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_dept_const (deptno)
    on delete cascade;
    
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;    

commit;

--�θ����̺�
select * from pr_dept_const;
--�ڽ����̺�
select * from pr_emp_const;
--�θ����̺��� ���ڵ� �����ϱ�
delete from pr_dept_const where deptno=10;/*
                    �ڽķ��ڵ尡 �����Ƿ� �����Ұ���
                    �ܷ�Ű �������� ����.
                
--�ܷ�Ű �缳���� ���� ������ �ܷ�Ű�� �����Ѵ�.
alter table pr_emp_const drop constraint pr_emp_dept_fk;

--�ܷ�Ű �缳�� : �θ��ڵ� ������ �ڽķ��ڵ���� ���ÿ� �����ǵ��� ����
alter table pr_emp_const
    add constraint pr_emp_dept_fk
    foreign key (deptno)
    references pr_dept_const (deptno)
    on delete cascade;
--�ڽķ��ڵ尡 �ִ� ���¿��� �θ��ڵ� �����ϱ�
delete from pr_dept_const where deptno=10;
select * from pr_dept_const;
select * from pr_emp_const;--���������� ������.

commit;
*/



















