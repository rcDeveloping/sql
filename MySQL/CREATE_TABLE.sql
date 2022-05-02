# Set database to use
USE db_school;

# Create Students table
CREATE TABLE IF NOT EXISTS Students(
	StudentKey INT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    EmailAddress VARCHAR(100),
    Address VARCHAR(255)
);

# Create Courses table
CREATE TABLE IF NOT EXISTS Courses(
	CourseKey INT,
    CourseTitle VARCHAR(100),
    UnitPrice DECIMAL(10, 2)
);

# Create Enrollment table
CREATE TABLE IF NOT EXISTS Enrollment(
	EnrollmentKey INT,
    StudentKey INT,
    CourseKey INT,
    RegistrationDate DATE
);

# Show all the created tables
SHOW TABLES;