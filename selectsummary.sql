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

