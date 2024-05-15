drop database if exists careerhub;

create database careerhub;

use careerhub;

drop table if exists companies;

create table companies
(
CompanyID int primary key auto_increment ,
companyName varchar(50) not null,
location varchar(50)
);

desc companies;



drop table if exists jobs;

create table jobs
(
jobID int primary key ,
companyID int  not null,
jobTitle varchar(50),
jobdescription text,
joblocation varchar(50),
salary numeric(10,2),
jobtype enum('fullTime','partTime','Contract'),
postedDate date,
foreign key(CompanyID) references companies(CompanyID) on delete cascade
);

desc jobs;

drop table if exists applicants;

create table applicants(
ApplicantID int primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
email varchar(50) ,
phone varchar(10),
resumefile  varchar(255));

desc applicants;

drop table if exists applications;

create table applications
(
ApplicationID int primary key,
jobID int,
ApplicantID int,
ApplicationDate date,
CoverLetter text,
foreign key (jobID) references jobs(jobID) on delete cascade,
foreign key (ApplicantID) references applicants(ApplicantID) on delete cascade

);

desc applications;

INSERT INTO companies (companyName, location) VALUES
('Alphabet Corporation', 'Mumbai'),
('Zenith Solutions', 'Bangalore'),
('Tech Innovators', 'Hyderabad'),
('Global Tech', 'Chennai'),
('Future Enterprises', 'Delhi'),
('Sunrise IT Services', 'Pune'),
('Infinity Systems', 'Kolkata'),
('Peak Performance', 'Mumbai'),
('Digital Dynamics', 'Jaipur'),
('Smart Solutions', 'Lucknow'),
('Pacific Software', 'Hyderabad'),
('Dynamic Developers', 'Banglore'),
('Metro Enterprises', 'Mysore'),
('Skyline Solutions', 'Coimbatore'),
('Prime Innovations', 'Chennai');

select* from companies;

INSERT INTO jobs (jobID, companyID, jobTitle, jobdescription, joblocation, salary, jobtype, postedDate) VALUES
(201, 1, 'Software Engineer', 'Developing software applications using Java and Spring framework.', 'Mumbai', 80000.00, 'fullTime', '2023-11-01'),
(202, 1, 'Data Analyst', 'Analyze large datasets using SQL and Python to provide insights for business decisions.', 'Mumbai', 60000.00, 'fullTime', '2024-01-15'),
(203, 3, 'Project Manager', 'Lead and manage software development projects ensuring timely delivery and quality.', 'Hyderabad', 130000.00, 'fullTime', '2024-02-10'),
(204, 4, 'Marketing Executive', 'Develop and implement marketing strategies to promote products and services.', 'Chennai', 70000.00, 'fullTime', '2024-02-25'),
(205, 5, 'HR Specialist', 'Manage recruitment, onboarding, and employee relations processes within the organization.', 'Delhi', 75000.00, 'fullTime', '2024-03-05'),
(206, 6, 'Customer Support Representative', 'Provide assistance and support to customers regarding product inquiries and issues.', 'Pune', 55000.00, 'fullTime', '2024-03-15'),
(207, 7, 'Graphic Designer', 'Create visually appealing graphics and designs for marketing materials and websites.', 'Kolkata', 65000.00, 'fullTime', '2024-03-20'),
(208, 8, 'Accountant', 'Manage financial transactions, prepare reports, and ensure compliance with accounting standards.', 'Mumbai', 70000.00, 'fullTime', '2024-03-25'),
(209, 9, 'Web Developer', 'Design and develop responsive websites using HTML, CSS, and JavaScript.', 'Jaipur', 80000.00, 'fullTime', '2024-04-05'),
(210, 10, 'Sales Manager', 'Lead sales team, develop sales strategies, and achieve sales targets.', 'Lucknow', 90000.00, 'fullTime', '2024-04-10'),
(211, 9, 'Web developer', 'Design and develop responsive websites using HTML, CSS, and JavaScript', 'Jaipur', 60000.00, 'fullTime', '2024-04-15'),
(212, 8, 'Network Engineer', 'Plan, implement, and maintain network infrastructure ensuring connectivity and security.', 'Mumbai', 85000.00, 'fullTime', '2024-04-20'),
(213, 13, 'UI/UX Designer', 'Design user interfaces and experiences for web and mobile applications.', 'Mysore', 75000.00, 'fullTime', '2024-04-25'),
(214, 14, 'Business Analyst', 'Analyze business requirements and translate them into functional specifications for IT projects.', 'Coimbatore', 85000.00, 'fullTime', '2024-04-28'),
(215, 15, 'Software Tester', 'Perform testing activities to ensure the quality and reliability of software applications.', 'chennai', 60000.00, 'fullTime', '2024-05-01');

select* from jobs;

INSERT INTO applicants (ApplicantID, firstname, lastname, email, phone, resumefile) VALUES
(1001, 'Aravind', 'Kumar', 'aravind.kumar@gmail.com', '9876543210', 'https://example.com/resume1.pdf'),
(1002, 'Mani', 'Subramanian', 'mani.subramanian@gmail.com', '8765432109', 'https://example.com/resume2.pdf'),
(1003, 'Saravanan', 'Raj', 'saravanan.raj@gmail.com', '7654321098', 'https://example.com/resume3.pdf'),
(1004, 'Priya', 'Senthil', 'priya.senthil@gmail.com', '6543210987', 'https://example.com/resume4.pdf'),
(1005, 'Deepika', 'Karthik', 'deepika.karthik@gmail.com', '8432109876', 'https://example.com/resume5.pdf'),
(1006, 'Karthik', 'Subburaj', 'karthik.srinivasan@gmail.com', '9321098765', 'https://example.com/resume6.pdf'),
(1007, 'Nandhini', 'Rajendran', 'nandhini.rajendran@gmail.com', '7210987654', 'https://example.com/resume7.pdf'),
(1008, 'Rajesh', 'Venkatesan', 'rajesh.venkatesan@gmail.com', '9109876543', 'https://example.com/resume8.pdf'),
(1009, 'Sangeetha', 'Gopal', 'sangeetha.gopal@gmail.com', '7098765432', 'https://example.com/resume9.pdf'),
(1010, 'Gowtham', 'Narayanan', 'gowtham.narayanan@gmail.com', '9876543211', 'https://example.com/resume10.pdf'),
(1011, 'Saranya', 'Suresh', 'saranya.suresh@gmail.com', '8765432101', 'https://example.com/resume11.pdf'),
(1012, 'Vignesh', 'Kumar', 'vignesh.kumar@gmail.com', '7654321090', 'https://example.com/resume12.pdf'),
(1013, 'Meenakshi', 'Ravi', 'meenakshi.ravi@gmail.com', '6543210989', 'https://example.com/resume13.pdf'),
(1014, 'Balaji', 'Senthil', 'balaji.senthil@gmail.com', '9432109878', 'https://example.com/resume14.pdf'),
(1015, 'Deepa', 'Ramesh', 'deepa.ramesh@gmail.com', '8321098767', 'https://example.com/resume15.pdf');

select* from applicants;
INSERT INTO applications (ApplicationID, jobID, ApplicantID, ApplicationDate, CoverLetter) VALUES
(5001, 201, 1001, '2023-11-10', 'I have 5 years of experience in software engineering.'),
(5002, 202, 1002, '2024-02-02', 'I have 2 years of expertise in data analysis and visualization.'),
(5003, 206, NULL, NULL, NUll),
(5004, 204, 1003, '2024-03-02', 'I am skilled in marketing strategies and have a proven track record of increasing sales.'),
(5005, 205, 1004, '2024-03-15', 'I have 7 years experience in HR processes and employee relations.'),
(5006, 215, NULL, NUll, NUll),
(5007, 207, 1005, '2024-03-27', 'I have a strong portfolio in graphic design and have worked on various marketing campaigns.'),
(5008, NUll, 1011, Null, NULL),
(5009, 209, 1006, '2024-04-09', 'I have developed numerous websites with responsive designs.'),
(5010, 210, 1007, '2024-04-10', 'I have a proven track record in achieving sales targets and leading sales teams.'),
(5011, NULL, 1013, null, null),
(5012, 212, 1008, '2024-04-22', 'I have managed network infrastructure for large organizations.'),
(5013, 213, 1009, '2024-04-28', 'I specialize in UI/UX design and have created intuitive interfaces.'),
(5014, 201, 1010, '2023-11-12', 'I have 3 years of experience in software engineering.'),
(5015, 209, 1011, '2024-04-11', 'I have extensive 2 years experience in developing websites');

select* from applications;

ALTER TABLE applicants
ADD COLUMN city VARCHAR(50),
ADD COLUMN state VARCHAR(50);


UPDATE applicants
SET city = CASE
    WHEN ApplicantID = 1001 THEN 'Chennai'
    WHEN ApplicantID = 1002 THEN 'trichy'
    WHEN ApplicantID = 1003 THEN 'SAlem'
    WHEN ApplicantID = 1004 THEN 'Dindugal'
    WHEN ApplicantID = 1005 THEN 'Tiruppur'
    WHEN ApplicantID = 1006 THEN 'Shimoga'
    WHEN ApplicantID = 1007 THEN 'bougai park'
    WHEN ApplicantID = 1008 THEN 'gokarna'
    WHEN ApplicantID = 1009 THEN 'mysuru'
    WHEN ApplicantID = 1010 THEN 'Dharwad'
    WHEN ApplicantID = 1011 THEN 'Nellore'
    WHEN ApplicantID = 1012 THEN 'Hyderabad'
    WHEN ApplicantID = 1013 THEN 'Guntur'
    WHEN ApplicantID = 1014 THEN 'kadappa'
    WHEN ApplicantID = 1015 THEN 'putur'
END,
state = CASE
    WHEN ApplicantID BETWEEN 1001 AND 1005 THEN 'Tamil Nadu'
    WHEN ApplicantID BETWEEN 1006 AND 1010 THEN 'Karnataka'
    ELSE 'ANDHRA Pradesh'
END
WHERE ApplicantID BETWEEN 1001 AND 1015;

select* from applicants;





