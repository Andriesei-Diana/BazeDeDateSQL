
# Task 1: Creating the "SighisoaraCamp" Database
CREATE DATABASE SighisoaraCamp;
USE SighisoaraCamp;

# Task 2: Creating the "CampLocations" Table
CREATE TABLE CampLocations (
    camp_location_id INT PRIMARY KEY,
    location_name VARCHAR(255)
);

# Task 3: Creating the "Students" Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_year INT,
    class VARCHAR(50),
    chosen_camp_location INT,
    FOREIGN KEY (chosen_camp_location) REFERENCES CampLocations(camp_location_id)
);

# Task 4: Creating the "SpecialMenus" Table
CREATE TABLE SpecialMenus (
    special_menu_id INT PRIMARY KEY,
    menu_name VARCHAR(255)
);

# Task 5: Creating the "SighisoaraCampParticipants" Table
CREATE TABLE SighisoaraCampParticipants (
    participant_id INT PRIMARY KEY,
    student_id INT,
    camp_location_id INT,
    special_menu BOOLEAN,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (camp_location_id) REFERENCES CampLocations(camp_location_id)
);

# Task 6: Inserting Values into the "CampLocations" Table
INSERT INTO CampLocations (camp_location_id, location_name)
VALUES
    (1, "Sighisoara"),
    (2, "Transfagarasan"),
    (3, "Castelul Bran");
    
# Task 7: Inserting Values into the "Students" Table
INSERT INTO Students (student_id, first_name, last_name, birth_year, class, chosen_camp_location)
VALUES
    (1, "Sandu", "Ion", 2005, "Grade 10", "1"),
    (2, "Damian", "Gabriel", 2006, "Grade 11", "3"),
    (3, "Mihalache", "Stefan", 2005, "Grade 10", "1"),
    (4, "Dascalu", "Eduard", 2005, "Grade 10", "3"),
    (5, "Adascalitei", "Elena", 2006, "Grade 11", "1"),
    (6, "Tudose", "Cosmin", 2010, "Grade 7", "1"),
    (7, "Burlacu", "Ionela", 2010, "Grade 7", "1"),
    (8, "Lungu", "Catalin", 2006, "Grade 11", "1"),
    (9, "Draghia", "Zora", 2010, "Grade 6", "1"),
    (10, "Andronic", "Ioana", 2010, "Grade 6", "3"),
    (11, "Andrei", "Cosmin", 2009, "Grade 7", "1"),
    (12, "Damian", "Ilinca", 2010, "Grade 6", "1"),
    (13, "Lavric", "Fabiana", 2006, "Grade 11", "2"),
    (14, "Mihalache", "Stefan", 2005, "Grade 10", "2"),
	(15, "Draghia", "Zora", 2010, "Grade 6", "2");
    
SELECT * FROM students;  
    
# Task 8: Inserting Values into the "SpecialMenus" Table
INSERT INTO SpecialMenus (special_menu_id, menu_name)
VALUES
    (1, "Vegetarian Menu"),
    (2, "Gluten-Free Menu"),
    (3, "Dairy-Free Menu");
    
# Task 9: Inserting Values into the "SighisoaraCampParticipants" Table
INSERT INTO SighisoaraCampParticipants (participant_id, student_id, camp_location_id, special_menu)
VALUES
    (1, 1, 1, TRUE),
    (2, 2, 3, FALSE),
    (3, 3, 1, FALSE),
    (4, 4, 3, TRUE),
    (5, 5, 1, TRUE),
    (6, 6, 1, FALSE),
    (7, 7, 1, TRUE),
    (8, 8, 1, FALSE),
    (9, 9, 1, TRUE),
    (10, 10, 3, FALSE),
    (11, 11, 1, TRUE),
    (12, 12, 1, TRUE),
    (13, 13, 2, FALSE),
    (14, 14, 2, TRUE),
    (15, 15, 2, FALSE);
    
# Task 10: Updating the Year of Birth for a Student with ID 2
UPDATE Students
SET birth_year = 2007
WHERE student_id = 6;

# Task 11: Updating the Special Menu for a Participant with ID 1
UPDATE SighisoaraCampParticipants
SET special_menu = FALSE
WHERE participant_id = 11;

# Task 12: Display of All Students Who Go to the Camp in Sighisoara
SELECT * FROM Students;

# Task 13: Display of Students Who Have a Special Menu at the Camp in Sighisoara
SELECT s.first_name, s.last_name, m.menu_name
FROM Students s
JOIN SighisoaraCampParticipants sp ON s.student_id = sp.student_id
JOIN SpecialMenus m ON sp.special_menu = TRUE
WHERE sp.student_id = s.student_id;



# Task 14: Deleting a Student from the "Students" Table and All Associated Data
# -- First, delete associated participants
DELETE FROM SighisoaraCampParticipants
WHERE student_id = 2;

# -- Then, delete the student
DELETE FROM Students
WHERE student_id = 2;









