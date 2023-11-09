use workson;

-- Lecture 8 views practice - just making selects and then add "create view view_name as" in front of it
-- Slide 7
-- Q1
select * from emp where title = 'EE';
-- Q2
select * from proj where pno in (select pno from workson);
-- Q3
select distinct S.eno, S.ename from emp as E join emp as S on E.supereno = S.eno;
-- OR -- want all columns 
SELECT DISTINCT M.eno, M.ename, M.bdate, M.title, M.salary, M.supereno, M.dno FROM emp as E, emp as M WHERE E.supereno = M.eno;
-- Q4
select dept.dno, dept.dname, avg(salary) from dept join emp on dept.dno = emp.dno group by dept.dno, dept.dname;
-- Q5
select eno, ename, title from emp;
-- Q6
select * from emp join workson on emp.eno = workson.eno where emp.eno = 'E1';

-- Lecture 4 Practice Questions
select * from workson.dept;
select * from workson.emp;
select * from workson.proj;
select * from workson.workson;

-- Slide 41 - subqueries
-- Q1
select distinct dept.dno from dept join proj on dept.dno = proj.dno;
-- OR
select dno from dept where dno in (select dno from proj);
-- Q2
select eno, ename from emp where eno not in (select distinct eno from workson where pno is not null);
-- Q3
select ename from emp where title = 'EE' and salary > all (select salary from emp where title = 'PR');
-- Q4
select emp.eno, emp.ename from emp join workson on emp.eno = workson.eno where emp.eno != 'E1' and 
pno in (select pno from emp join workson on emp.eno = workson.eno where emp.eno = 'E1'); 
-- OR
SELECT ename FROM emp WHERE ename <> 'J. Doe' AND eno IN
  (SELECT eno FROM workson WHERE pno IN
  (SELECT pno FROM workson WHERE eno =
  (SELECT eno FROM emp WHERE ename = 'J. Doe')));

-- Slide 20 - aggregate functions and group by
-- Q1
select max(emp.salary) from workson.emp;
-- Q2
select min(proj.budget) from workson.proj;
-- Q3
select proj.dno, avg(proj.budget) from workson.proj group by proj.dno;
-- Q4
select proj.pname, sum(workson.hours) from workson.proj join workson.workson on proj.pno = workson.pno group by proj.pname;
-- Q5
select emp.ename, sum(workson.hours) as hours_worked from workson.emp join workson.workson on emp.eno = workson.eno group by emp.ename having hours_worked > 30;

-- Lecture 3 Practice Questions

-- Slide 47 - Union/Intersect/Except and Order by
-- Q1
select * from workson.emp order by emp.salary desc, emp.title asc;
-- Q2
(select E.ename from workson.emp as E join workson.emp as M on E.supereno = M.eno)
union
(select emp.ename from workson.emp join workson.dept on dept.mgreno = emp.eno);
-- Q3
(select M.ename from workson.emp as E join workson.emp as M on E.supereno = M.eno)
except
(select emp.ename from workson.emp join workson.dept on dept.mgreno = emp.eno);
-- Q4
select proj.pno, emp.ename 
from workson.dept join workson.proj on dept.dno = proj.dno 
join workson.workson on proj.pno = workson.pno 
join workson.emp on workson.eno = emp.eno
where dept.dname = 'Management'
order by proj.pno asc;
-- Q5
select proj.pname 
from workson.proj join workson.dept on proj.dno = dept.dno 
join workson.workson on proj.pno = workson.pno 
where dept.mgreno = workson.eno;


-- Slide 45 - Like and Is Null
-- Q1
select *, emp.salary/12 as monthly_salary from workson.emp;
-- Q2
select emp.ename from workson.emp where emp.supereno is null;
-- Q3
select emp.ename from workson.emp join workson.workson on emp.eno = workson.eno where emp.ename like '%S%' and workson.resp like '%ER';
-- Q4
select E.ename, M.salary - E.salary from workson.emp as E join workson.emp as M on E.salary < M.salary where E.supereno = M.eno;
-- Q5
select * from workson.proj order by proj.budget desc limit 3;


-- Slide 29 - joins and ordering
-- Q1
select * from workson.proj where proj.budget < 500000 order by proj.budget desc;
-- Q2
select emp.ename, emp.salary from workson.emp order by emp.salary desc limit 5;
-- Q3
select proj.pno, proj.dno, proj.pname, dept.dname
from workson.proj join workson.dept on proj.dno = dept.dno where dept.dname > 'D' order by proj.dno, proj.pno asc;
-- Q4
-- using join
select proj.pname from workson.proj join workson.dept on proj.dno = dept.dno where dept.dname = 'Consulting';
-- using a subquery
select proj.pname from workson.proj where proj.dno = (select dept.dno from workson.dept where dept.dname = 'Consulting');
-- Q5
select workson.eno, workson.pno, workson.resp, workson.hours 
from workson.proj join workson.workson
on proj.pno = workson.pno
where proj.budget > 50000 and workson.hours < 20;
-- Q6
select dept.dname, proj.pname, emp.ename
from workson.dept join workson.proj
on dept.dno = proj.dno
join workson.emp 
on dept.mgreno = emp.eno;


-- Slide 18 - filtering
-- Q1
select * from workson.proj where proj.budget > 250000;
-- Q2
select proj.pno, proj.pname from workson.proj where proj.dno = 'D1';
-- Q3
select proj.pno, proj.dno from workson.proj where proj.dno in ('D1','D2');
-- Q4 
select emp.eno from workson.emp where emp.salary < 30000;
-- Q5 
select distinct workson.resp from workson.workson;
-- Q6
select emp.ename from workson.emp 
where emp.bdate > '1970-07-01' and emp.salary > 35000 and emp.title in ('SA','PR');

-- Slide 12 - select
-- Q1
select * from workson.proj;
-- Q2
select proj.pno from workson.proj;
-- Q3
select proj.pno, proj.budget from workson.proj;
-- Q4
select distinct proj.budget from workson.proj;
