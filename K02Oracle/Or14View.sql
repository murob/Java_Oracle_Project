/**********************
파일명 : Or14View.sql
View(뷰)
설명 : View는 테이블로부터 생성된 가상의 테이블로 물리적으로는 존재하지 않고
    논리적으로 존재하는 테이블이다.
**********************/

--hr계정에서 실습합니다.

/*
뷰의 생성
형식]
    create [or replace] view 뷰이름[(컬럼1, 컬럼2....)]
    as
    select * from 테이블명 where 조건
        혹은 join문도 가능함
*/

/*
시나리오] hr계정의 사원테이블에서 담당업무가 ST_CLERK인 사원의 정보를
        조회할 수 있는 View를 생성하시오.
        출력항목 : 사원아이디, 이름, 직무아이디, 입사일, 부서아이디
*/
--1단계 : 조건대로 select 하기
select employee_id, first_name, last_name, job_id, hire_date, department_id
from employees where job_id='ST_CLERK';--20개인출

--2단계 : select문을 기반으로 View생성하기
create view view_employees
as
    select employee_id, first_name, last_name, job_id, hire_date, department_id
    from employees where job_id='ST_CLERK';

--3단계 : View 호출하기
select * from view_employees;
--데이터사전에서 생성된 View 확인하기
select * from user_views;


/*
뷰 수정하기
    : 뷰 생성문자에 or replace만 추가한다.
    해당 뷰가 존재하면 수정되고, 만약 존재하지 않으면 새롭게 생성된다.
    따라서, 처음 뷰를 생성할 때 부터 or replace를 사용해도 무방하다.
*/
create or replace view view_employees (e_id, f_name, l_name, j_id, h_date, dept_id)
as
    select employee_id, first_name, last_name, job_id, hire_date, department_id
    from employees where job_id='ST_CLERK';
select * from view_employees;
/*
    뷰 생성시 컬럼명을 지정하면 마치 별칭을 준 것과 같이
    기존 테이블의 컬러명을 변경할 수 있다.
*/






concat(문자열1, 문자열2)
    : 문자열 1과 2를 서로 연결해서 출력하는 함수
    사용법1 : concat('문자열1', '문자열2')
    사용법2 : '문자열1' || '문자열2'
*/
select concat('Good', 'morning') AS "아침인사" from dual;
select 'Oracle' || ' 11g' || ' Good' from dual;
-- => 위의 SQL문을 concat()으로 변경하면...
    select concat(concat('Oracle', ' 11g'), ' Good') from dual;

/*
퀴즈] 위에서 생성한 view_employees 뷰를 아래 조건에 맞게 수정하시오
        직무아이디가 ST_MAN인 사원의 사원번호, 이름, 이메일, 매니져아이디를
        조회할 수 있도록 수정하시오.
        뷰의 컬럼명은 e_id, name, email, m_id로 지정한다. 단, 이름은 first_name과
        last_name이 연결된 형태로 출력하시오
*/
--step1
select employee_id, concat(first_name||' ', last_name), email, manager_id
from employees where job_id='ST_MAN';
--step2
create or replace view view_employees (e_id, name, email, m_id)
as
    select employee_id, concat(first_name||' ', last_name), email, manager_id
    from employees where job_id='ST_MAN';
--step3
select * from view_employees;




/*
퀴즈] 사원번호, 이름, 연봉을 계산하여 출력하는 뷰를 생성하시오.
컬럼의 이름은 emp_id, l_name, annual_sal로 지정하시오.
연봉계산식 -> (급여+(급여*보너스율))*12
뷰이름 : v_emp_salary
단, 연봉은 세자리마다 컴마가 삽입되어야 한다. 
*/
create or replace view view_employees (emp_id, l_name, annual_sal)
as
    select employee_id, last_name, trim(to_char((salary+(salary*nvl(commission_pct,0)))*12, '999,000'))
    from employees;
select * from view_employees;/*
        보너스율이 null인경우 연봉이 계산되지 않으므로 nvl() 함수를
        이용해서 0으로 값을 변환한 후 계산한다. 또한, to_char()로
        세자리마다 컴마를 삽입하고, trim()으로 양쪽의 공백을 제거한다.
    */
    
/*
-조인을 통한 View 생성
퀴즈] 사원테이블과 부서테이블, 지역테이블을 조인하여 다음 조건에 맞는 뷰를 생성하시오.
출력항목 : 사원번호, 전체이름, 부서번호, 부서명, 입사일자, 지역명
뷰의명칭 : v_emp_join
뷰의컬럼 : empid, fullname, deptid, deptname, hdate, locname
컬럼의 출력형태 : 
	fullname => first_name+last_name 
	locname => XXX주의 YYY (ex : Texas주의 Southlake)
	hdate => 0000년00월00일
*/
create or replace view v_emp_join (empid, fullname, deptid, deptname, hdate, locname)
as
select
    employee_id, concat(first_name||' ', last_name), department_id, department_name, 
    to_char(hire_date, 'yyyy"년"mm"월"dd"일"'), 
    state_province||'주 의'||city
from employees
    inner join departments using(department_id)
    inner join locations using(location_id);
select * from v_emp_join;





