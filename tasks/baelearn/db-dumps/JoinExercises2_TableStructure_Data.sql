CREATE TABLE Builder (
    BID INTEGER(7) PRIMARY KEY,
    B_FName VARCHAR(30),
    B_LName VARCHAR(30) NOT NULL,
    DOB DATE
);
CREATE TABLE Neighborhood(
    NID INTEGER(7) PRIMARY KEY,
    N_Name VARCHAR(30) NOT NULL,
    City VARCHAR(30)
);
CREATE TABLE SubContractor(
    SID INTEGER(7) PRIMARY KEY,
    S_FName VARCHAR(30),
    S_LName VARCHAR(30) NOT NULL,
    Salary DEC(7, 2) NOT NULL
);
CREATE TABLE HireInfo(
    BID INTEGER(7) NOT NULL,
    SID INTEGER(7) NOT NULL,
    S_HireDate DATE NOT NULL,
    PRIMARY KEY (BID, SID),
    CONSTRAINT HireInfo_BID_FK FOREIGN KEY (BID) REFERENCES Builder(BID) ON DELETE CASCADE,
    CONSTRAINT HireInfo_SID_FK FOREIGN KEY (SID) REFERENCES SubContractor(SID) ON DELETE CASCADE
);
CREATE TABLE House(
    HID INTEGER(7) PRIMARY KEY,
    H_Name VARCHAR(30) NOT NULL,
    FinishDate DATE,
    Price FLOAT(20, 2) NOT NULL,
    BID INTEGER(7) NOT NULL,
    NID INTEGER(7) NOT NULL,
    CONSTRAINT House_BID_FK FOREIGN KEY (BID) REFERENCES Builder(BID) ON DELETE CASCADE,
    CONSTRAINT House_NID_FK FOREIGN KEY (NID) REFERENCES Neighborhood(NID) ON DELETE CASCADE
);
INSERT INTO Builder
Values(1000001, "Jack", "Adams", "1975-08-11");
INSERT INTO Builder
Values(1000002, "Jim", "Jones", "1972-08-21");
INSERT INTO Builder
Values(1000003, "Bee", "Smith", "1973-12-31");
INSERT INTO Builder
Values(1000004, "Anita", "Baker", "1974-03-19");
INSERT INTO Builder
Values(1000005, "Icharus", "Troy", "1975-01-16");
INSERT INTO Builder
Values(1000006, "Phillip", "Sharpe", "1973-05-15");
INSERT INTO Builder
Values(1000007, "Anastasia", "Lewis", "1989-02-17");
INSERT INTO Builder
Values(1000008, "Malik", "Saxe", "1985-06-01");
INSERT INTO Builder
Values(1000009, "Kimberly", "Malone", "1962-07-10");
INSERT INTO Builder
Values(1000010, "Stephany", "Granger", "1954-09-09");
INSERT INTO Builder
Values(1000011, "Harry", "Potter", "1982-11-01");
INSERT INTO Builder
Values(1000012, "Ronald", "Weasley", "1953-12-11");
INSERT INTO Neighborhood
Values(2000001, "Oak Creek", "Atlanta");
INSERT INTO Neighborhood
Values(2000002, "Weatherford", "Marietta");
INSERT INTO Neighborhood
Values(2000003, "Stratford", "Boone");
INSERT INTO Neighborhood
Values(2000004, "Sterling", "Chapel Hill");
INSERT INTO Neighborhood
Values(2000005, "Overton", "Forest Hills");
INSERT INTO Neighborhood
Values(2000006, "Lambert", "Hollis");
INSERT INTO Neighborhood
Values(2000007, "Bonneville ", "Guilderland");
INSERT INTO Neighborhood
Values(2000008, "Alderon", "Atlanta");
INSERT INTO Neighborhood
Values(2000009, "Simpson", "Springfield");
INSERT INTO Neighborhood
Values(2000010, "Spooner", "Quahog");
INSERT INTO Neighborhood
Values(2000011, "Centerville", "Langley Falls");
INSERT INTO Neighborhood
Values(2000012, "Cleveland", "Sumperton");
INSERT INTO SubContractor
Values(3000001, "Jill", "Adams", 153.00);
INSERT INTO SubContractor
Values(3000002, "Jim", "Baker", 172.00);
INSERT INTO SubContractor
Values(3000003, "Anthony", "Smith", 173.00);
INSERT INTO SubContractor
Values(3000004, "Anita", "Smitherton", 174.00);
INSERT INTO SubContractor
Values(3000005, "Alicia", "Tompkins", 175.00);
INSERT INTO SubContractor
Values(3000006, "Phillip", "Sharpton", 173.00);
INSERT INTO SubContractor
Values(3000007, "Bert", "Lewis", 189.00);
INSERT INTO SubContractor
Values(3000008, "Malcolm", "Saxton", 185.00);
INSERT INTO SubContractor
Values(3000009, "Bill", "Murphy", 162.00);
INSERT INTO SubContractor
Values(3000010, "Steve", "German", 195.00);
INSERT INTO SubContractor
Values(3000011, "Harold", "Patterson", 192.00);
INSERT INTO SubContractor
Values(3000012, "Ron", "Waverton", 193.00);
INSERT INTO HireInfo
Values(1000001, 3000001, "2010-01-01");
INSERT INTO HireInfo
Values(1000005, 3000008, "2011-02-04");
INSERT INTO HireInfo
Values(1000010, 3000011, "2011-03-06");
INSERT INTO HireInfo
Values(1000011, 3000011, "2011-04-08");
INSERT INTO HireInfo
Values(1000004, 3000001, "2010-05-03");
INSERT INTO HireInfo
Values(1000008, 3000001, "2009-06-05");
INSERT INTO HireInfo
Values(1000001, 3000007, "2008-08-07");
INSERT INTO HireInfo
Values(1000005, 3000009, "2011-08-09");
INSERT INTO HireInfo
Values(1000005, 3000010, "2011-08-03");
INSERT INTO HireInfo
Values(1000004, 3000003, "2010-08-05");
INSERT INTO HireInfo
Values(1000002, 3000002, "2010-09-09");
INSERT INTO House
Values(
        4000001,
        "Appleton",
        "2012-01-01",
        235999.00,
        1000001,
        2000001
    );
INSERT INTO House
Values(
        4000002,
        "Plantation",
        "2012-10-01",
        255999.00,
        1000002,
        2000001
    );
INSERT INTO House
Values(
        4000003,
        "Mapleberry",
        "2012-08-08",
        275999.00,
        1000002,
        2000002
    );
INSERT INTO House
Values(
        4000004,
        "Oakwood",
        "2012-07-01",
        215999.00,
        1000004,
        2000002
    );
INSERT INTO House
Values(
        4000005,
        "Mahogany",
        "2012-06-07",
        176999.00,
        1000009,
        2000003
    );
INSERT INTO House
Values(
        4000006,
        "Timber",
        "2012-04-03",
        188999.00,
        1000005,
        2000003
    );
INSERT INTO House
Values(
        4000007,
        "Johnston",
        "2012-02-16",
        285999.00,
        1000006,
        2000004
    );
INSERT INTO House
Values(
        4000008,
        "Lakewood",
        "2012-06-11",
        295999.00,
        1000003,
        2000004
    );
INSERT INTO House
Values(
        4000009,
        "Newfoundland",
        "2012-07-09",
        285999.00,
        1000010,
        2000005
    );
INSERT INTO House
Values(
        4000010,
        "Simpson",
        "2012-08-04",
        238999.00,
        1000011,
        2000005
    );
INSERT INTO House
Values(
        4000011,
        "Jackson",
        "2012-03-23",
        279999.00,
        1000012,
        2000009
    );
INSERT INTO House
Values(
        4000012,
        "Overton",
        "2012-01-17",
        245999.00,
        1000012,
        2000009
    );