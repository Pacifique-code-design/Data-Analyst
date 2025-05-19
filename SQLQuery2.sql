use DBslide


--select first_name,last_name from student
select
'P:' + first_name as 'prénom'
,'N:' + last_name as 'nom de famille'
,year_result * 5 as 'Résultat sur 100'
from student

select * from student



--Exos_2_1.1

select last_name, first_name as 'F name'
from student

select last_name lname, first_name as fname
from student

select last_name /*||*/ + '_' /*||*/ + first_name as 'name '
from student

select last_name + '  ' + first_name as name, year_result * 10 result
from student


--Exos_2_1.2

select last_name + first_name as 'nom de l etudiant' ,
birth_date, login , year_result
from student 

--Exos_2_1.3

select last_name + '   '+ first_name as 'nom complet de l´etudiant' , student_id,
birth_date
from student

--Exos_2_1.4
SELECT convert(varchar, student_id)
     +'|'+ convert(varchar,first_name)
    +'|' +convert(varchar,last_name)
     +'|' +convert(varchar,birth_date)
     +'|'+ convert(varchar,login)
     +'|'+ convert(varchar,section_id)
     +'|'+ convert(varchar,year_result)
    + '|'+ convert(varchar,course_id)
FROM student

-------------------------------------------------------------
select last_name from student
where last_name not like '_____%' -- nom avec moins de 5 caractères


select last_name from student
where last_name like '_____%' -- nom avec au moins de 5 caractères


--------------------------------------------------------------

--Exos_2_2.1

select login, year_result
from student 
where year_result > 16


--Exos_2_2.2

select last_name, section_id from student 
where first_name = 'Georges'


--Exos_2_2.3

select last_name, year_result from student 
where year_result between 12 and 16


--Exos_2_2.4

select last_name, section_id, year_result from student 
where section_id not in (1010,1020,1110)

--where section_id = 1010
--or section_id = 1020
--or section_id = 1110

--Exos_2_2.5

select last_name, section_id from student 
where last_name like '%r'

--Exos_2_2.6
select last_name , year_result  from student 
where last_name like '__n%' and  year_result  > 10

--Exos_2_2.7
select last_name , year_result  from student
where year_result <= 3
order by year_result DESC

--Exos_2_2.8

select last_name + '  ' + first_name  as 'nom complet', year_result  from student
where  section_id like '1010'
order by 'nom complet' ASC

--Exos_2_2.9
select last_name, section_id, year_result from student 
where section_id in (1010,1020) and year_result not between 12 and 18
order by section_id ASC

--Exos_2_2.10

select last_name,
	   section_id,
	   year_result*5 as 'Résultat sur 100'
from student 

where   section_id like '13%' 
	    and (year_result*5) <= 60
order by 'Résultat sur 100' DESC




--Partie III : Les Fonctions

select charindex('i', 'Kim Basinger')
,charindex ('08', 'Basinger 08/12/1953')
,charindex('y', 'Kim Basinger')
,charindex('', 'Kim Basinger')
from student 


select len('Kim Basinger') from student

-- on peut utiliser les  fonction dans d'autres


select 38/5, 38 % 5 -- Pour modulo

select substring(last_name , len(last_name)-2,3) from student 
-- fonction replace

select replace(first_name, 'Clint', 'Sarah'), first_name from student

select max(year_result) from student


select sum(year_result) as 'Somme des résultats annuels', sum(year_result)/count(*) as 'Moyenne générale' from student 

select avg(year_result) from student 

--Fonctions case

select first_name, last_name, year_result,
case
	when year_result between 18 and 20 then 'Excellent'
	when year_result between 16 and 17 then 'Très bien'
	when year_result between 14 and 15 then 'Bien'
	when year_result between 12 and 13 then 'Suffisant'
	when year_result between 10 and 11 then 'Faible'
	when year_result between 8 and 20 then 'Insuffisant'
	else 'Insuffisance grave'
end as 'note globale '
from student


-- EXOS2_3

--Exos 2_3_6

select count(* )
from student;

select count(student_id),count( login )
from student ;

select min(year_result),max(birth_date) from student 
where year_result > 12;

--Exos 2_3_7


select  avg(year_result) as 'résult annuel moyen' from student

--Exos 2_3_8

select max(year_result) as 'la plut haute valeur annuelle obtenu' from student

--Exos 2_3_9

select sum(year_result) as 'somme dees résults annuels' from student



--Exos 2_3_10
select min(year_result) as 'resultat annuel le plus faible' from student

--Exos 2_3_11
select count(*) as 'nombre de lignes de la table' from student


--Exos 2_3_12

select login, birth_date from student   
where birth_date > '1970'


select login, year(birth_date) as [année de naissance], right(datepart(yy,birth_date),2)
from student

--Exos 2_3_13

select login, last_name from student 
where len(last_name) >= 8 

select login, last_name from student
where len(replace(last_name, '','')) >= 8
--Exos 2_3_14

select upper(last_name) as 'Nom de famille' , first_name, (year_result)   from student
where year_result >= 16
order by year_result  DESC


--Exos 2_3_15

select 
first_name,
last_name,
login,
--year_result between 6 and 10 ,
replace(login, login, substring(lower(first_name), 1,2) +  substring(lower(last_name),1,4)) as 'Nouveau login'

from student
where year_result between 6 and 10




--Exos 2_3_16
select 
first_name,
last_name,
login,
--year_result between 6 and 10 ,
replace(login, login, substring(lower(first_name),2,3) + convert( varchar , datepart(yy, getdate())-datepart(yy,birth_date) ))  as 'Nouveau login'

from student
where year_result = 10
or year_result = 12
or year_result = 14


--Exos 2_3_17
/*Donner la liste des étudiants (nom, login, résultat annuel) qui ont un nom 
commençant par « D », « M » ou « S ». La liste doit présenter les données dans l’ordre croissant
des dates de naissance des étudiants*/


select 
last_name,
login,
year_result
--birth_date
from student
where upper(left(last_name,1)) in ('D','M','S')
order by birth_date



-- Function GROUP BY

select section_id, avg(year_result) from student
group by section_id

--GROUP BY : + WHERE

select section_id, avg(year_result) from student
where left(last_name,1) in ('B','C','D')
group by section_id
--having avg(year_result) >=10


--GROUP BY :+ WHERE + HAVING
select section_id, avg(year_result) from student
where left(last_name,1) in ('B','C','D')
group by section_id
having avg(year_result) >=10


select section_id, course_id, count(year_result)
from student
group by rollup(section_id, course_id)


select section_id, avg(year_result)
from student
where year_result > 10
group by section_id

--Exos2.4.7
select 
section_id
, max(year_result) as 'Résultat maximum'
from student
group by (section_id)

--Exos2.4.8

select section_id,  avg(year_result) as [Moyenne]
from student
where left(section_id,2) = '10' 
group by section_id

--Exos2.4.9

select convert(varchar,datepart(mm,birth_date)) as [Mois de naissance] ,avg(year_result) as 'Moyenne'

from student
where convert(varchar,datepart(yy,birth_date)) between 1970 and 1985
group by birth_date 


--Exos2.4.10

select section_id, avg(year_result) as [Moyenne] from student
---where count(section_id) >=3                                        -- pas bien fait
group by section_id
having count(section_id) >=3

--Exos2.4.11

select section_id, avg(year_result) as [Moyenne], max(year_result) as [Résultat maximmum] from student             -- correct
--where avg(year_result) >8                                        
group by section_id 
having  avg(year_result) >8 


--- Les Jointures
-- Exos 2.6.1

select * from course
select * from professor
select * from student
select * from section

select c.course_name, s.section_name, p.professor_name 
from course c  join section s
	on section_id = s.section_id
	join professor p
	on p.section_id = c.professor_id

select course_name, professor_name, section_name
from course c join professor p
on c.professor_id = p.professor_id
join section s
on p.section_id = s.section_id

	
select course_name, professor_name, section_name
from (professor p inner join section on p.section_id = section.section_id)
join course c
on p.professor_id = c.professor_id

-- Exos 2.6.2
select se.section_id ,  se.section_name, s.last_name
from student s, section se
where s.student_id = se.delegate_id 
order by se.section_id DESC


-- Exos 2.6.3

select se.section_id, se.section_name, p.professor_name
from section se  left join professor p
	on se.section_id = p.section_id

	-- Exos 2.6.4

select se.section_id, se.section_name, p.professor_name
from section se  left join professor p
	on se.section_id = p.section_id
	where p.professor_name is not null

-- Exos 2.6.5

select s.last_name, s.year_result, g.grade
from student s , grade g
	
where( s.year_result between g.lower_bound and g.upper_bound) and s.year_result >=12
order by g.grade ASC


select s.last_name, s.year_result, g.grade
from student s , grade g
	
where s.year_result >=12 
and ( s.year_result between g.lower_bound and g.upper_bound)
order by g.grade ASC
---select * from grade

-- Exos 2.6.6

select p.professor_name, s.section_name, c.course_name, c.course_ects
from   section s right join professor p
on s.section_id = p.section_id
left join course c
on c.professor_id = p.professor_id
order by c.course_ects DESC

select * from course

-- Exos 2.6.7

--select professor_id from professor
select p.professor_id, sum(course_ects) as 'ECTS_TOT '
from   professor p  left join course c
	
	on p.professor_id = c.professor_id
	group by p.professor_id
	order by sum(course_ects) DESC
	---------------------------
select p.professor_id, coalesce( sum(course_ects),0) as 'ECTS_TOT ' -- si on veut rempacer le NULL pas zero
from   professor p  left join course c
	
	on p.professor_id = c.professor_id
	group by p.professor_id
	order by sum(course_ects) DESC

	-- and 
select p.professor_id, coalesce( convert(nvarchar, sum(course_ects)),'pas d''information') as 'ECTS_TOT ' -- si on veut rempacer le NULL pas zero
from   professor p  left join course c
	
	on p.professor_id = c.professor_id
	group by p.professor_id
	order by sum(course_ects) DESC

-- Exos 2.6.8


select first_name, last_name, professor_name, professor_surname 
from student s, professor p
where last_name like '________%'
----------------------------------------------
select professor_name, professor_surname, 'P' as [Catégorie]
from  professor 
where len(professor_name)>8
union
select first_name, last_name, 'S' as [Catégorie]
from student 
--where last_name like '________%'
where len(last_name)>8


-- Exos 2.6.9

select s.section_id
from section s left join professor p 
on s.section_id = p.section_id
where p.professor_id is NULL