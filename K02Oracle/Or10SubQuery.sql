/******************
���ϸ� : Or10SubQuery.sql
��������
���� : �������ȿ� �� �ٸ� �������� ���� ������ select��
*******************/

/*
������ ��������
    ����]
        select * from ���̺�� where �÷�=(
            select �÷� from ���̺�� where ����
        );
    �� ��ȣ���� ���������� �ݵ�� �ϳ��� ����� �����ؾ� �Ѵ�. 
*/
/*
�ó�����] ������̺��� ��ü����� ��ձ޿����� ���� �޿��� �޴� ������� 
�����Ͽ� ����Ͻÿ�.
    ����׸� : �����ȣ, �̸�, �̸���, ����ó, �޿�
*/
select employee_id, first_name, email, salary
from employees
where salary < round(avg(salary));/*
     �ش� �������� ���ƻ� �´µ��ϳ� �׷��Լ��� �����࿡
     ������ �߸��� ���������� ������ �߻��Ѵ�. 
*/
--1�ܰ� : ��ձ޿��� �������� ���Ѵ�. 
select round(avg(salary)) from employees;
--2�ܰ� : 6462���� ���� �޿��� �޴� ������ �����Ѵ�. 
select * from employees where salary<6462;
--3�ܰ� : 2���� ������ �ϳ��� �������������� ��ģ��. 
select * from employees where 
    salary<(select round(avg(salary)) from employees);

/*
�ó�����] ��ü ����� �޿��� �������� ����� �̸��� �޿��� ����ϴ� 
������������ �ۼ��Ͻÿ�.
����׸� : �̸�1, �̸�2, �̸���, �޿�
*/
select * from employees where salary<min(salary);--�����߻���.

--1�ܰ� : �ּұ޿��� ã�´�.
select min(salary) from employees;
--2�ܰ� : 2100�޷��� �޿��� �޴� ����� �����Ѵ�. 
select * from employees where salary=2100;
--3�ܰ� : ������ ����
select * from employees where 
    salary=(select min(salary) from employees);

/*
�ó�����] ��ձ޿����� ���� �޿��� �޴� ������� ����� ��ȸ�Ҽ� �ִ� 
������������ �ۼ��Ͻÿ�.
��³��� : �̸�1, �̸�2, ��������, �޿�
�� ���������� jobs ���̺� �����Ƿ� join�ؾ� �Ѵ�. 
*/
--1�ܰ� : ��ձ޿� ���ϱ�
select trunc(avg(salary),2) from employees;
--2�ܰ� : 6461.83���� �޿��� ���� ����� ����
select * from employees where salary>=6461.83;
--3�ܰ� : jobs ���̺�� ������ �Ǵ�.
select
    first_name, last_name, job_title
from employees inner join jobs using(job_id)
where salary>=6461.83;
--4�ܰ� : ���������� ����
select
    first_name, last_name, job_title
from employees inner join jobs using(job_id)
where salary>=(select trunc(avg(salary),2) from employees);


/*
������ ��������
    ����]
        select * from ���̺�� where �÷� in (
            select �÷� from ���̺�� where ����
        );
    �� ��ȣ���� ���������� 2�� �̻��� ����� �����ؾ� �Ѵ�.
*/
/*
�ó�����] ���������� ���� ���� �޿��� �޴� ����� ����� ��ȸ�Ͻÿ�.
    ��¸�� : ������̵�, �̸�, ���������̵�, �޿� 
*/
--1.������̺��� �ܼ� ������ ���� ������ ��׿����� Ȯ��
select job_id, salary from employees
order by job_id, salary desc;
--2.1������ Ȯ���� ���ڵ带 group by���� �׷�ȭ�Ͽ� �� ������
--  �ִ�޿��� Ȯ���Ѵ�. 
select 
    job_id, max(salary)
from employees
group by job_id;
--3.2���� ����� ������� �ܼ� ������ �ۼ�
select
    employee_id, first_name, job_id, salary
from employees
where 
    (job_id='IT_PROG' and salary=9000) or
    (job_id='AC_MGR' and salary=12008) or
    (job_id='AC_ACCOUNT' and salary=8300) or
    (job_id='ST_MAN' and salary=8200) or
    (job_id='PU_MAN' and salary=11000);/*
        2������ ����� 19���� ����� �ܼ������� �ۼ��ϸ� 
        ���Ͱ��� or�����ڸ� ���� �����Ҽ� �ִ�. ������
        ����� ���ٸ� �ۼ��� �Ұ����Ұ��̴�. 
    */
--4. 3�� �������� ���������� �����Ѵ�. �������̹Ƿ� in�� ����Ѵ�. 
select
    employee_id, first_name, job_id, salary
from employees
where 
    (job_id, salary) in (
        select 
            job_id, max(salary)
        from employees
        group by job_id
    );
/*
�����࿬����2 : any
    ���������� �������� ���������� �˻������ �ϳ��̻�
    ��ġ�ϸ� ���� �Ǵ� ������. �� ���� �ϳ��� �����ϸ�
    �ش� ���ڵ带 �����´�. 
*/
/*
�ó�����] ��ü����߿��� �μ���ȣ�� 20�� ������� �޿����� ���� �޿��� �޴� �������� 
�����ϴ� ������������ �ۼ��Ͻÿ�. 
*/
--1.20���μ��� �޿��� Ȯ��
select * from employees where department_id=20;
--2.1�� ����� �ܼ� ������ ������...
select * from employees where salary>=13000 or salary>=6000;
--3.2�� ����� ���������� �ۼ��Ѵ�. �̶� any�� ����Ѵ�. 
select first_name, last_name, department_id, salary 
    from employees where 
    salary>=any(select salary from employees where department_id=20);/*
        ������ ������ any�� ����ϸ� 2�������� or�������� �������
        �����ϰԵȴ�. 6000 �Ǵ� 13000 �̻��� ���ڵ常 ����ȴ�. 
    */


/*
�����࿬����3 : all
    : ���������� �������� ���������� �˻������ ��� ��ġ�ؾ�
    ���̵ȴ�. 
*/
select first_name, last_name, department_id, salary 
    from employees where 
    salary>=all(select salary from employees where department_id=20);/*
        6000���ٵ� ũ��, 13000���ٵ� Ŀ���ϹǷ� ��������� 13000 �̻���
        ���ڵ常 �����ϰԵȴ�. 
    */


/*
Top���� : ��ȸ�� ������� ������ ���� ���ڵ带 �����ö� ����Ѵ�. 
    �ַ� �Խ����� ����¡�� ���ȴ�. 
    
    rownum : ���̺��� ���ڵ带 ��ȸ�� ������� ������ �ο��Ǵ�
        ������ �÷��� ���Ѵ�. �ش� �÷��� ��� ���̺� �����Ѵ�. 
*/
select * from employees;
select employee_id, first_name, rownum from employees;
select employee_id, first_name, rownum from employees order by first_name;
select employee_id, first_name, rownum from (
    select * from employees order by first_name
);


/*
������̺��� ������ ������ ���� �������� ���� ����������
*/
select * from
    (select Tb.*, rownum rNum from (
        select * from employees order by employee_id desc
    ) Tb)
--where rNum between 1 and 10;    
where rNum between 11 and 20;    
/*
    between�� ������ ���Ͱ��� �������ָ� �ش� �������� ���ڵ常
    �������Եȴ�. ���� ������ ���� JSP���� �������� ������ �����Ͽ�
    ����ؼ� �����ϰԵȴ�. 
    
    3.2���� ��� ��ü�� �����ͼ�...
        (2.1���� ����� rownum�� ���������� �ο��� (
             1.������̺��� ��� ���ڵ带 �������� �����ؼ� ����
        ) Tb)
    �ʿ��� �κ��� rownum���� ������ ���� �����Ѵ�.
*/

/*
01.�����ȣ�� 7782�� ����� ��� ������ 
���� ����� ǥ��(����̸��� ��� ����)�Ͻÿ�.
*/
/*
select
    ename, job
from pr_employees
where empno = 7782;

select
    ename, job
from pr_employees
where job = 'MANAGER';
*/
select
    ename, job
from emp
where job = (select job from emp where empno = 7782);

select job from emp where empno = 7782;

/*
02.�����ȣ�� 7499�� ������� �޿�/�� 
���� ����� ǥ��(����̸��� ��� ����)�Ͻÿ�.
*/
/*
select
    empno, ename, sal
from pr_employees;--7499	ALLEN	1600

select
    sal
from pr_employees
where empno=7499;
*/

select
    ename, job
from emp
where sal>(select sal from emp where empno=7499);

select sal from emp where empno=7499;

/*
03.�ּ� �޿��� �޴� ����� �̸�, / 
��� ���� �� �޿��� ǥ���Ͻÿ�(�׷��Լ� ���).
*/
/*
select
    ename, job, sal
from pr_employees
where sal = 1300;
*/

select
    ename, job, sal
from emp
where sal=(select min(sal) from emp);

select min(sal) from emp;


/*
04.��� �޿��� ���� ���� ����(job)/�� ��� �޿��� ǥ���Ͻÿ�.
*/
select
    job, avg(sal)
from emp
having avg(sal)=(select min(avg(sal)) from emp group by job)
group by job;

select min(avg(sal)) from emp group by job;

/*
05.���μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
*/
select
    ename, sal, deptno
from emp
where sal in (select min(sal) from emp group by job);

select min(sal) from emp group by job;


/*
06.��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 /
������ �м���(ANALYST)�� �ƴ� �����/�� ǥ��(�����ȣ, �̸�, ������, �޿�)�Ͻÿ�.
*/
select
    empno, ename, job, sal
from emp
where job != 'ANALYST' and sal<(select sal from emp where job = 'ANALYST')
order by sal asc;

/*
select
    empno, ename, job, sal
from emp
where sal<(select sal from emp where job = 'ANALYST');

select
    sal
from emp
where job = 'ANALYST';
*/


/*
07.���������� ���� ����� �̸��� ǥ���Ͻÿ�.
*/
/*
select
    mgr
from emp
where mgr is not null;
*/

select
    ename
from emp
where empno not in (select mgr from emp where mgr is not null);

select mgr from emp where mgr is not null;

/*
08.���������� �ִ� ����� �̸��� ǥ���Ͻÿ�
*/
select
    ename
from emp
where empno in (select mgr from emp where mgr is not null);

select * from emp;
--nvl
/*
09.BLAKE�� ������ �μ��� ���� ����� �̸��� 
�Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�(��. BLAKE�� ����).
*/
select * from emp where ename='BLAKE';
select job from emp where ename='BLAKE';

select
    ename, hiredate
from emp
where deptno=(select deptno from emp where ename='BLAKE') and ename!='BLAKE';

/*
10.�޿��� ��� �޿� ���� ���� �����/�� �����ȣ�� �̸��� 
ǥ���ϵ� ����� �޿��� ���ؼ� ������������ ���� �Ͻÿ�.
*/
select
    avg(sal)
from emp;

select
    empno, ename
from emp
where sal>(select avg(sal) from emp)
order by sal asc;

/*
11.�̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� 
����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
*/
select deptno from emp where ename like '%K%';
select
    empno, ename, deptno
from emp
where deptno in (select deptno from emp where ename like '%K%');

/*
12.�μ� ��ġ�� DALLAS��/ ����� �̸��� �μ���ȣ �� ��� ����/�� ǥ���Ͻÿ�.
*/
select
    ename, deptno, job
from emp inner join dept using(deptno)
where loc='DALLAS';

select ename,deptno,job 
from emp 
where deptno=(select DISTINCT(deptno) from emp 
    inner join dept using(deptno) where loc='DALLAS');

/*
13.KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.
*/

select 
    empno
from emp
where ename='KING';

select
    ename, sal
from emp
where mgr=(select empno from emp where ename='KING');


/*
14.RESEARCH �μ��� ����� ���� �μ���ȣ ����̸� �� ��� ������ ǥ���Ͻÿ�.
*/

select 
    deptno, ename, job 
from emp inner join dept using(deptno) 
where dname='RESEARCH';

/*
15.��� �޿� ���� ���� �޿��� �ް� �̸��� k�� ���Ե� ����� 
���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ǥ���Ͻÿ�.
*/
select
    avg(sal)
from emp;
    
select deptno from emp where ename like '%K%';

select
    empno,ename, sal
from emp
where sal>(select avg(sal) from emp) 
    and deptno in (select deptno from emp where ename like '%K%');

/*
16.��� �޿��� ���� ���� ������ ã���ÿ�.
*/
select
    min(avg(sal))
from emp
group by job;

select
    job
from emp
having avg(sal)=(select min(avg(sal)) from emp group by job)
group by job;

/*
17.��� ������ MANAGER�� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.
*/
select
    deptno
from emp
where job='MANAGER';

select
    ename
from emp
where deptno in (select deptno from emp where job='MANAGER');


declare
i number :=1;

begin
    dbms_output,put_line('�λ��� ����?');
    while(i<10)
    loop
    dbms_output,put_line('������');
    end loop;
end;
--------------------------------------------------------

select
    ename
from emp
where 