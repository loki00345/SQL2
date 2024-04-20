use Academy

alter table Departments
add FacultyID int
alter table Groups
add DepartmentID int

create table GroupsLectures
(
Id int primary key identity(0, 1) not null,
GroupID int not null,
LectureID int not null
)
create table Lectures
(
Id int primary key identity(0, 1) not null,
DayOfWeek int not null check(DayOfWeek between 1 and 7),
LectureRoom nvarchar(max) not null check(LectureRoom != ''),
SubjectID int not null,
TeacherID int not null
)
create table Subjects
(
Id int primary key identity(0, 1) not null,
Name nvarchar(100) not null check(Name != '') unique
)

select count(t.Id) as [Teachers] from Teachers as t, Lectures as l, GroupsLectures as gl, Groups as g, Departments as d where l.TeacherID = t.Id and l.Id = gl.LectureID and g.Id = gl.GroupID and d.Id = g.DepartmentID and d.Name = 'Shakespeare'

select count(l.Id) as [Lectures] from Lectures as l, Teachers as t where l.TeacherID = t.Id and t.Name = 'Jordon'

select count(s.Id) as [Amount] from Lectures as l, Subjects as s where s.Id = l.SubjectID and l.LectureRoom = 'Wikizz'

select l.LectureRoom, count(s.Id) as [Subjects in there] from Lectures as l, Subjects as s where s.Id = l.SubjectID group by l.LectureRoom

select avg(t.Salary) as [Avarage salary] from Teachers as t, Lectures as l, GroupsLectures as gl, Groups as g, Departments as d, Faculties as f where l.TeacherID = t.Id and l.Id = gl.LectureID and g.Id = gl.GroupID and d.Id = g.DepartmentID and d.FacultyID = f.Id and f.Name = 'Sportenine'

select avg(d.Financing) as [Avarage financing] from Departments as d
select t.Name + t.Surname as [Name], count(t.Id) as [Lectures] from Teachers as t, Lectures as l where t.Id = l.TeacherID group by t.Name, t.Surname

select l.DayOfWeek as [Day], count(l.DayOfWeek) from Lectures as l group by DayOfWeek

select l.LectureRoom, count(l.Id) as [Read in] from Lectures as l, GroupsLectures as gl, Groups as g, Departments as d where l.Id = gl.LectureID and g.Id = gl.GroupID and d.Id = g.DepartmentID group by l.LectureRoom

select f.Name, count(s.Id) as [Amount of subjects] from Subjects as s, Lectures as l, GroupsLectures as gl, Groups as g, Departments as d, Faculties as f where d.FacultyID = f.Id and d.Id = g.DepartmentID and g.Id = gl.GroupID and l.Id = gl.LectureID and L.SubjectID = s.Id group by f.Name

select t.Name + ' ' + t.Surname as [Name], l.LectureRoom, count(t.Id) as [Amount] from Teachers as t, Lectures as l where t.Id = l.TeacherID group by t.Name, t.Surname, l.LectureRoom