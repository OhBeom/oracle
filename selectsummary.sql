select *
from emp;

--문자를 조건절에 사용할때 
--대소문자, ' ' 홀따음표는 지켜야 된다


select *
from emp
where ename = 'FORD'; --소문자 ford는 없다.


--날짜를 조건절에 사용할때
--''
--날짜도 크기가 있다
--80/12/20(검색했을떄 보여주는 정보) -> 1980 12 20 시간 분 초 요일(포함되어있는 정보)
select *
from emp
where hiredate <'1982/01/01';

--or 두개이상의 조건중에 하나이상 참인경우
select *
from emp
where deptno = 10 or sal >= 2000;

--not 논리부정 연산자
select *
from emp
where sal != 3000;

-- != 와 not 결과값은 같다
select*
from emp
where not sal = 3000;

--and, or
--범위 조건을 표현 할때 사용
select *
from emp
where sal >= 1000 and sal <= 3000;

select *
from emp
where sal <= 1000 or sal >= 3000;

--between and
select *
from emp
where sal between 1000 and 3000;

--in
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

--like 연산자
--값의 일부만 가지고 데이터를 조회한다.
--와이드 카드를 사용한다( % , _ )
--%는 모든 문자를 대체한다
--_는 한문자를 대체한다
select *
from emp
where ename like 'F%';

select *
from emp
where ename like 'F___'; --언더바 3개 들어감

select *
from emp
where ename like '%D';

select *
from emp
where ename like '%O%';

select *
from emp
where ename like'___D';

select *
from emp
where ename like 'S___%';

--null 연산
--is null / is not null
select *
from emp
where comm is null;

select *
from emp
where comm is not null;

===========================

--집합연산자
--두개의 select 구문을 사용한다
--컬럼의 갯수가 동일해야한다.
--컬럼의 타입이 동일해야한다.
--컬럼의 이름은 상관 없다.
--합집합, 교집합, 차집합

select empno, ename, sal, deptno
from emp
where deptno = 10
union --합집합 
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
where deptno = 10
union all --합집합 
select empno, ename, sal, deptno
from emp
where deptno = 10;


select empno, ename, sal, deptno
from emp
MINUS --차집합
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
intersect -- 교집합
select empno, ename, sal, deptno
from emp
where deptno = 10;



--이름이 s로 끝나는 사원 데이터 출력하기
select *
from emp
where ename like '%S';

--30번 부서에서 근무하고있는 사원중에 직챙이 샐러리맨인사람만 출력하기
select *
from emp
where deptno = 30 and job = 'SALESMAN';

--20번30번 부서에서 근무하는 사람중 급여가 2000초과인 사원을
--다음 다음 두가지 방시의 SELECT문을 사용하여 사원 번호 이름 급여 부서번호를 출력하기
--1 집합 연산자를 사용하지 않은 방식
--2 집한 연산자를 사용한 방식
--1
select empno, ename, sal, deptno
from emp
where deptno in(20,30) and sal > 2000;
--2
select empno, ename, sal, deptno
from emp
where deptno = 20 and sal>2000
UNION
select empno, ename, sal, deptno
from emp
where deptno = 30 and sal>2000

-------------------------------------
select *
from emp
where sal <2000 or sal >3000;
-------------------------------------
select empno, ename, sal, deptno
from emp
where deptno = 30 
and ename like '%E%' 
and sal not between 1000 and 2000; 
-------------------------------------
select *
from emp
where comm is null
and job in('MANAGER','CLERK')
and mgr is not null
and ename not like '_L%';


--함수
--문자함수 upper,lower,substr,instr,replace,lpad,rpad,concat
--숫자함수
--날짜함수

--upper는 가로안에 문자를 대문자로 변환하여 반환
select 'Welcome',upper('welcome')
from dual;

--lower은 가로안에 문자를 소문자로 변환하여 반환
select lower(ename),upper(ename)
from emp;

--initcap은 첫글자는 대문자 나머지는 소문자로 변환하여 반환
select initcap(ename)
from emp;

select *
from emp 
where ename = 'FORD';

select *
from emp
where lower(ename) = 'scott';

--이름이 몇자인지 나옴 
select ename,length(ename)
from emp;

--숫자로 글자 불러오기 ex 1,13(1~13자리에 있는 글자 변환), ,15(15번째있는 글자만 변환)
-- 마이너스를 붙이면 뒤에서 부터 오게됨
--      1234567891011121314151617(공백도 숫자쓰임)
select 'welcome to Oracle',substr('welcome to Oracle',-3),substr('welcome to Oracle',17)
from dual;

select 'welcome to Oracle',substr('welcome to Oracle',2,3),substr('welcome to Oracle',17)
from dual;                                       --2는 시작위치 3은 2뒤에 몇개출력할 개수

-- o위치를 숫자로 표시
select instr('welcome to Oracle','o')
from dual;

--제일 가까운 o는 5재지만 뒤에 6을 써서 5보다 뒤에있는 o를 찾음
select instr('welcome to Oracle','o',6)
from dual;

select instr('welcome to Oracle','e',3,2)--두번째 입력값은 시작위치, 3번째 입력값은 위치값
from dual;

select 'welcome to Oracle',replace('welcome to Oracle','to','of')--to를 of로 변경
from dual;

select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual

select concat(empno,ename),empno || '' || ename --두 문자열을 합치는 함수
from emp;

====숫자====

select  --round는 반올림
        round(1234.5678),
        round(1234.5678,0),
        round(1234.5678,1),
        round(1234.5678,2),
        round(1234.5678,-1),
        round(1234.5678,-2)
from dual;

select  --trunc는 소수점 뒤자리 버려라~
        trunc(1234.5678),
        trunc(1234.5678,0),
        trunc(1234.5678,1),
        trunc(1234.5678,2),
        trunc(1234.5678,-1),
        trunc(1234.5678,-2)
from dual;

select
        ceil(3.14), --자신보다 큰 가장 가까운 정수 4
        floor(3.14), --자신보다 작은 가장 가까운 정수 3
        ceil(-3.14), -- -3
        floor(-3.14) -- -4
from dual;

select mod(5,2),mod(10,4) --mod(나눗셈될 숫자 , 나눌숫자) 값은 나머지로 출력
from dual;

select * --사원번로를 2로 나눠서 나머지가 1로나오는것들은 홀수이므로 이렇식으로도 정리 가능
from emp
where mod(empno,2) = 1;

-------------------------------------------------------날짜함수

select sysdate -1 어제, sysdate, sysdate + 1 내일
from dual;

select sysdate - hiredate as 근무일수    -- 차이가 일수 반환
from emp;

-----------근속년수 

select trunc((sysdate - hiredate) / 365) 근속년수
from emp;

-----------------
sysdate, round, trunc

--자료형변환 함수
--to_char()
--to_number()
--to_date()

--날짜를 문자로바꿔줌
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')as 현재시간
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY')as 입사일자
from emp;

--숫자를 문자로
select to_char(123456,'999,999')
from dual;

select sal, to_char(sal,'L999,999')
from emp;

--문자를 숫자로
select '20000' - 10000 --자동형변환
from dual;

select '20000' - '5000' -- to_number() 형변환을 해야한다
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--문자를 날짜
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

--null데이터 처리
--nvl(null,바꾸고싶은 데이터)
--nvl은 null 데이터의 타입과 같은 타입을 변경해야한다.
--nvl(숫자,숫자), nvl(문자,문자)
select ename 사원명,sal,sal *12 + nvl(comm,0) as 연봉,comm
from emp;

select*
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr
from emp
where mgr is null;

select comm, nvl2(comm,'O','X')
from emp;

-- 조건문 표현하는 함수
-- decode() -> switch
-- case     -> if

select ename,job,deptno,
        decode(deptno,10,'AAA',20,'BBB',30,'CCCC','기타') as 부서명
from emp;

--범위를 조건식으로 설정 할 수 있다.
case
     when 조건식 then 실행문
     when 조건식 then 실행문
     when 조건식 then 실행문
     else 실행문 
end as 별칭

select ename,job,deptno,
  case
     when deptno = 10 then 'AAA'
     when deptno = 20 then 'BBB'
     when deptno = 30 then 'CCC'
     else '기타'
     end as 부서명
from emp;


select ename,job,sal,
   case
        when sal between 3000 and 5000 then '임원'
        when sal >= 2000 and sal < 3000 then '관리자'
        when sal >= 500 and sal < 2000 then '사원'
        else'기타'
    end as 직무
from emp;

============================================
--책 페이지 174

select empno,rpad(substr(empno,1,2),4,'*')
         ename,rpad(substr(ename,1,1),5,'*') 
from emp
where length(ename)>=5
and length(ename)<6;

===============================================
--정답지에있는 정답
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
 FROM  EMP
 WHERE LENGTH(ENAME) >= 5
   AND LENGTH(ENAME) < 6; 
======================================================
select empno,ename,sal,
  trunc(sal /21.5,2)as day_pay,
  round(sal /21.5 /8,1)as time_pay
from emp;
======================================================
select empno,ename,mgr,
        case
              when substr(mgr,1,2) = '75'then '5555'
              when substr(mgr,1,2) = '76'then '6666'
              when substr(mgr,1,2) = '77'then '7777'
              when substr(mgr,1,2) = '78'then '8888'
              when mgr is null then '0000'
              else to_char(mgr)
     end as CHG_MGR
from emp;
==================================================

--sum은 모든 데이터를 합한다
select sum(sal)
from emp;


select avg(sal)
from emp;


select count(*),count(comm)
from emp;


select max(sal),min(sal)
from emp;


select max(sal)
from emp;
             -- select 컬럼 , 컬럼 에서 조회되는 컬럼의 숫자가 둘이 같아야 쓸수있다 

select ename,
from emp;


select min(hiredate)  --가장 빨리 입사한사람 년도, 가장 늦게 입사한 사람은 max쓰면됨
from emp
where deptno = 20;


-- sum(),avg(),count(),max(),min()
-- 일반컬럼과 같이 사용 불가
-- 크기비교가 가능 모두 타입에 사용가능

-- select 컬럴명
-- from 테이블명
-- where 조건식(그룹함수 사용불가 / grop by ,having 보다 먼저실행)
-- group by 기준컬럼명
-- having 조건식(그룹함수 사용한다)
-- order by 컬럼명 정렬방식 ==> 무조건 맨 마지막에 작성 순서 절대 못바꿈

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000; --group by의해서 조회 결과에 조건을 준다 
                         --조건식을 작성할때 그룹함수를 사용한다
                         
select deptno,avg(sal)
from emp
where deptno != 10
group by deptno
having avg(sal)>=2000;

select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;
-- 위 아래 둘다 같은 결과 나오지만 UNION과 group by의 차이  
select avg(sal)
from emp
group by deptno;

select deptno
from emp
group by deptno;

--deptno와 avg의 값이 3개가 둘이 똑같음으로 두개를 동시에 쓸수있다 
select deptno, avg(sal)
from emp
group by deptno
order by deptno;

select deptno,job, avg(sal)
from emp
group by deptno,job
order by deptno,job desc;
----------------------------------------10/20--------------
--조인(join)
--2개 이상의 
--from 절에 두개 이상의 테이블을 작성한다
--where에 조인 조건을 작성한다
--cross join(where 절 없이 조인)
--equi join(where 등가연산자 : =)
--non equi join(where 범위연산자 : and, or)
--self join (where 하나의 테이블을 사용한다)
--out join (where에 누락되는 데이터를 같이 조회하기 위해(+)를 쓴다)

select ename,job,e.deptno,dname,loc
from emp e,dept d= --테이블 별칭 부여
where 

select ename,job,e.deptno,dname,loc
from emp e,dept d --테이블에 별칭 부여
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where emp.sal >= s.losal and emp.sal <= s.hisal;

--사번, 이름,  급여, 부서번호, 부서명, 급여등급
--emp                dept          salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e,emp m  --셀프조인은 반드시 별칭을 부여한다
where e.mgr = m.empno;

select ename,deptno
from emp
where deptno = 20;

--scott 같은 부서에 근무하는 사원
ename  ename
scott  simth
scott  jones
scott  adams
scott  ford

select work.ename, friend.ename
from emp work,emp friend
where work.deptno = friend.deptno 
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT'



--외부조인(아우터조인)
--등가시 누락되는 데이터를 같이 조회하기 위해서 사용한다 

select e.empno, e.ename, e.mgr, m.ename
from emp e,emp m  --셀프조인은 반드시 별칭을 부여한다
where e.mgr = m.empno(+); -- 데이터가 없는 테이블 쪽에 (+)를 붙인다

select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;


--ANSI JOIN(표준조인 방식)
--cross join
--natural join
--inner join(equi, non equi, self)
--outer join( (+) ) //[left, right, full] outer join


--ANSI-JOIN(표준조인 방식)
select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) -- 양쪽 테이블의 컬럼명이 동일한경우 
where ename = 'SCOTT';

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --데이터가 있는 쪽을 지정한다.
on e.mgr = m.empno;

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal betweeen s.losal and s.hisal;

select ename, sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;

select d.deptno,d.dname,e.empno,e.ename,e.sal
from emp e inner join dept d
on e.deptno = d.deptno
where e.sal > 2000;

select d.deptno,
       d.dname,
       trunc(avg(sal)),
       max(sal),
       min(sal),
       count(*)
from emp e inner join dept d
using
group by deptno;


----------------서브쿼리---------------------------------------------------
--서브쿼리 = select문의 중첩
--select (select) 일반 서브쿼리
--from (select) 인라인뷰
--where (select) 서브쿼리
--단일행 서브쿼리 
--다중행 서브쿼리 
select ename,max(sal) --ename과 sal 행의 갯수가 서로 달라서 쓸수 없다
from emp;


select ename,sal      --where에는 그룹 함수 못씀
from emp
where sal = (
            select max(sal) 
            from emp
            );


select deptno
from emp
where ename = 'SCOTT';


select dname
from dept
where deptno = 20;

--메인쿼리
select dname 
from dept
where deptno = ( --서브 쿼리
                  select deptno
                  from emp
                  where ename = 'SCOTT'
                );

--DALLAS
--이름, 부서번호

select ename, deptno
from emp
where deptno = (
                  select deptno
                  from dept
                  where loc = 'DALLAS'
                );

--자신의 직속상관이 KING인 사원의 이름과 급여를 조회하세요(서브쿼리)

select ename, sal
from emp
where mgr = ( 
            select empno
            from emp
            where ename = 'KING'
            );
--------------------다중행 서브쿼리-------------------------------------
-- in : 결과중에 하나만 만족하면 된다.
-- > any : 결과중에 가장 작은값보다 크면된다.
-- > all : 결과중에 가장 큰값보다 크면된다.


select *
from emp
where sal in (5000,3000,2850);
--위의 것을 아래 다중행 서브쿼리로 쓸수있다
select *
from emp
where sal in (
              select max(sal)
              from emp
              group by deptno
              );
        
        
select*
from emp
where sal < any(
                 select max(sal) --작은값보다 크면 >
                 from emp        --큰값보다 작으면 <
                 group by deptno
                 );
                 

select ename,sal
from emp
where sal > all( 
                 select sal
                 from emp
                 where deptno = 30
                );

----------------다중열 서브쿼리-------------------------------
select *
from emp
where (deptno,sal) in (
                          select deptno,max(sal)
                          from emp
                          group by deptno
                       );
                       
 -----------10/21-------------------------------------------------                      
------------------DML 데이터조작어---------------------------
--DML(데이터 조작어) : insert, update, delete
--insert : 테이블에 데이터 삽입
--insert into 테이블명(컬럼명1 컬럼명2.......)
--values(값1,값2....)
--컬럼과 값의 탑입과 갯수가 일치해야한다.
--작성 순서대로 1:1 매칭된다.


create table dept_temp  --테이블 생성
as
select * from dept;

select *
from dept_temp;
                       

insert into dept_temp(deptno,dname,loc)  --여기 가로안에있는 컬럼갯수와 아래 values 가로에있는 컬럼갯수가 같아야함
values(50,'DATABASE','SEOUL');

insert into dept_temp(deptno,dname) --묵시적 null데이터삽입
values(60,'JSP');

insert into dept_temp --컬럼생략
values(70,'HTML','SEOUL');

insert into dept_temp --컬럼생략 , 명시적 null 데이터 삽입
values(80,'NULL','SEOUL');



create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3111,'심청이','MANAGER',9999,SYSDATE,4000,null,30);

-----------테이블에 있는 데이터 수정하기------------
-- update : 컬럼의 데이터를 변경(수정)
-- update 테이블명
-- set 컬럼명 = 값, 컬럼명 = 값, ....
-- where 조건식
-- 조건절의 사용하지 않으면 해당 컬럼이 모두 변경된다.


create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2 --모든부서의 주소를 서울로 바꿈 (loc-주소)
set loc = 'SEOUL';

update dept_temp2 --40번 부서명과 근무지 서울로 변경
set dname = 'DATABASE',loc = 'SEOUL'
where deptno = 40;



---------테이블 삭제 방법-------------------------
--delete(데이터 삭제)
--delete from 테이블명
--where 조건식
--조건절을 사용하지 않으면 모든 데이터가 삭제된다.

drop table emp_temp2;


create table emp_temp2
as
select * from emp;

select * 
from emp_temp2;


delete from emp_temp2;

delete from emp_temp2;
where ename = 'SCOTT';

------------트랜잭션---------------------------
--TCL(데이터의 영구저장 또는 취소)
--트랜잭션
--commit, rollback, savepoint
--commit : 1,데이터 영구 저장(테이블이 데이터 반영)
--         2,create구문을 사용해서 객체 생성할때(자동)
--rollback : 1, 데이터 변경 취소(테이블이 데이터 미 반영) 원상복구
--           2, 천재지변, 전기, 전쟁(자동)

create table dept01    --테이블 생성
as
select * from dept;

select *               --테이블 조회
from dept01;

drop table dept01;     --테이블 삭제
delete from dept01;    --테이블 행삭제
truncate table dept01; --커밋 후 롤백이 불가능한 삭제

-- 삭제했지만 cmd들어가서 조회했을땐 보임
-- sqlplus scott/tiger 입력 -> select * from dept01; 입력 확인함

commit;

-- 커밋후 cmd 확인하니깐 완전히 삭제됨

rollback;

--DDL(데이터 정의어) : table(모든 객체)을 생성, 삭제, 변경하는 명령어
--create(생성), alter(변경), drop(삭제)

create table  테이블명(      -- table(객체)
            컬럼명1 타입,    -- column(속성)
            컬럼명2 타입,    -- 
            컬럼명3 타입,
);

create table emp_ddl(
        --사번, 이름, 직책, 관리자, 입사일, 급여, 성과금, 부서번호
        empno number(4),
        ename varchar2(10), --byte
        job varchar2(9),
        mgr number(4),
        hiredate date,
        sal number(7,2),
        comm number(7,2),
        deptno number(2)
);

select *
from emp_DDL;

insert into emp_ddl
values(9999,'이순신','MANAGER',1111,sysdate,1000,null,10);

 create table emp_alter
 as
 select * from emp;
 
 select *from emp_alter;

create table dept_ddl --테이블의 복사
as
select * from dept;

create table dept_30
as
select * from dept
where deptno = 30;

create table dept_m
as
select * dname,loc
where dept;

create table dept_m
as
select * dname,loc
where dept;

--테이블의 변경
alter table emp_alter --열추가
add address varchar2(100);

alter table emp_alter --열이름 변경
rename column address to addr;

alter table emp_alter  --열 자료형 변경
modify empno number(10);

alter table emp_alter --특정 열 삭제
drop column addr;

--테이블 삭제 drop

-- drop table 테이블
select * from emp_alter;

drop table emp_alter;

----------책 페이지 324 문제-----------------------
create table emp_hw(
                 empno number(4),
                 ename varchar2(10),
                 job varchar2(9),
                 mgr number(4),
                 hiredate date,
                 sal number(7,2),
                 comm number(7,2),
                 deptno number(2)
);

--테이블 조회------
select* from emp_hw; 

--bigo(가변형 문자열 길이 20) 열을 추가하기----
alter table emp_hw
add bigo varchar(20);

--bigo열크기를 30로 변경-----
alter table emp_hw
modify bigo varchar(30);

---열크기 확인 ------
desc emp_hw;

--bigo 열 이름을 remark로 변경하기----
alter table emp_hw
rename column bigo to remark;

---emp_hw 테이블에 emp 데이터 저장하기 단 remark 열은 null로 삽입
insert into emp_hw
select empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

--테이블 삭제------
drop table emp_hw;

--emp 지워진거 다시 추가
show recyclebin; (휴지통)

FLASHBACK table emp
to before drop;




---------------데이터 사전--------------------------------------------
desc user_tables;

select table_name
from user_tables;

--주인과 그 주인의 테이블을 볼수있음
select owner, table_name
from all_tables;

---------------인덱스----------------------------------------------------
-- index(검색속도를 향상하기위해 사용 객체)
-- select 구문의 검색속도를 향상 시킨다
-- 전체 레코드의 3%~5% 정도일때
-- index객체를 컬럼에 생성해서 사용한다

create index 인덱스명
on 테이블명(컬럼명);

--생성
create table emp01
as
select* from emp;

--조회
select* from emp01;

--추가
insert into emp01
select* from emp01;

--추가
insert into emp01(empno,ename)
values(1111,'bts');

-- index 객체 생성전(0.03초 ~ 0.038초)
select empno,ename
from emp01
where ename = 'bts';

--index 생성
create index idx_emp01_ename
on emp01(ename);

--index 객체 생성후 (0.001초 ~0.002초)
select empno,ename
from emp01
where ename = 'bts';

--인덱스 삭제-----
drop index idx_emp01_ename;

-----삭제----------
drop table emp01;

-- 테이블 삭제후 원상 복구
-- show recyclebin; (휴지통)

--휴지통 확인
show recyclebin;

--휴지통에서 복구
flashback table emp_hw
to before drop;

--휴지통 비우기
purge recyclebin;
----------------------------제약 조건--------------------------------------
--책 360 페이지

-- 제약조건 (무결성) : 잘못된 값이 데이터로 사용되는것을 못하게 하는것
-- not null
-- unique
-- primary key (기본키)
-- foreign key
-- check

--emp,dept
insert into emp
values(1111,'aaa','manage',9999,SYSDATE,1000,NULL,50);

--테이블 생성
create table emp02(   --constraint emp02_empno_pk primary key 이런식으로 넣어주면 오류보고에 왜 위배됬는지 나옴
         empno number(4) constraint emp02_empno_pk primary key,-- unique not + null =  primary key
         ename varchar2(10) constraint emp02_ename_nn not null,
         job varchar2(9),
         deptno number(2)
);

--------------------
--조회
select * from emp02;

--테이블 삭제
drop table emp02;

--행 삭제
delete from emp02;
-------------------
--데이터
insert into emp02
values(1111,'홍길동','manager',30);

insert into emp02
values(2222,'홍길동','manager',30);

insert into emp02
values(null,'김유신','salesman',30);

insert into emp02
values(2222,'옥동자','salesman',10);
----------






