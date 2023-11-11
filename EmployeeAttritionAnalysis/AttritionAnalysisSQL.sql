create database hrdataanalytics;

use hrdataanalytics;

# data is imported using table data import wizard feature
# hr_1.csv and hr_2.csv are the two files consisting employees data used for the analysis

# to see first 10 records
SELECT * 
FROM hrdataanalytics.hr_1 
limit 10;

# to see last 10 records
Select *
from hr_1
order by EmployeeNumber desc
limit 10;

# average employee age
select round(avg(age),0) as averageage
from hr_1;

# attrition count
select count(attrition) as attritioncount
from hr_1
where attrition = "Yes";

# current employee count
select count(attrition) as currentemployeecount
from hr_1
where attrition = "No";


# attrition rate
select concat(round((select count(attrition) from hr_1 where attrition = "Yes")*100/count(attrition),2),' ','%') as attritionrate
from hr_1;

# Current employee Rate 
select concat(round((select count(attrition) from hr_1 where attrition = "No")*100/count(attrition),2),' ','%') as attritionno
from hr_1;

select distinct businesstravel
from hr_1;

# attrition rate by business travel

select businesstravel,
count(businesstravel) AS employeecount,
concat(round((count(businesstravel) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by businesstravel
order by percentage desc;

# minimum dailyrate, maximum dailyrate, average dailyrate

select min(dailyrate) as minimumdailyrate, 
max(dailyrate) as maximumdailyrate,
avg(dailyrate) as averagedailyrate
from hr_1;

# attrition by dailyrate bins

SELECT
    CASE
        WHEN dailyrate BETWEEN 0 AND 300 THEN '0-300'
        WHEN dailyrate BETWEEN 301 AND 600 THEN '301-600'
        WHEN dailyrate BETWEEN 601 AND 900 THEN '601-900'
        WHEN dailyrate BETWEEN 901 AND 1200 THEN '901-1200'
        ELSE '1201-1500'
    END AS dailyrate_bin,
    COUNT(*) AS bin_count,
    concat(round((count(dailyrate) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
FROM
    hr_1
WHERE 
    attrition = "Yes"
GROUP BY
    dailyrate_bin
ORDER BY
    percentage desc;
    
select distinct department
from hr_1;

# attrition rate by department

select department, 
count(department) as deptcount, 
concat(round((count(department) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by department
order by percentage desc;

# minimum distancefromhome, maximum distancefromhome, average distancefromhome

select min(distancefromhome) as mindistfromhome, 
max(distancefromhome) as maxdistfromhome,
avg(distancefromhome) as avgdistfromhome
from hr_1;


# attrition rate by education level
select education, 
count(education) as edcount,
concat(round((count(education) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by education
order by percentage desc;

select distinct educationfield
from hr_1;

# attrition rate by education field 

select educationfield, 
count(educationfield) as employeecount,
concat(round((count(educationfield) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
group by educationfield
order by percentage desc;


# attrition rate by environment satisfaction 

select environmentsatisfaction, 
count(environmentsatisfaction) as employeecount,
concat(round((count(environmentsatisfaction) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by environmentsatisfaction
order by percentage desc;


# attrition rate by gender 

select gender, 
count(gender) as employeecount,
concat(round((count(gender) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by gender
order by percentage desc;

# minimum hourly rate, maximum hourly rate,average hourly rate

select min(hourlyrate) as minimumhourlyrate,
max(hourlyrate) as maximumhourlyrate,
avg(hourlyrate) as averagehourlyrate
from hr_1;

# Attrition by hourlyrate bins

SELECT
    CASE
        WHEN hourlyrate BETWEEN 0 AND 40 THEN '0-40'
        WHEN hourlyrate BETWEEN 41 AND 80 THEN '41-80'
        WHEN hourlyrate BETWEEN 81 AND 120 THEN '81-120'
        WHEN hourlyrate BETWEEN 121 AND 160 THEN '121-160'
        ELSE '161-200'
    END AS hourlyrate_bin,
    COUNT(*) AS bin_count,
    concat(round((count(hourlyrate) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
FROM
    hr_1
WHERE 
    attrition = "Yes"
GROUP BY
    hourlyrate_bin
ORDER BY
    bin_count desc;
    
    
# Attrition rate by Jobinvolvement

select Jobinvolvement, 
count(Jobinvolvement) as employeecount,
concat(round((count(Jobinvolvement) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by Jobinvolvement
order by percentage desc;

select distinct JobRole
from hr_1;

# Attrition by Job Role

select JobRole,
count(JobRole) AS employeecount,
concat(round((count(JobRole) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by JobRole
order by employeecount desc;

select distinct maritalstatus
from hr_1;

# Attrition by marital status

select maritalstatus,
count(maritalstatus) AS employeecount,
concat(round((count(maritalstatus) / (select count(*) from hr_1 where attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_1
where attrition = "Yes"
group by maritalstatus
order by employeecount desc;



SELECT * FROM hrdataanalytics.hr_2;

# minimum monthly income, maximum monthly income,average monthly income

select min(monthlyincome) as minmonthlyincome, 
max(monthlyincome) as maxmonthlyincome,
avg(monthlyincome) as avgmonthlyincome
from hr_2;

# attrition by monthly income bins

select
case
when monthlyincome between 0 and 10000 then '0-10000'
when monthlyincome between 10001 and 20000 then '10001-20000 '
when monthlyincome between 20001 and 30000 then '20001-30000'
when monthlyincome between 30001 and 40000 then '30001-40000'
else '40001-51000'
end as monthlyincome_bin,
count(*) as bin_count,
concat(round((count(hr_2.monthlyincome) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by monthlyincome_bin
order by bin_count desc;

# minimum number of companies worked , maximum number of companies worked and average number of companies worked

select min(numcompaniesworked) as minnumcompaniesworked, 
max(numcompaniesworked) as maxnumcompaniesworked,
avg(numcompaniesworked) as avgnumcompaniesworked
from hr_2;

# attrition by number of companies worked 

select
case
when numcompaniesworked between 1 and 2 then '1-2'
when numcompaniesworked between 3 and 4 then '3-4'
when numcompaniesworked between 5 and 6 then '5-6'
else '7-8'
end as numcompaniesworked_bin,
count(*) as bin_count,
concat(round((count(hr_2.numcompaniesworked) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by numcompaniesworked_bin
order by bin_count desc;

# Total Employee Over 18

select over18, count(over18) as employeecount
from hr_2
group by over18
order by employeecount desc;

# attrition rate by over time 

select hr_2.overtime, 
count(hr_2.overtime) as employeecount,
concat(round((count(hr_2.overtime) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by hr_2.overtime
order by employeecount desc;



select hr_2.performancerating, 
count(hr_2.performancerating) as employeecount,
concat(round((count(hr_2.performancerating) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by hr_2.performancerating
order by employeecount desc;


select hr_2.relationshipsatisfaction, 
count(hr_2.relationshipsatisfaction) as employeecount,
concat(round((count(hr_2.relationshipsatisfaction) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by hr_2.relationshipsatisfaction
order by employeecount desc;



select hr_2.worklifebalance, 
count(hr_2.worklifebalance) as employeecount,
concat(round((count(hr_2.worklifebalance) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by hr_2.worklifebalance
order by employeecount desc;

# minimum percent salary hike, maximum percent salary hike, average percent salary hike

select min(percentsalaryhike) as minpercentsalaryhike, 
max(percentsalaryhike) as maxpercentsalaryhike,
avg(percentsalaryhike) as avgpercentsalaryhike
from hr_2;

# Attrition by percent salary hike

select
case
when percentsalaryhike between 0 and 10 then '0-10'
when percentsalaryhike between 11 and 20 then '11-20'
when percentsalaryhike between 21 and 30 then '21-30'
when percentsalaryhike between 31 and 40 then '31-40'
else '41-50'
end as percentsalaryhike_bin,
count(*) as bin_count,
concat(round((count(hr_2.percentsalaryhike) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by percentsalaryhike_bin
order by bin_count desc;

# minimum total working years, maximum total working years, average total working years

select min(totalworkingyears) as mintotalworkingyears, 
max(totalworkingyears) as maxtotalworkingyears,
avg(totalworkingyears) as avgtotalworkingyears
from hr_2;

# Attrition by total working years

select
case
when totalworkingyears between 1 and 4 then '1-4'
when totalworkingyears between 5 and 8 then '5-8'
when totalworkingyears between 9 and 12 then '9-12'
when totalworkingyears between 13 and 16 then '13-16'
when totalworkingyears between 17 and 20 then '17-20'
when totalworkingyears between 21 and 24 then '21-24'
when totalworkingyears between 25 and 28 then '25-28'
when totalworkingyears between 29 and 32 then '29-32'
when totalworkingyears between 33 and 36 then '33-36'
else '37-40'
end as totalworkingyears_bin,
count(*) as bin_count,
concat(round((count(hr_2.totalworkingyears) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by totalworkingyears_bin
order by bin_count desc;

# minimum years at company, maximum years at company, average years at company

select min(yearsatcompany) as minyearsatcompany, 
max(yearsatcompany) as maxyearsatcompany,
avg(yearsatcompany) as avgyearsatcompany
from hr_2;


# Attrition by year at company

select
case
when yearsatcompany between 1 and 4 then '1-4'
when yearsatcompany between 5 and 8 then '5-8'
when yearsatcompany between 9 and 12 then '9-12'
when yearsatcompany between 13 and 16 then '13-16'
when yearsatcompany between 17 and 20 then '17-20'
when yearsatcompany between 21 and 24 then '21-24'
when yearsatcompany between 25 and 28 then '25-28'
when yearsatcompany between 29 and 32 then '29-32'
when yearsatcompany between 33 and 36 then '33-36'
else '37-40'
end as yearsatcompany_bin,
count(*) as bin_count,
concat(round((count(hr_2.yearsatcompany) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by yearsatcompany_bin
order by bin_count desc;


# minimum years in current role, maximum years in current role, average years in current role

select min(yearsincurrentrole) as minyearsincurrentrole, 
max(yearsincurrentrole) as maxyearsincurrentrole,
avg(yearsincurrentrole) as avgyearsincurrentrole
from hr_2;

# Attrition by years in current role

select
case
when yearsincurrentrole between 1 and 4 then '1-4'
when yearsincurrentrole between 5 and 8 then '5-8'
when yearsincurrentrole between 9 and 12 then '9-12'
when yearsincurrentrole between 13 and 16 then '13-16'
when yearsincurrentrole between 17 and 20 then '17-20'
when yearsincurrentrole between 21 and 24 then '21-24'
when yearsincurrentrole between 25 and 28 then '25-28'
when yearsincurrentrole between 29 and 32 then '29-32'
when yearsincurrentrole between 33 and 36 then '33-36'
else '37-40'
end as yearsincurrentrole_bin,
count(*) as bin_count,
concat(round((count(hr_2.yearsincurrentrole) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by yearsincurrentrole_bin
order by bin_count desc;

# minimum years since last promotion, maximum years since last promotion, average years since last promotion

select min(yearssincelastpromotion) as minyearssincelastpromotion, 
max(yearssincelastpromotion) as maxyearssincelastpromotion,
avg(yearssincelastpromotion) as avgyearssincelastpromotion
from hr_2;

# attrition by years since last promotion

select
case
when yearssincelastpromotion between 1 and 4 then '1-4'
when yearssincelastpromotion between 5 and 8 then '5-8'
when yearssincelastpromotion between 9 and 12 then '9-12'
when yearssincelastpromotion between 13 and 16 then '13-16'
when yearssincelastpromotion between 17 and 20 then '17-20'
when yearssincelastpromotion between 21 and 24 then '21-24'
when yearssincelastpromotion between 25 and 28 then '25-28'
when yearssincelastpromotion between 29 and 32 then '29-32'
when yearssincelastpromotion between 33 and 36 then '33-36'
else '37-40'
end as yearssincelastpromotion_bin,
count(*) as bin_count,
concat(round((count(hr_2.yearssincelastpromotion) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by yearssincelastpromotion_bin
order by bin_count desc;

# minimum years with current manager, maximum years with current manager, average years with current manager

select min(yearswithcurrmanager) as minyearswithcurrmanager, 
max(yearswithcurrmanager) as maxyearswithcurrmanager,
avg(yearswithcurrmanager) as avgyearswithcurrmanager
from hr_2;

# attrition by years with current manager

select
case
when yearswithcurrmanager between 1 and 4 then '1-4'
when yearswithcurrmanager between 5 and 8 then '5-8'
when yearswithcurrmanager between 9 and 12 then '9-12'
when yearswithcurrmanager between 13 and 16 then '13-16'
when yearswithcurrmanager between 17 and 20 then '17-20'
when yearswithcurrmanager between 21 and 24 then '21-24'
when yearswithcurrmanager between 25 and 28 then '25-28'
when yearswithcurrmanager between 29 and 32 then '29-32'
when yearswithcurrmanager between 33 and 36 then '33-36'
else '37-40'
end as yearswithcurrmanager_bin,
count(*) as bin_count,
concat(round((count(hr_2.yearswithcurrmanager) / (select count(*) from hr_1 where hr_1.attrition = 'Yes')) * 100,2),' ', '%') as percentage
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by yearswithcurrmanager_bin
order by bin_count desc;


# Average Hourly rate of Male Research Scientist

select round(avg(hourlyrate),2) as avghourlyrate
from hr_1
where gender = "Male" and jobrole = "Research Scientist";

# Average working years of all department

select hr1.department, round(avg(hr2.yearsatcompany),2) as avgworkingyearsatcompany 
from hr_1 as hr1 join hr_2 as hr2
on hr1.employeenumber = hr2.employeeid	
group by hr1.department
order by avgworkingyearsatcompany desc;

# Attrition by job role and worklife balance 

SELECT
    hr1.JobRole,
    hr2.WorkLifeBalance,
    COUNT(hr2.WorkLifeBalance) AS WLBCount,
    CONCAT(
        ROUND(
            (COUNT(hr2.WorkLifeBalance) / NULLIF(SUM(COUNT(hr2.WorkLifeBalance)) OVER (PARTITION BY hr1.JobRole), 0) * 100), 
            2
        ),
        ' ', '%'
    ) AS percentage
FROM
    hr_1 hr1
JOIN
    hr_2 hr2 ON hr1.EmployeeNumber = hr2.EmployeeID
WHERE
    hr1.attrition = 'Yes'
GROUP BY
    hr1.JobRole, hr2.WorkLifeBalance;


# attrition with 5 + years of experience and between age group of 27 to 35;

select count(*)*100/(select count(*) from hr_1 where attrition = "Yes") as percent
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" and hr_2.totalworkingyears >5 and age between 27 and 35;

# Average working years for each Department

select hr_1.department,round(avg(hr_2.YearsAtCompany),0) as avgworkingyears
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes"
group by hr_1.department;

# Fetch the details of employees having minimum and maximum salary in different department who have received less than 30 % hike

select hr_1.department, min(hr_2.MonthlyIncome) as minmonthlysalary , max(hr_2.MonthlyIncome) as maxmonthlysalary
from hr_2 
join hr_1 
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" and hr_2.PercentSalaryHike <30
group by hr_1.department;

# calculate the average monthly income of all the employee who worked more than 3 year and there education background is medical 

select *
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" and hr_1.EducationField = "Medical" and hr_2.TotalWorkingYears>3 ;


# identify the total number of male and female employees under attrition 
-- whose marital status is married and haven't received the promotion in last 2 years 

select concat(round(count(*)*100/(select count(*) from hr_1 where attrition = "Yes"),2), ' ','%') as percent
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" and hr_1.MaritalStatus = "Married" and hr_2.YearsSinceLastPromotion = 2 ;

# Employees with max performance rating but no promotion for 4 years and above 

select concat(round(count(*)*100/(select count(*) from hr_1 where attrition = "Yes"),2), ' ','%') as percent
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" and hr_1.MaritalStatus = "Married" and hr_2.YearsSinceLastPromotion = 2 ;

# who has max and min salary hike 
select max(percentsalaryhike) as maxpercentsalaryhike , min(percentsalaryhike) as minpercentsalaryhike
from hr_2;

# employees working overtime and given min salary hike and are more than 5 years with same company 

select *
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" and hr_2.OverTime = "Yes"
and hr_2.PercentSalaryHike = (select min(PercentSalaryHike) from hr_2);

select concat(round(count(*)*100/(select count(*) from hr_1 where attrition = "Yes"),2), ' ','%') as percent
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" 
and hr_2.OverTime = "Yes"
and hr_2.PercentSalaryHike = (select min(PercentSalaryHike) from hr_2)
and hr_2.YearsAtCompany > 5;

# employees working not overtime and given min salary hike and are more than 5 years with same company 

select concat(round(count(*)*100/(select count(*) from hr_1 where attrition = "Yes"),2), ' ','%') as percent
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" 
and hr_2.OverTime = "No"
and hr_2.PercentSalaryHike = (select min(PercentSalaryHike) from hr_2)
and hr_2.YearsAtCompany > 5;


# employees working overtime and given max salary hike and are more than 5 years with same company 

select concat(round(count(*)*100/(select count(*) from hr_1 where attrition = "Yes"),2), ' ','%') as percent
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" 
and hr_2.OverTime = "Yes"
and hr_2.PercentSalaryHike = (select max(PercentSalaryHike) from hr_2)
and hr_2.YearsAtCompany > 5;

# employees working not overtime and given max salary hike and are more than 5 years with same company

select concat(round(count(*)*100/(select count(*) from hr_1 where attrition = "Yes"),2), ' ','%') as percent
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "Yes" 
and hr_2.OverTime = "No"
and hr_2.PercentSalaryHike = (select max(PercentSalaryHike) from hr_2)
and hr_2.YearsAtCompany > 5;


# Identify employees with high job satisfaction who have not left the company.

select *
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "No" 
and hr_1.JobSatisfaction = (select max(JobSatisfaction) from hr_1);

# Identify employees with more than 5 years at the company who recently received promotions.


select *
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "No" 
and hr_2.YearsAtCompany > 5 
and hr_2.YearsSinceLastPromotion = (select min(YearsSinceLastPromotion) from hr_2);

# Identify employees with a high work-life balance who have not left the company.

select *
from hr_1
join hr_2
on hr_1.EmployeeNumber = hr_2.EmployeeID
where hr_1.attrition = "No" 
and hr_2.WorkLifeBalance = (select max(WorkLifeBalance) from hr_2);


