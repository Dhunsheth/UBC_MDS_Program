
select * from mydata;

create view myView
as select * from mydata;

select * from myView;

update myView
set amount = 100
where num = 10;

show grants; 


REVOKE grant option
  ON mydata
  FROM iadaji;

WITH RECURSIVE supervises(supId,empId) AS(
   (SELECT supereno, eno FROM emp)
   UNION ALL
   (SELECT S1.supId, S2.empId
   FROM supervises S1, supervises S2
   WHERE S1.empId = S2.supId)
)
SELECT E1.ename FROM supervises, emp AS E, emp AS E2
WHERE supervises.supId = E2.eno and E2.ename = 'J. Jones'
       and supervises.empId = E1.ename;
