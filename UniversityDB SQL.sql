CREATE TABLE [user] (
  [id] int PRIMARY KEY NOT NULL,
  [first_name] nvarchar(255),
  [last_name] nvarchar(255),
  [private_number] nvarchar(255),
  [email] nvarchar(255),
  [address] nvarchar(255),
  [birthday] date,
  [gender] nvarchar(255),
  [secondary_address] nvarchar(255),
  [home_number] nvarchar(255)
)
GO

CREATE TABLE [lecturer] (
  [id] int PRIMARY KEY NOT NULL,
  [account_number] nvarchar(255),
  [rank] nvarchar(255),
  [user_id] int UNIQUE
)
GO

CREATE TABLE [student] (
  [id] int PRIMARY KEY NOT NULL,
  [user_id] int UNIQUE
)
GO

CREATE TABLE [manager] (
  [id] int PRIMARY KEY NOT NULL,
  [user_id] int UNIQUE
)
GO

CREATE TABLE [faculty] (
  [id] int PRIMARY KEY NOT NULL,
  [name] nvarchar(255)
)
GO

CREATE TABLE [class] (
  [id] int PRIMARY KEY NOT NULL,
  [name] nvarchar(255),
  [course_id] int,
  [lecturer_id] int
)
GO

CREATE TABLE [course] (
  [id] int PRIMARY KEY NOT NULL,
  [name] nvarchar(255),
  [faculty_id] int
)
GO

CREATE TABLE [class_student] (
  [id] int PRIMARY KEY NOT NULL,
  [student_id] int,
  [class_id] int
)
GO

CREATE TABLE [class_schedule] (
  [id] int PRIMARY KEY NOT NULL,
  [date] datetime,
  [class_id] int
)
GO

CREATE TABLE [student_class_schedule] (
  [id] int PRIMARY KEY NOT NULL,
  [student_id] int,
  [class_schedule_id] int
)
GO

ALTER TABLE [user] ADD FOREIGN KEY ([id]) REFERENCES [lecturer] ([user_id])
GO

ALTER TABLE [user] ADD FOREIGN KEY ([id]) REFERENCES [student] ([user_id])
GO

ALTER TABLE [user] ADD FOREIGN KEY ([id]) REFERENCES [manager] ([user_id])
GO

ALTER TABLE [class] ADD FOREIGN KEY ([lecturer_id]) REFERENCES [lecturer] ([id])
GO

ALTER TABLE [class] ADD FOREIGN KEY ([course_id]) REFERENCES [course] ([id])
GO

ALTER TABLE [course] ADD FOREIGN KEY ([faculty_id]) REFERENCES [faculty] ([id])
GO

ALTER TABLE [student] ADD FOREIGN KEY ([id]) REFERENCES [class_student] ([student_id])
GO

ALTER TABLE [class] ADD FOREIGN KEY ([id]) REFERENCES [class_student] ([class_id])
GO

ALTER TABLE [class_schedule] ADD FOREIGN KEY ([class_id]) REFERENCES [class] ([id])
GO

ALTER TABLE [student] ADD FOREIGN KEY ([id]) REFERENCES [student_class_schedule] ([student_id])
GO

ALTER TABLE [class] ADD FOREIGN KEY ([id]) REFERENCES [student_class_schedule] ([class_schedule_id])
GO
