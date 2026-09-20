create database if not exists LFS_YEAR_1
Use LFS_YEAR_1

create table LabourForceStats (
    Date date,
    LabourForceSize float,
    EmploymentPersons float,
    UnemployedPersons float,
    OutsideLabourForce float,
    ParticipationRate float,
    EmploymentPopulationRatio float,
    UnemploymentRate float
);

*filtering
Select Date, UnemploymentRate
From LabourForceStats
where UnemploymentRate >5
order by Date;

select * from LabourForceStats where date between '2000-01-01' and '2010-01-01' order by Date

Select * from LabourForceStats where LabourForceSize > 9000

Select * from LabourForceStats where EmploymentPopulationRatio = 62;

*grouping

Select (Date/10)*10 as decade,
       avg(UnemploymentRate) as avg_unemployment
from LabourForceStats 
group by (Date/10)*10
order by decade;

Select
    Year(Date) as Year,
    avg(UnemploymentRate) as AvgUnemployment
from LabourForceStats group by Year (Date)
order by Year;

Select
    sum(EmploymentPersons) as TotalEmployed,
    sum(UnemployedPersons) as TotalUnemployed
from LabourForceStats;

Select 
    case 
        when LabourForceSize < 6000 THEN 'Small (<6000)'
        when LabourForceSize between 6000 and 8000 then 'Medium (6000-8000)'
        else 'Large (>8000)'
    end as LabourForceCategory,
    count(*) as NumYears,
    avg(UnemploymentRate) as AvgUnemployment from LabourForceStats group by LabourForceCategory order by LabourForceCategory;
    
    #Sorting
    
Select * from LabourForceStats order by LabourForceSize desc;

Select Date, UnemploymentRate, LabourForceSize from LabourForceStats order by UnemploymentRate asc;

Select * from LabourForceStats order by Date desc;

Select Date, LabourForceSize from LabourForceStats order by LabourForceSize desc limit 5;








