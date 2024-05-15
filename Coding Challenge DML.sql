use careerhub;

-- query to count the number of applications received for each job listing in the 
-- "Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all 
-- jobs, even if they have no applications.  

select j.jobtitle,count(a.jobID) as'Total no. of application'
from jobs j left join applications a on j.jobID=a.jobID
group by a.jobID,j.jobtitle ;


-- query that retrieves job listings from the "Jobs" table within a specified salary 
-- range. Allow parameters for the minimum and maximum salary values. Display the job title, 
-- company name, location, and salary for each matching job

select * from jobs;

select j.jobtitle,c.companyname,location,j.salary 
from jobs j inner join companies c on j.joblocation=c.location
where salary between 60000 and 90000;

-- query that retrieves the job application history for a specific applicant. Allow a 
-- parameter for the ApplicantID, and return a result set with the job titles, company names, and 
-- application dates for all the jobs the applicant has applied to
select* from applicants;

select j.jobTitle,c.companyName,a.ApplicationDate
from applications a join jobs j on a.jobID = j.jobID
join  companies c on j.companyID = c.CompanyID
where 
    a.ApplicantID = 1009;
    
--     Create an SQL query that calculates and displays the average salary offered by all companies for 
-- job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.
select* from jobs;

select avg(salary) as average_salary
from jobs
where 
    salary > 0;
    
    -- Write an SQL query to identify the company that has posted the most job listings. Display the 
-- company name along with the count of job listings they have posted. Handle ties if multiple 
-- companies have the same maximum count.

select companyName,COUNT(*) as job_count
from companies c join jobs j on c.CompanyID = j.companyID
group by companyName
having job_count = (select COUNT(*) as max_count from jobs
					group by companyID
                    order by max_count desc
                    limit 1);

-- Find the applicants who have applied for positions in companies located in 'CityX' and have at 
-- least 3 years of experience
select  * from applicants a join applications app on a.ApplicantID = app.ApplicantID
join jobs j on app.jobID = j.jobID
join companies c on j.companyID = c.CompanyID
where c.location = 'Mumbai' and coverletter like '%years%';

-- Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.
select distinct jobTitle
from jobs
where salary between 60000 and 80000;

-- Find the jobs that have not received any applications.
select j.*from jobs j left join applications a on j.jobID = a.jobID
where a.ApplicationID IS NULL;

-- Retrieve a list of job applicants along with the companies they have applied to and the positions 
-- they have applied for
select a.firstname,a.lastname,c.companyName as 'Company applied',j.jobTitle as 'applied job'
from applicants a
join applications app on a.ApplicantID = app.ApplicantID
join jobs j on app.jobID = j.jobID
join companies c on j.companyID = c.CompanyID;

-- Retrieve a list of companies along with the count of jobs they have posted, even if they have not 
-- received any applications
select c.companyName,COUNT(j.jobID) as job_count
from companies c left join jobs j on c.CompanyID = j.companyID
group by 
    c.companyName;
    
    -- List all applicants along with the companies and positions they have applied for, including those 
-- who have not applied.
select a.firstname,a.lastname,c.companyName,j.jobTitle
from applicants a left join  applications app on a.ApplicantID = app.ApplicantID
left join jobs j on app.jobID = j.jobID
left join companies c on j.companyID = c.CompanyID;

-- Find companies that have posted jobs with a salary higher than the average salary of all jobs.
select c.companyName 
from companies c join jobs j on c.CompanyID = j.companyID
where j.salary > (select avg(salary) from jobs);

-- Display a list of applicants with their names and a concatenated string of their city and state.
select* from applicants;
select Concat(firstname, ' ', lastname)as FullName,concat(city,',',State) as location
from applicants;

-- Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'
select * from jobs
where jobTitle like '%Developer%' OR jobTitle like '%Engineer%';

-- Retrieve a list of applicants and the jobs they have applied for, including those who have not 
-- applied and jobs without applicants
select a.firstname,a.lastname,c.companyName, j.jobTitle
from applicants a left join  applications app on a.ApplicantID = app.ApplicantID
left join jobs j on app.jobID = j.jobID
left join companies c on j.companyID = c.CompanyID;

-- List all combinations of applicants and companies where the company is in a specific city and the 
-- applicant has more than 2 years of experience. For example: city=Chennai
select a.firstname,a.lastname,c.companyName,c.location
from applicants a join applications app on a.ApplicantID = app.ApplicantID
join jobs j on app.jobID = j.jobID
join companies c on j.companyID = c.CompanyID
where 
    c.location = 'hyderabad' and coverletter like '%years%';
    











    





    
    



