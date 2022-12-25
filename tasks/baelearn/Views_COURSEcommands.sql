CREATE TABLE StudentInfo (
    SID INTEGER(7) PRIMARY KEY,
    S_Name VARCHAR(30),
    GPA FLOAT(3, 2),
    Major VARCHAR(30)
);
CREATE TABLE Faculty (
    FID INTEGER(7) PRIMARY KEY,
    F_Name VARCHAR(30) NOT NULL,
    F_Phone VARCHAR(15),
    Salary FLOAT(7, 2),
    JoinDate DATETIME,
    Dept VARCHAR(10)
);
CREATE TABLE CourseInfo (
    CID INTEGER(7) PRIMARY KEY,
    C_Name VARCHAR(30) NOT NULL,
    FID INTEGER(7),
    CONSTRAINT CI_FID_FK FOREIGN KEY (FID) REFERENCES Faculty (FID) ON DELETE CASCADE
);
CREATE TABLE CourseGrade (
    SID INTEGER(7) NOT NULL,
    CID INTEGER(7) NOT NULL,
    Grade VARCHAR(1) NOT NULL,
    PRIMARY KEY (SID, CID),
    CONSTRAINT CG_SID_FK FOREIGN KEY (SID) REFERENCES StudentInfo (SID) ON DELETE CASCADE,
    CONSTRAINT CG_CID_FK FOREIGN KEY (CID) REFERENCES CourseInfo (CID) ON DELETE CASCADE
);
INSERT INTO StudentInfo
Values(1, "Adams", 3.0, "IS");
INSERT INTO StudentInfo
Values(2, "Jones", 2.9, "MKT");
INSERT INTO StudentInfo
Values(3, "Smith", 2.8, "IS");
INSERT INTO StudentInfo
Values(4, "Baker", 3.1, "CS");
INSERT INTO StudentInfo
Values(5, "Troy", 3.0, "CS");
INSERT INTO StudentInfo
Values(6, "Sharpe", 3.2, "MKT");
INSERT INTO StudentInfo
Values(7, "Lewis", 2.7, "IS");
INSERT INTO StudentInfo
Values(8, "Saxe", 3.5, "MLA");
INSERT INTO StudentInfo
Values(9, "Malone", 2.6, "IS");
INSERT INTO StudentInfo
Values(10, "Granger", 4.0, "MKT");
INSERT INTO StudentInfo
Values(11, "Potter", 3.3, "IS");
INSERT INTO StudentInfo
Values(12, "Weasley", 3.1, "CS");
INSERT INTO CourseInfo
Values(1, "ISM 301", 1);
INSERT INTO CourseInfo
Values(2, "ISM 218", 2);
INSERT INTO CourseInfo
Values(3, "ISM 116", 4);
INSERT INTO CourseInfo
Values(4, "ISM 210", 1);
INSERT INTO Faculty
Values(1, "Iyer", "45869", 24000, "1998-4-1", "ISOM");
INSERT INTO Faculty
Values(2, "Wallace", "98999", 4000, "2000-4-18", "ISOM");
INSERT INTO Faculty
Values(3, "Edger", "45844", 22000, "1998-4-1", "CS");
INSERT INTO Faculty
Values(4, "Church", "66899", 4000, "2000-5-9", "CS");
INSERT INTO CourseGrade
Values(1, 2, "A");
INSERT INTO CourseGrade
Values(1, 1, "B");
INSERT INTO CourseGrade
Values(2, 2, "C");
INSERT INTO CourseGrade
Values(3, 2, "B");
INSERT INTO CourseGrade
Values(4, 1, "C");
INSERT INTO CourseGrade
Values(4, 2, "B");
INSERT INTO CourseGrade
Values(5, 2, "C");
INSERT INTO CourseGrade
Values(3, 3, "B");
INSERT INTO CourseGrade
Values(5, 4, "B");
INSERT INTO CourseGrade
Values(6, 1, "C");
INSERT INTO CourseGrade
Values(6, 2, "A");
INSERT INTO CourseGrade
Values(7, 3, "B");
INSERT INTO CourseGrade
Values(8, 2, "B");
INSERT INTO CourseGrade
Values(9, 1, "C");
INSERT INTO CourseGrade
Values(10, 1, "B");
INSERT INTO CourseGrade
Values(11, 3, "C");
INSERT INTO CourseGrade
Values(11, 2, "B");
INSERT INTO CourseGrade
Values(12, 2, "A");
INSERT INTO CourseGrade
Values(12, 1, "C");
INSERT INTO CourseGrade
Values(12, 4, "C");
CREATE VIEW v_student_grades AS
SELECT s.S_Name,
    cg.Grade,
    c.C_Name
FROM StudentInfo s,
    CourseGrade cg,
    CourseInfo c
WHERE s.SID = cg.SID
    AND cg.CID = c.CID;
SELECT *
FROM v_student_grades
Order By S_Name;