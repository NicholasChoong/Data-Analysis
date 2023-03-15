Use master
Go

PRINT '';
PRINT '*** Dropping Database';
GO

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'JobPostsDW')
DROP DATABASE JobPostsDW;
GO

PRINT '';
PRINT '*** Creating Database';
GO

Create database JobPostsDW
Go

Use JobPostsDW
Go

PRINT '';
PRINT '*** Creating Table DimLocation';
GO

Create table DimLocation
(
LocationKey int primary key identity,
City varchar(50) not null,
State varchar(50),
Geo varchar(10) not null
)
Go

PRINT '';
PRINT '*** Creating Table DimDate';
GO

Create table DimDate
(
DateKey int primary key identity,
Date date not null,
DayOfWeek varchar(10) not null,
Day int not null,
Week int not null,
Month int not null,
Quarter int not null,
Year int not null
)
Go

PRINT '';
PRINT '*** Creating Table DimJob';
GO

Create table DimJob
(
JobKey int primary key identity,
Category varchar(50) not null,
JobTitle varchar(100) not null
)
Go

PRINT '';
PRINT '*** Creating Table DimCompany';
GO

Create table DimCompany
(
CompanyKey int primary key identity,
CompanyName varchar(100) not null
)
Go

PRINT '';
PRINT '*** Creating Table DimBoard';
GO

Create table DimBoard
(
BoardKey int primary key identity,
BoardName varchar(10) not null
)
Go

PRINT '';
PRINT '*** Creating Table DimJobType';
GO

Create table DimJobType
(
JobTypeKey int primary key identity,
JobType varchar(20) not null
)
Go

PRINT '';
PRINT '*** Creating Table FactJobPosts';
GO

Create Table FactJobPosts
(
JobPostsKey bigint primary key identity,
DateKey int not null,
LocationKey int not null,
JobKey int not null,
CompanyKey int not null,
JobTypeKey int not null,
BoardKey int not null,
JobDescription text,
Url varchar(50) not null,
Count int not null,
Salary money,
Hour int not null,
Minute int not null,
Second int not null
)
Go

PRINT '';
PRINT '*** Add relation between fact table foreign keys to Primary keys of Dimensions';
GO

AlTER TABLE FactJobPosts ADD CONSTRAINT 
FK_DateKey FOREIGN KEY (DateKey)REFERENCES DimDate(DateKey);
AlTER TABLE FactJobPosts ADD CONSTRAINT 
FK_JobKey FOREIGN KEY (JobKey)REFERENCES DimJob(JobKey);
AlTER TABLE FactJobPosts ADD CONSTRAINT 
FK_JobTypeKey FOREIGN KEY (JobTypeKey)REFERENCES DimJobType(JobTypeKey);
AlTER TABLE FactJobPosts ADD CONSTRAINT 
FK_LocationKey FOREIGN KEY (LocationKey)REFERENCES DimLocation(LocationKey);
AlTER TABLE FactJobPosts ADD CONSTRAINT 
FK_CompanyKey FOREIGN KEY (CompanyKey)REFERENCES DimCompany(CompanyKey);
AlTER TABLE FactJobPosts ADD CONSTRAINT 
FK_BoardKey FOREIGN KEY (BoardKey)REFERENCES DimBoard(BoardKey);
Go


