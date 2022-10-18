select *
from emp;

--���ڸ� �������� ����Ҷ� 
--��ҹ���, ' ' Ȧ����ǥ�� ���Ѿ� �ȴ�


select *
from emp
where ename = 'FORD'; --�ҹ��� ford�� ����.


--��¥�� �������� ����Ҷ�
--''
--��¥�� ũ�Ⱑ �ִ�
--80/12/20(�˻������� �����ִ� ����) -> 1980 12 20 �ð� �� �� ����(���ԵǾ��ִ� ����)
select *
from emp
where hiredate <'1982/01/01';

--or �ΰ��̻��� �����߿� �ϳ��̻� ���ΰ��
select *
from emp
where deptno = 10 or sal >= 2000;

--not ������ ������
select *
from emp
where sal != 3000;

-- != �� not ������� ����
select*
from emp
where not sal = 3000;

--and, or
--���� ������ ǥ�� �Ҷ� ���
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

--like ������
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���̵� ī�带 ����Ѵ�( % , _ )
--%�� ��� ���ڸ� ��ü�Ѵ�
--_�� �ѹ��ڸ� ��ü�Ѵ�
select *
from emp
where ename like 'F%';

select *
from emp
where ename like 'F___'; --����� 3�� ��

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

--null ����
--is null / is not null
select *
from emp
where comm is null;

select *
from emp
where comm is not null;

===========================

--���տ�����
--�ΰ��� select ������ ����Ѵ�
--�÷��� ������ �����ؾ��Ѵ�.
--�÷��� Ÿ���� �����ؾ��Ѵ�.
--�÷��� �̸��� ��� ����.
--������, ������, ������

select empno, ename, sal, deptno
from emp
where deptno = 10
union --������ 
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
where deptno = 10
union all --������ 
select empno, ename, sal, deptno
from emp
where deptno = 10;


select empno, ename, sal, deptno
from emp
MINUS --������
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
intersect -- ������
select empno, ename, sal, deptno
from emp
where deptno = 10;



--�̸��� s�� ������ ��� ������ ����ϱ�
select *
from emp
where ename like '%S';

--30�� �μ����� �ٹ��ϰ��ִ� ����߿� ��ì�� ���������λ���� ����ϱ�
select *
from emp
where deptno = 30 and job = 'SALESMAN';

--20��30�� �μ����� �ٹ��ϴ� ����� �޿��� 2000�ʰ��� �����
--���� ���� �ΰ��� ����� SELECT���� ����Ͽ� ��� ��ȣ �̸� �޿� �μ���ȣ�� ����ϱ�
--1 ���� �����ڸ� ������� ���� ���
--2 ���� �����ڸ� ����� ���
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


--�Լ�
--�����Լ� upper,lower,substr,instr,replace,lpad,rpad,concat
--�����Լ�
--��¥�Լ�

--upper�� ���ξȿ� ���ڸ� �빮�ڷ� ��ȯ�Ͽ� ��ȯ
select 'Welcome',upper('welcome')
from dual;

--lower�� ���ξȿ� ���ڸ� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
select lower(ename),upper(ename)
from emp;

--initcap�� ù���ڴ� �빮�� �������� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
select initcap(ename)
from emp;

select *
from emp 
where ename = 'FORD';

select *
from emp
where lower(ename) = 'scott';

--�̸��� �������� ���� 
select ename,length(ename)
from emp;

--���ڷ� ���� �ҷ����� ex 1,13(1~13�ڸ��� �ִ� ���� ��ȯ), ,15(15��°�ִ� ���ڸ� ��ȯ)
-- ���̳ʽ��� ���̸� �ڿ��� ���� ���Ե�
--      1234567891011121314151617(���鵵 ���ھ���)
select 'welcome to Oracle',substr('welcome to Oracle',-3),substr('welcome to Oracle',17)
from dual;

select 'welcome to Oracle',substr('welcome to Oracle',2,3),substr('welcome to Oracle',17)
from dual;                                       --2�� ������ġ 3�� 2�ڿ� ������ ����

-- o��ġ�� ���ڷ� ǥ��
select instr('welcome to Oracle','o')
from dual;

--���� ����� o�� 5������ �ڿ� 6�� �Ἥ 5���� �ڿ��ִ� o�� ã��
select instr('welcome to Oracle','o',6)
from dual;

select instr('welcome to Oracle','e',3,2)--�ι�° �Է°��� ������ġ, 3��° �Է°��� ��ġ��
from dual;

select 'welcome to Oracle',replace('welcome to Oracle','to','of')--to�� of�� ����
from dual;

select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual

select concat(empno,ename),empno || '' || ename --�� ���ڿ��� ��ġ�� �Լ�
from emp;

====����====

select  --round�� �ݿø�
        round(1234.5678),
        round(1234.5678,0),
        round(1234.5678,1),
        round(1234.5678,2),
        round(1234.5678,-1),
        round(1234.5678,-2)
from dual;

select  --trunc�� �Ҽ��� ���ڸ� ������~
        trunc(1234.5678),
        trunc(1234.5678,0),
        trunc(1234.5678,1),
        trunc(1234.5678,2),
        trunc(1234.5678,-1),
        trunc(1234.5678,-2)
from dual;

select
        ceil(3.14), --�ڽź��� ū ���� ����� ���� 4
        floor(3.14), --�ڽź��� ���� ���� ����� ���� 3
        ceil(-3.14), -- -3
        floor(-3.14) -- -4
from dual;

select mod(5,2),mod(10,4) --mod(�������� ���� , ��������) ���� �������� ���
from dual;

select * --������θ� 2�� ������ �������� 1�γ����°͵��� Ȧ���̹Ƿ� �̷������ε� ���� ����
from emp
where mod(empno,2) = 1;











