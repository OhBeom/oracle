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

-------------------------------------------------------��¥�Լ�

select sysdate -1 ����, sysdate, sysdate + 1 ����
from dual;

select sysdate - hiredate as �ٹ��ϼ�    -- ���̰� �ϼ� ��ȯ
from emp;

-----------�ټӳ�� 

select trunc((sysdate - hiredate) / 365) �ټӳ��
from emp;

-----------------
sysdate, round, trunc

--�ڷ�����ȯ �Լ�
--to_char()
--to_number()
--to_date()

--��¥�� ���ڷιٲ���
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')as ����ð�
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY')as �Ի�����
from emp;

--���ڸ� ���ڷ�
select to_char(123456,'999,999')
from dual;

select sal, to_char(sal,'L999,999')
from emp;

--���ڸ� ���ڷ�
select '20000' - 10000 --�ڵ�����ȯ
from dual;

select '20000' - '5000' -- to_number() ����ȯ�� �ؾ��Ѵ�
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--���ڸ� ��¥
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

--null������ ó��
--nvl(null,�ٲٰ���� ������)
--nvl�� null �������� Ÿ�԰� ���� Ÿ���� �����ؾ��Ѵ�.
--nvl(����,����), nvl(����,����)
select ename �����,sal,sal *12 + nvl(comm,0) as ����,comm
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

-- ���ǹ� ǥ���ϴ� �Լ�
-- decode() -> switch
-- case     -> if

select ename,job,deptno,
        decode(deptno,10,'AAA',20,'BBB',30,'CCCC','��Ÿ') as �μ���
from emp;

--������ ���ǽ����� ���� �� �� �ִ�.
case
     when ���ǽ� then ���๮
     when ���ǽ� then ���๮
     when ���ǽ� then ���๮
     else ���๮ 
end as ��Ī

select ename,job,deptno,
  case
     when deptno = 10 then 'AAA'
     when deptno = 20 then 'BBB'
     when deptno = 30 then 'CCC'
     else '��Ÿ'
     end as �μ���
from emp;


select ename,job,sal,
   case
        when sal between 3000 and 5000 then '�ӿ�'
        when sal >= 2000 and sal < 3000 then '������'
        when sal >= 500 and sal < 2000 then '���'
        else'��Ÿ'
    end as ����
from emp;

============================================
--å ������ 174

select empno,rpad(substr(empno,1,2),4,'*')
         ename,rpad(substr(ename,1,1),5,'*') 
from emp
where length(ename)>=5
and length(ename)<6;

===============================================
--���������ִ� ����
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

--sum�� ��� �����͸� ���Ѵ�
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
             -- select �÷� , �÷� ���� ��ȸ�Ǵ� �÷��� ���ڰ� ���� ���ƾ� �����ִ� 

select ename,
from emp;


select min(hiredate)  --���� ���� �Ի��ѻ�� �⵵, ���� �ʰ� �Ի��� ����� max�����
from emp
where deptno = 20;


-- sum(),avg(),count(),max(),min()
-- �Ϲ��÷��� ���� ��� �Ұ�
-- ũ��񱳰� ���� ��� Ÿ�Կ� ��밡��

-- select �÷���
-- from ���̺��
-- where ���ǽ�(�׷��Լ� ���Ұ� / grop by ,having ���� ��������)
-- group by �����÷���
-- having ���ǽ�(�׷��Լ� ����Ѵ�)
-- order by �÷��� ���Ĺ�� ==> ������ �� �������� �ۼ� ���� ���� ���ٲ�

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000; --group by���ؼ� ��ȸ ����� ������ �ش� 
                         --���ǽ��� �ۼ��Ҷ� �׷��Լ��� ����Ѵ�
                         
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
-- �� �Ʒ� �Ѵ� ���� ��� �������� UNION�� group by�� ����  
select avg(sal)
from emp
group by deptno;

select deptno
from emp
group by deptno;

--deptno�� avg�� ���� 3���� ���� �Ȱ������� �ΰ��� ���ÿ� �����ִ� 
select deptno, avg(sal)
from emp
group by deptno
order by deptno;

select deptno,job, avg(sal)
from emp
group by deptno,job
order by deptno,job desc;
----------------------------------------10/20--------------
--����(join)
--2�� �̻��� 
--from ���� �ΰ� �̻��� ���̺��� �ۼ��Ѵ�
--where�� ���� ������ �ۼ��Ѵ�
--cross join(where �� ���� ����)
--equi join(where ������� : =)
--non equi join(where ���������� : and, or)
--self join (where �ϳ��� ���̺��� ����Ѵ�)
--out join (where�� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ����(+)�� ����)

select ename,job,e.deptno,dname,loc
from emp e,dept d= --���̺� ��Ī �ο�
where 

select ename,job,e.deptno,dname,loc
from emp e,dept d --���̺� ��Ī �ο�
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where emp.sal >= s.losal and emp.sal <= s.hisal;

--���, �̸�,  �޿�, �μ���ȣ, �μ���, �޿����
--emp                dept          salgrade

select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e,emp m  --���������� �ݵ�� ��Ī�� �ο��Ѵ�
where e.mgr = m.empno;

select ename,deptno
from emp
where deptno = 20;

--scott ���� �μ��� �ٹ��ϴ� ���
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



--�ܺ�����(�ƿ�������)
--��� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���ؼ� ����Ѵ� 

select e.empno, e.ename, e.mgr, m.ename
from emp e,emp m  --���������� �ݵ�� ��Ī�� �ο��Ѵ�
where e.mgr = m.empno(+); -- �����Ͱ� ���� ���̺� �ʿ� (+)�� ���δ�

select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;


--ANSI JOIN(ǥ������ ���)
--cross join
--natural join
--inner join(equi, non equi, self)
--outer join( (+) ) //[left, right, full] outer join


--ANSI-JOIN(ǥ������ ���)
select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno) -- ���� ���̺��� �÷����� �����Ѱ�� 
where ename = 'SCOTT';

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --�����Ͱ� �ִ� ���� �����Ѵ�.
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


----------------��������---------------------------------------------------
--�������� = select���� ��ø
--select (select) �Ϲ� ��������
--from (select) �ζ��κ�
--where (select) ��������
--������ �������� 
--������ �������� 
select ename,max(sal) --ename�� sal ���� ������ ���� �޶� ���� ����
from emp;


select ename,sal      --where���� �׷� �Լ� ����
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

--��������
select dname 
from dept
where deptno = ( --���� ����
                  select deptno
                  from emp
                  where ename = 'SCOTT'
                );

--DALLAS
--�̸�, �μ���ȣ

select ename, deptno
from emp
where deptno = (
                  select deptno
                  from dept
                  where loc = 'DALLAS'
                );

--�ڽ��� ���ӻ���� KING�� ����� �̸��� �޿��� ��ȸ�ϼ���(��������)

select ename, sal
from emp
where mgr = ( 
            select empno
            from emp
            where ename = 'KING'
            );
--------------------������ ��������-------------------------------------
-- in : ����߿� �ϳ��� �����ϸ� �ȴ�.
-- > any : ����߿� ���� ���������� ũ��ȴ�.
-- > all : ����߿� ���� ū������ ũ��ȴ�.


select *
from emp
where sal in (5000,3000,2850);
--���� ���� �Ʒ� ������ ���������� �����ִ�
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
                 select max(sal) --���������� ũ�� >
                 from emp        --ū������ ������ <
                 group by deptno
                 );
                 

select ename,sal
from emp
where sal > all( 
                 select sal
                 from emp
                 where deptno = 30
                );

----------------���߿� ��������-------------------------------
select *
from emp
where (deptno,sal) in (
                          select deptno,max(sal)
                          from emp
                          group by deptno
                       );
                       
 -----------10/21-------------------------------------------------                      
------------------DML ���������۾�---------------------------
--DML(������ ���۾�) : insert, update, delete
--insert : ���̺� ������ ����
--insert into ���̺��(�÷���1 �÷���2.......)
--values(��1,��2....)
--�÷��� ���� ž�԰� ������ ��ġ�ؾ��Ѵ�.
--�ۼ� ������� 1:1 ��Ī�ȴ�.


create table dept_temp  --���̺� ����
as
select * from dept;

select *
from dept_temp;
                       

insert into dept_temp(deptno,dname,loc)  --���� ���ξȿ��ִ� �÷������� �Ʒ� values ���ο��ִ� �÷������� ���ƾ���
values(50,'DATABASE','SEOUL');

insert into dept_temp(deptno,dname) --������ null�����ͻ���
values(60,'JSP');

insert into dept_temp --�÷�����
values(70,'HTML','SEOUL');

insert into dept_temp --�÷����� , ����� null ������ ����
values(80,'NULL','SEOUL');



create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3111,'��û��','MANAGER',9999,SYSDATE,4000,null,30);

-----------���̺� �ִ� ������ �����ϱ�------------
-- update : �÷��� �����͸� ����(����)
-- update ���̺��
-- set �÷��� = ��, �÷��� = ��, ....
-- where ���ǽ�
-- �������� ������� ������ �ش� �÷��� ��� ����ȴ�.


create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2 --���μ��� �ּҸ� ����� �ٲ� (loc-�ּ�)
set loc = 'SEOUL';

update dept_temp2 --40�� �μ���� �ٹ��� ����� ����
set dname = 'DATABASE',loc = 'SEOUL'
where deptno = 40;



---------���̺� ���� ���-------------------------
--delete(������ ����)
--delete from ���̺��
--where ���ǽ�
--�������� ������� ������ ��� �����Ͱ� �����ȴ�.

drop table emp_temp2;


create table emp_temp2
as
select * from emp;

select * 
from emp_temp2;


delete from emp_temp2;

delete from emp_temp2;
where ename = 'SCOTT';

------------Ʈ�����---------------------------
--TCL(�������� �������� �Ǵ� ���)
--Ʈ�����
--commit, rollback, savepoint
--commit : 1,������ ���� ����(���̺��� ������ �ݿ�)
--         2,create������ ����ؼ� ��ü �����Ҷ�(�ڵ�)
--rollback : 1, ������ ���� ���(���̺��� ������ �� �ݿ�) ���󺹱�
--           2, õ������, ����, ����(�ڵ�)

create table dept01    --���̺� ����
as
select * from dept;

select *               --���̺� ��ȸ
from dept01;

drop table dept01;     --���̺� ����
delete from dept01;    --���̺� �����
truncate table dept01; --Ŀ�� �� �ѹ��� �Ұ����� ����

-- ���������� cmd���� ��ȸ������ ����
-- sqlplus scott/tiger �Է� -> select * from dept01; �Է� Ȯ����

commit;

-- Ŀ���� cmd Ȯ���ϴϱ� ������ ������

rollback;

--DDL(������ ���Ǿ�) : table(��� ��ü)�� ����, ����, �����ϴ� ��ɾ�
--create(����), alter(����), drop(����)

create table  ���̺��(      -- table(��ü)
            �÷���1 Ÿ��,    -- column(�Ӽ�)
            �÷���2 Ÿ��,    -- 
            �÷���3 Ÿ��,
);

create table emp_ddl(
        --���, �̸�, ��å, ������, �Ի���, �޿�, ������, �μ���ȣ
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
values(9999,'�̼���','MANAGER',1111,sysdate,1000,null,10);

 create table emp_alter
 as
 select * from emp;
 
 select *from emp_alter;

create table dept_ddl --���̺��� ����
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

--���̺��� ����
alter table emp_alter --���߰�
add address varchar2(100);

alter table emp_alter --���̸� ����
rename column address to addr;

alter table emp_alter  --�� �ڷ��� ����
modify empno number(10);

alter table emp_alter --Ư�� �� ����
drop column addr;

--���̺� ���� drop

-- drop table ���̺�
select * from emp_alter;

drop table emp_alter;

----------å ������ 324 ����-----------------------
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

--���̺� ��ȸ------
select* from emp_hw; 

--bigo(������ ���ڿ� ���� 20) ���� �߰��ϱ�----
alter table emp_hw
add bigo varchar(20);

--bigo��ũ�⸦ 30�� ����-----
alter table emp_hw
modify bigo varchar(30);

---��ũ�� Ȯ�� ------
desc emp_hw;

--bigo �� �̸��� remark�� �����ϱ�----
alter table emp_hw
rename column bigo to remark;

---emp_hw ���̺� emp ������ �����ϱ� �� remark ���� null�� ����
insert into emp_hw
select empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

--���̺� ����------
drop table emp_hw;

--emp �������� �ٽ� �߰�
show recyclebin; (������)

FLASHBACK table emp
to before drop;




---------------������ ����--------------------------------------------
desc user_tables;

select table_name
from user_tables;

--���ΰ� �� ������ ���̺��� ��������
select owner, table_name
from all_tables;

---------------�ε���----------------------------------------------------
-- index(�˻��ӵ��� ����ϱ����� ��� ��ü)
-- select ������ �˻��ӵ��� ��� ��Ų��
-- ��ü ���ڵ��� 3%~5% �����϶�
-- index��ü�� �÷��� �����ؼ� ����Ѵ�

create index �ε�����
on ���̺��(�÷���);

--����
create table emp01
as
select* from emp;

--��ȸ
select* from emp01;

--�߰�
insert into emp01
select* from emp01;

--�߰�
insert into emp01(empno,ename)
values(1111,'bts');

-- index ��ü ������(0.03�� ~ 0.038��)
select empno,ename
from emp01
where ename = 'bts';

--index ����
create index idx_emp01_ename
on emp01(ename);

--index ��ü ������ (0.001�� ~0.002��)
select empno,ename
from emp01
where ename = 'bts';

--�ε��� ����-----
drop index idx_emp01_ename;

-----����----------
drop table emp01;

-- ���̺� ������ ���� ����
-- show recyclebin; (������)

--������ Ȯ��
show recyclebin;

--�����뿡�� ����
flashback table emp_hw
to before drop;

--������ ����
purge recyclebin;
----------------------------���� ����--------------------------------------
--å 360 ������

-- �������� (���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°��� ���ϰ� �ϴ°�
-- not null
-- unique
-- primary key (�⺻Ű)
-- foreign key
-- check

--emp,dept
insert into emp
values(1111,'aaa','manage',9999,SYSDATE,1000,NULL,50);

--���̺� ����
create table emp02(   --constraint emp02_empno_pk primary key �̷������� �־��ָ� �������� �� �������� ����
         empno number(4) constraint emp02_empno_pk primary key,-- unique not + null =  primary key
         ename varchar2(10) constraint emp02_ename_nn not null,
         job varchar2(9),
         deptno number(2)
);

--------------------
--��ȸ
select * from emp02;

--���̺� ����
drop table emp02;

--�� ����
delete from emp02;
-------------------
--������
insert into emp02
values(1111,'ȫ�浿','manager',30);

insert into emp02
values(2222,'ȫ�浿','manager',30);

insert into emp02
values(null,'������','salesman',30);

insert into emp02
values(2222,'������','salesman',10);
----------






