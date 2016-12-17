
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/16/2016 01:24:48
-- Generated from EDMX file: F:\DotNET\IMCS ASSIGNMENTS\UsingModelFirst\UsingModelFirst\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [UniversityERDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentId] int IDENTITY(1,1) NOT NULL,
    [StudentName] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL,
    [Age] nvarchar(max)  NOT NULL,
    [DoB] nvarchar(max)  NOT NULL,
    [DepartmentId] nvarchar(max)  NOT NULL,
    [Department_DepartmentId] int  NOT NULL
);
GO

-- Creating table 'Instructors'
CREATE TABLE [dbo].[Instructors] (
    [InstructorId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL,
    [DepartmentId] nvarchar(max)  NOT NULL,
    [Department_DepartmentId] int  NOT NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [DepartmentId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [HeadofDepartment] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [CourseId] int IDENTITY(1,1) NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [CourseDepartment] nvarchar(max)  NOT NULL,
    [DepartmentId] nvarchar(max)  NOT NULL,
    [Department_DepartmentId] int  NOT NULL
);
GO

-- Creating table 'InstructorCourse'
CREATE TABLE [dbo].[InstructorCourse] (
    [Instructors_InstructorId] int  NOT NULL,
    [Courses_CourseId] int  NOT NULL
);
GO

-- Creating table 'InstructorStudent'
CREATE TABLE [dbo].[InstructorStudent] (
    [Instructors_InstructorId] int  NOT NULL,
    [Students_StudentId] int  NOT NULL
);
GO

-- Creating table 'CourseStudent'
CREATE TABLE [dbo].[CourseStudent] (
    [Courses_CourseId] int  NOT NULL,
    [Students_StudentId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StudentId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentId] ASC);
GO

-- Creating primary key on [InstructorId] in table 'Instructors'
ALTER TABLE [dbo].[Instructors]
ADD CONSTRAINT [PK_Instructors]
    PRIMARY KEY CLUSTERED ([InstructorId] ASC);
GO

-- Creating primary key on [DepartmentId] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([DepartmentId] ASC);
GO

-- Creating primary key on [CourseId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([CourseId] ASC);
GO

-- Creating primary key on [Instructors_InstructorId], [Courses_CourseId] in table 'InstructorCourse'
ALTER TABLE [dbo].[InstructorCourse]
ADD CONSTRAINT [PK_InstructorCourse]
    PRIMARY KEY CLUSTERED ([Instructors_InstructorId], [Courses_CourseId] ASC);
GO

-- Creating primary key on [Instructors_InstructorId], [Students_StudentId] in table 'InstructorStudent'
ALTER TABLE [dbo].[InstructorStudent]
ADD CONSTRAINT [PK_InstructorStudent]
    PRIMARY KEY CLUSTERED ([Instructors_InstructorId], [Students_StudentId] ASC);
GO

-- Creating primary key on [Courses_CourseId], [Students_StudentId] in table 'CourseStudent'
ALTER TABLE [dbo].[CourseStudent]
ADD CONSTRAINT [PK_CourseStudent]
    PRIMARY KEY CLUSTERED ([Courses_CourseId], [Students_StudentId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Department_DepartmentId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_DepartmentStudent]
    FOREIGN KEY ([Department_DepartmentId])
    REFERENCES [dbo].[Departments]
        ([DepartmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentStudent'
CREATE INDEX [IX_FK_DepartmentStudent]
ON [dbo].[Students]
    ([Department_DepartmentId]);
GO

-- Creating foreign key on [Department_DepartmentId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_DepartmentCourse]
    FOREIGN KEY ([Department_DepartmentId])
    REFERENCES [dbo].[Departments]
        ([DepartmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentCourse'
CREATE INDEX [IX_FK_DepartmentCourse]
ON [dbo].[Courses]
    ([Department_DepartmentId]);
GO

-- Creating foreign key on [Department_DepartmentId] in table 'Instructors'
ALTER TABLE [dbo].[Instructors]
ADD CONSTRAINT [FK_DepartmentInstructor]
    FOREIGN KEY ([Department_DepartmentId])
    REFERENCES [dbo].[Departments]
        ([DepartmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentInstructor'
CREATE INDEX [IX_FK_DepartmentInstructor]
ON [dbo].[Instructors]
    ([Department_DepartmentId]);
GO

-- Creating foreign key on [Instructors_InstructorId] in table 'InstructorCourse'
ALTER TABLE [dbo].[InstructorCourse]
ADD CONSTRAINT [FK_InstructorCourse_Instructor]
    FOREIGN KEY ([Instructors_InstructorId])
    REFERENCES [dbo].[Instructors]
        ([InstructorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Courses_CourseId] in table 'InstructorCourse'
ALTER TABLE [dbo].[InstructorCourse]
ADD CONSTRAINT [FK_InstructorCourse_Course]
    FOREIGN KEY ([Courses_CourseId])
    REFERENCES [dbo].[Courses]
        ([CourseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InstructorCourse_Course'
CREATE INDEX [IX_FK_InstructorCourse_Course]
ON [dbo].[InstructorCourse]
    ([Courses_CourseId]);
GO

-- Creating foreign key on [Instructors_InstructorId] in table 'InstructorStudent'
ALTER TABLE [dbo].[InstructorStudent]
ADD CONSTRAINT [FK_InstructorStudent_Instructor]
    FOREIGN KEY ([Instructors_InstructorId])
    REFERENCES [dbo].[Instructors]
        ([InstructorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Students_StudentId] in table 'InstructorStudent'
ALTER TABLE [dbo].[InstructorStudent]
ADD CONSTRAINT [FK_InstructorStudent_Student]
    FOREIGN KEY ([Students_StudentId])
    REFERENCES [dbo].[Students]
        ([StudentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InstructorStudent_Student'
CREATE INDEX [IX_FK_InstructorStudent_Student]
ON [dbo].[InstructorStudent]
    ([Students_StudentId]);
GO

-- Creating foreign key on [Courses_CourseId] in table 'CourseStudent'
ALTER TABLE [dbo].[CourseStudent]
ADD CONSTRAINT [FK_CourseStudent_Course]
    FOREIGN KEY ([Courses_CourseId])
    REFERENCES [dbo].[Courses]
        ([CourseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Students_StudentId] in table 'CourseStudent'
ALTER TABLE [dbo].[CourseStudent]
ADD CONSTRAINT [FK_CourseStudent_Student]
    FOREIGN KEY ([Students_StudentId])
    REFERENCES [dbo].[Students]
        ([StudentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseStudent_Student'
CREATE INDEX [IX_FK_CourseStudent_Student]
ON [dbo].[CourseStudent]
    ([Students_StudentId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------