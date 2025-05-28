--drop database test
--drop database test_1
--go

--create database test

--go	

use test

-- exo A 01
CREATE TABLE Table1 (
	col1 INTEGER identity (1,1)
)

select *  from test.dbo.Table1

IF EXISTS(SELECT *  FROM  table1 )
begin print('1')
end

-- 1.2
use test
go
drop table table2
go
CREATE TABLE Table2 (
	 col1 INTEGER unique
	,name varchar(50)
)

--1.3

print ('
Bonjour, et bienvenue dans le
cours de Transact SQL !
')

-- 1.4

create table #tempo (mot varchar (50))

insert into #tempo values('bonjour')
select * from #tempo

select 'bonjour' as 'message' into #tempo2 
select * from #tempo2


-- 1.5

insert into Table2 values
	 (1,'pierre')
	,(2,'hamid')

-- 1.6

declare @code varchar(100) 
set @code =  'select * from Table2' 
exec('select * from Table2')
exec(@code) 



drop table if exists test_if_exist
go
create table test_if_exist (col1 int)
go
select * from test_if_exist


-- exo 2.1-2.2

PRINT(' Le T-SQL, c’est bien pratique ! ')

declare @text01  varchar(50) 
set @text01 = ' Le T-SQL, c''est bien pratique ! '
PRINT @text01





-- 2.3
use AdventureWorks2019


declare @count_pp int
-- select integre
select @count_pp =count(BusinessEntityID) from person.person

-- avec set et (select)
set @count_pp = (select count(BusinessEntityID) from person.person)

print (@count_pp )

-- 2.4
declare @prenom_emp nvarchar(50)

set @prenom_emp = 
	(select top 1 FirstName from Person.Person
	where LastName = 'Eminhizer')

print (@prenom_emp)


-- 2.6

declare 
@x varchar(50),
@y varchar(50),
@z integer

set @x = 'la valeur de '
set @y = @x + '@z' + ' est '
set @z = 50


print (@y + convert (varchar, @z))



SELECT COLUMN_NAME, DATA_TYPE , TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'person'


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS


-- 2.7

declare @date_du_jour datetime
set @date_du_jour = GETDATE()
print @date_du_jour


-- 2.8
--select * from Person.Person
--select * from HumanResources.Employee

Declare @BusinessEntityID int
Declare @FirstName nvarchar(50)
Declare @LastName nvarchar(50)
Declare @HireDate date
Declare @Gender nvarchar(50)


select 
	 @BusinessEntityID= PP.BusinessEntityID
	,@FirstName = pp.FirstName
	,@LastName = PP.LastName
	,@HireDate = HR.HireDate
	,@Gender = HR.Gender
from	
	 HumanResources.Employee AS HR
	,Person.Person AS PP
where pp.BusinessEntityID = HR.BusinessEntityID
and pp.LastName = 'Eminhizer'


print (' M. ' +@LastName +' '+ @FirstName  +' est l’employé
numéro '+convert(varchar,@BusinessEntityID)+' , a été engagé le '+convert(varchar,@HireDate) +'et
est un '+@Gender)

-- 2.9
declare @var1 int
declare @var2 varchar(50)
set @var1 = 30
set @var2 = 'bastien'

print concat(@var1,@var2)
print @var1 + @var2

go
-- 2.10

declare	@var1 int
declare	@var2 int
declare @var3 int

set	@var1 = rand()*10
set	@var2 = rand()*10
set @var3 = rand()*10

select 
	 @var1 as col1
	,@var2 as col2
	,@var3 as col3
	,@var1 +@var2 +@var3 as resultat
into #table_temp
select * from #table_temp
go
drop table #table_temp

-- 2.11
create table #table_temp 
(Title varchar(50),FirstName varchar(50),LastName varchar(50))
 
insert into #table_temp
select Title,FirstName,LastName from Person.Person

select * from #table_temp 


-- 2.13
declare @table table(
	 JobTitle nvarchar(200)
	,HireDate date 
	,VacationHours int
	,SickLeaveHours int
	)

insert into @table
select 
	 JobTitle
	,HireDate
	,VacationHours
	,SickLeaveHours
from HumanResources.Employee
where JobTitle like '%WC60%'

select * from @table


--2.14

create table #tabletemp (
	 JobTitle nvarchar(200)
	,HireDate date 
	,VacationHours int
	,SickLeaveHours int
	)
	
insert into #tabletemp
	select * from @table 



--2.15
drop table if exists  #tempo5 

create table #tempo5 (MoisNaissance int, FirstName varchar(50), LastName varchar(50), Ville varchar(50))
insert into #tempo5 values(4, 'Raphaelle', 'Vinches', 'Toulouse')
insert into #tempo5 values(3, 'Mael', 'Vinches', 'Rodez')
insert into #tempo5 values(11, 'Luna', 'Beaux', 'Chamonix')
insert into #tempo5 values(12, 'Santa', 'Claus', 'Pole Nord')
insert into #tempo5 values(5, 'Dupont', 'Dupont', 'Bruxelles')

declare @tempo5 table(MoisNaissance int, FirstName varchar(50), LastName varchar(50), Ville varchar(50))

insert into @tempo5
	select * from  #tempo5


update #tempo5 set MoisNaissance = 5 where MoisNaissance in (3,4)

select * from #tempo5

select * from @tempo5


