use Academiadb
GO
CREATE TABLE admins (
    admin_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    birthdate DATE
);
INSERT INTO admins (full_name, email, username, password, birthdate)
VALUES ('Usama Mohammed', 'usama@example.com', 'usama', '1234', '1990-01-01'),
('Hossam Omar', 'hossam@example.com', 'hossam', '1234', '1990-01-01'),
('Ahmed Shaaban', 'ahmed@example.com', 'ahmed', '1234', '1990-01-01'),
('Khaled Tarek', 'khaled@example.com', 'khaled', '1234', '1985-05-15');
CREATE TABLE parents (
    parent_id INT IDENTITY(1,1) PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    relation VARCHAR(255)
);
CREATE TABLE classrooms (
    classroom_id INT IDENTITY(1,1) PRIMARY KEY,
    classroom_name VARCHAR(255) NOT NULL,
    capacity int NOT NULL,
    location VARCHAR(255) NOT NULL
);
INSERT INTO classrooms (classroom_name, capacity, location) VALUES
('Room A', 30, 'Building 1, Floor 1'),
('Room B', 25, 'Building 1, Floor 2'),
('Room C', 35, 'Building 2, Floor 1'),
('Room D', 40, 'Building 2, Floor 2');
CREATE TABLE departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);
INSERT INTO departments (department_name)
VALUES 
    ('Chemical Engineering'),
    ('Computer Engineering'),
    ('Electronics & Communication Engineering'),
    ('Power Machines Engineering'),
    ('Mechanical Engineering'),
    ('Civil Engineering');

CREATE TABLE payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    payment_amount VARCHAR(255) NOT NULL,
    payment_date VARCHAR(255) NOT NULL,
    student_firstname VARCHAR(255) NOT NULL,
    student_lastname VARCHAR(255) NOT NULL,
	student_id int
);

CREATE TABLE courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    department_id int NOT NULL,
    classroom_id int NOT NULL,
	CONSTRAINT classroom_id
    FOREIGN KEY (classroom_id)
    REFERENCES classrooms(classroom_id),
	
	CONSTRAINT department_id
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);
INSERT INTO courses (course_name, description, department_id, classroom_id) VALUES
('Introduction to Programming', 'Basic programming concepts and techniques.', 1, 1),
('Database Management', 'Managing and querying databases using SQL.', 2, 2),
('Computer Networks', 'Understanding network architectures and protocols.', 3, 3),
('Software Engineering', 'Software development methodologies and practices.', 1, 4);

CREATE TABLE professors (
    professors_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name varchar(20),
	last_name varchar(20),
    department_id int NOT NULL,
    course_id int NOT NULL,
	
	CONSTRAINT coursee_id
	FOREIGN KEY (course_id)
    REFERENCES courses(course_id),
	
	CONSTRAINT departmentt_id
	FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);
INSERT INTO professors (first_name, last_name, department_id, course_id)
VALUES ('John', 'Doe', 1, 1),
       ('Jane', 'Smith', 2, 2),
       ('Alice', 'Johnson', 3, 3),
       ('Bob', 'Williams', 1, 4),
       ('Charlie', 'Brown', 2,2 ),
       ('David', 'Lee', 3, 3);

CREATE TABLE students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    department_id INT NOT NULL,
    course_id INT NOT NULL,
    parent_id INT NOT NULL,
    birthdate DATE,
    gender VARCHAR(10),
    
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (parent_id) REFERENCES parents(parent_id)
);
INSERT INTO students (first_name, last_name, department_id, course_id, parent_id, birthdate, gender)
VALUES 
    ('John', 'Doe', 1, 3, 1, '2000-01-01', 'M'),
    ('Jane', 'Smith', 2, 3, 2, '2001-02-15', 'F'),
    ('Alice', 'Johnson', 2, 3, 2, '1999-05-20', 'F'),
    ('Bob', 'Brown', 1, 3, 2, '2002-03-10', 'M'),
    ('Eve', 'White', 2, 3, 2, '1998-06-25', 'F'),
    ('Charlie', 'Green', 3,3, 1, '2003-09-05', 'M');
INSERT INTO parents (fname, lname, phone, email, relation)
VALUES
    ('John', 'Doe', '123-456-7890', 'john.doe@example.com', 'Father'),
    ('Jane', 'Smith', '456-789-0123', 'jane.smith@example.com', 'Mother'),
    ('Alice', 'Johnson', '789-012-3456', 'alice.johnson@example.com', 'Guardian'),
    ('Bob', 'Brown', '012-345-6789', 'bob.brown@example.com', 'Father'),
    ('Eve', 'White', '345-678-9012', 'eve.white@example.com', 'Mother'),
    ('Charlie', 'Green', '678-901-2345', 'charlie.green@example.com', 'Guardian');