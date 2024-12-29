DROP DATABASE LibrarySystem
CREATE DATABASE LibrarySystem
use LibrarySystem

-- Table: Publisher
CREATE TABLE Publisher
(
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15)
);

-- Table: Author
CREATE TABLE Author
(
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    BirthDate DATE,
    Biography VARCHAR(MAX),
);

-- Table: Category
CREATE TABLE Category
(
    ID INT PRIMARY KEY,
    Type VARCHAR(100),
    Description TEXT
);

-- Table: Book
CREATE TABLE Book
(
    ID INT PRIMARY KEY,
    ISBN VARCHAR(13) UNIQUE,
    Title VARCHAR(255),
    Year_of_publication INT,
    Edition VARCHAR(50),
    Publisher_ID INT,
    Category_ID INT,
    Author_ID INT,
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(ID),
    FOREIGN KEY (Category_ID) REFERENCES Category(ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(ID)
);

-- Table: Admin
CREATE TABLE Admin
(
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Username VARCHAR(100) UNIQUE,
    Password VARCHAR(100),
    Hire_Date DATE,
    Position VARCHAR(100)
);

-- Table: Branch
CREATE TABLE Branch
(
    ID INT PRIMARY KEY,
    Location VARCHAR(255),
    Name VARCHAR(255),
    Phone VARCHAR(15),
    AdminId INT FOREIGN KEY REFERENCES Admin(ID)
);

-- Table: Member
CREATE TABLE Member
(
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Username VARCHAR(100) UNIQUE,
    Password VARCHAR(100),
    Gender CHAR(1),
    Membership_ID INT FOREIGN KEY REFERENCES Membership(Membership_ID)
);

-- Table: Membership
CREATE TABLE Membership
(
    Membership_ID INT PRIMARY KEY,
    Type VARCHAR(50),
    DurationDays INT,
    Fee DECIMAL(10, 2)
);

-- Table: Message
CREATE TABLE Message
(
    ID INT PRIMARY KEY,
    MemberID INT,
    AdminID INT,
    IsMemberSender BIT,
    TimeSent DATETIME,
    Content VARCHAR(1000),
    FOREIGN KEY (MemberID) REFERENCES Member(Member_ID),
    FOREIGN KEY (AdminID) REFERENCES Admin(ID)
);

-- Table: Report
CREATE TABLE Report
(
    ID INT PRIMARY KEY,
    Type VARCHAR(50),
    AdminID INT,
    Content VARCHAR(MAX),
    Created_Date DATE,
    FOREIGN KEY (AdminID) REFERENCES Admin(ID)
);

-- Table: BorrowReturn
CREATE TABLE BorrowReturn
(
    Member_ID INT,
    Book_ID INT,
    Branch_ID INT,
    Issue_Date DATE,
    Return_Date DATE,
    PRIMARY KEY (Member_ID, Book_ID, Branch_ID, Issue_Date),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(ID)
);

-- Table: Stored_at (Book → Branch)
CREATE TABLE Stored_at
(
    Book_ID INT,
    Branch_ID INT,
    Available_Copies INT,
    PRIMARY KEY (Book_ID, Branch_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(ID)
);
