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

