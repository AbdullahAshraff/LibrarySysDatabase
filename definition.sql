use LibrarySysDB

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
    BOD DATE
);

-- Table: Category
CREATE TABLE Category
(
    ID INT PRIMARY KEY,
    Type VARCHAR(100),
    Description TEXT,
    Popularity_score INT
);

-- Table: Book
CREATE TABLE Book
(
    ID INT PRIMARY KEY,
    ISBN VARCHAR(13) UNIQUE,
    Title VARCHAR(255),
    Year_of_publication INT,
    Edition VARCHAR(50),
    Available_copies INT,
    Genre VARCHAR(100),
    Publisher_ID INT,
    Category_ID INT,
    Author_ID INT,
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(ID),
    FOREIGN KEY (Category_ID) REFERENCES Category(ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(ID)
);

-- Table: Branch
CREATE TABLE Branch
(
    ID INT PRIMARY KEY,
    Location VARCHAR(255),
    Name VARCHAR(255),
    Phone VARCHAR(15)
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
    Position VARCHAR(100),
    Branch_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(ID)
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
    Sex CHAR(1),
    Borrowing_History TEXT
);

-- Table: Membership
CREATE TABLE Membership
(
    Membership_ID INT PRIMARY KEY,
    Type VARCHAR(50),
    Status VARCHAR(50),
    Due_Date DATE,
    Fee DECIMAL(10, 2),
    Member_ID INT UNIQUE,
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

-- Table: Message
CREATE TABLE Message
(
    ID INT PRIMARY KEY,
    Sender INT,
    Receiver INT,
    Content VARCHAR(1000),
    FOREIGN KEY (Sender) REFERENCES Member(Member_ID),
    FOREIGN KEY (Receiver) REFERENCES Member(Member_ID)
);

-- Table: Report
CREATE TABLE Report
(
    ID INT PRIMARY KEY,
    Username VARCHAR(100),
    Book_ID INT,
    DelayFine DECIMAL(10, 2),
    Return_Date DATE,
    FOREIGN KEY (Username) REFERENCES Admin(Username),
    FOREIGN KEY (Book_ID) REFERENCES Book(ID)
);

-- Table: BorrowReturn
CREATE TABLE BorrowReturn
(
    Member_ID INT,
    Book_ID INT,
    Issue_Date DATE,
    Return_Date DATE,
    PRIMARY KEY (Member_ID, Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(ID)
);

-- Table: Stored_at (Book → Branch)
CREATE TABLE Stored_at
(
    Book_ID INT,
    Branch_ID INT,
    PRIMARY KEY (Book_ID, Branch_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(ID)
);
