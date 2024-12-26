use LibrarySysDB

-- Inserting into Publisher
INSERT INTO Publisher
    (ID, Name, Address, Email, Phone)
VALUES
    (1, 'Penguin Random House', '1745 Broadway, New York, NY', 'contact@penguinrandomhouse.com', '2125551234'),
    (2, 'HarperCollins', '195 Broadway, New York, NY', 'info@harpercollins.com', '2125555678'),
    (3, 'Simon & Schuster', '1230 Avenue of the Americas, New York, NY', 'support@simonandschuster.com', '2125558765'),
    (4, 'Macmillan Publishers', '120 Broadway, New York, NY', 'info@macmillan.com', '2125553456'),
    (5, 'Hachette Book Group', '1290 Avenue of the Americas, New York, NY', 'support@hachette.com', '2125554321');

-- Inserting into Author
INSERT INTO Author
    (ID, Name, BOD)
VALUES
    (1, 'J.K. Rowling', '1965-07-31'),
    (2, 'Stephen King', '1947-09-21'),
    (3, 'George R.R. Martin', '1948-09-20'),
    (4, 'J.R.R. Tolkien', '1892-01-03'),
    (5, 'Agatha Christie', '1890-09-15'),
    (6, 'Dan Brown', '1964-06-22'),
    (7, 'Margaret Atwood', '1939-11-18'),
    (8, 'Isaac Asimov', '1920-01-02'),
    (9, 'Neil Gaiman', '1960-11-10'),
    (10, 'Jane Austen', '1775-12-16');

-- Inserting into Category
INSERT INTO Category
    (ID, Type, Description, Popularity_score)
VALUES
    (1, 'Fiction', 'Works of imaginative narration', 90),
    (2, 'Science Fiction', 'Stories about futuristic concepts', 85),
    (3, 'Mystery', 'Crime and detective stories', 88),
    (4, 'Fantasy', 'Magical and supernatural elements', 95),
    (5, 'Romance', 'Love and relationships', 80),
    (6, 'Biography', 'Life stories of real people', 75),
    (7, 'Self-Help', 'Guidance for personal development', 70),
    (8, 'Historical Fiction', 'Stories set in historical periods', 78);

-- Inserting into Book
INSERT INTO Book
    (ID, ISBN, Title, Year_of_publication, Edition, Available_copies, Genre, Publisher_ID, Category_ID, Author_ID)
VALUES
    (1, '9780747532743', 'Harry Potter and the Philosopher''s Stone', 1997, '1st', 15, 'Fantasy', 1, 4, 1),
    (2, '9781501128035', 'The Shining', 1977, '2nd', 10, 'Horror', 2, 1, 2),
    (3, '9780553103540', 'A Game of Thrones', 1996, '1st', 12, 'Fantasy', 3, 4, 3),
    (4, '9780618260300', 'The Lord of the Rings', 1954, '50th Anniversary', 8, 'Fantasy', 4, 4, 4),
    (5, '9780062073488', 'Murder on the Orient Express', 1934, '1st', 20, 'Mystery', 2, 3, 5),
    (6, '9780385514231', 'The Da Vinci Code', 2003, '1st', 25, 'Mystery', 1, 3, 6),
    (7, '9780385490818', 'The Handmaid''s Tale', 1985, '1st', 18, 'Dystopian', 5, 1, 7),
    (8, '9780553293357', 'Foundation', 1951, '1st', 13, 'Science Fiction', 3, 2, 8),
    (9, '9780060558123', 'American Gods', 2001, '1st', 17, 'Fantasy', 4, 4, 9),
    (10, '9780141439518', 'Pride and Prejudice', 1813, '3rd', 22, 'Romance', 5, 5, 10);

-- Inserting into Branch
INSERT INTO Branch
    (ID, Location, Name, Phone)
VALUES
    (1, 'Downtown', 'Central Library', '1234567890'),
    (2, 'Uptown', 'Uptown Branch', '0987654321'),
    (3, 'Eastside', 'Eastside Library', '1122334455'),
    (4, 'Westside', 'Westside Branch', '5566778899');

-- Inserting into Admin
INSERT INTO Admin
    (ID, Name, Email, Phone, Username, Password, Hire_Date, Position, Branch_ID)
VALUES
    (1, 'Alice Johnson', 'alice@library.com', '1112223333', 'alice_admin', 'password1', '2018-01-15', 'Manager', 1),
    (2, 'Bob Smith', 'bob@library.com', '4445556666', 'bob_admin', 'password2', '2020-05-10', 'Librarian', 2),
    (3, 'Cathy Brown', 'cathy@library.com', '7778889999', 'cathy_admin', 'password3', '2019-09-20', 'Assistant', 3);

-- Inserting into Member
INSERT INTO Member
    (Member_ID, Name, Email, Phone, Username, Password, Sex, Borrowing_History)
VALUES
    (1, 'John Doe', 'john.doe@example.com', '9876543210', 'john_doe', 'password4', 'M', NULL),
    (2, 'Jane Smith', 'jane.smith@example.com', '8765432109', 'jane_smith', 'password5', 'F', NULL),
    (3, 'Michael Brown', 'michael.brown@example.com', '7654321098', 'michael_brown', 'password6', 'M', NULL);

-- Inserting into Membership
INSERT INTO Membership
    (Membership_ID, Type, Status, Due_Date, Fee, Member_ID)
VALUES
    (1, 'Gold', 'Active', '2024-12-31', 50.00, 1),
    (2, 'Silver', 'Active', '2024-11-30', 30.00, 2),
    (3, 'Bronze', 'Inactive', '2023-12-15', 20.00, 3);

-- Inserting into Stored_at
INSERT INTO Stored_at
    (Book_ID, Branch_ID)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 1),
    (5, 2),
    (6, 3),
    (7, 4),
    (8, 1),
    (9, 2),
    (10, 3);

-- Inserting into BorrowReturn
INSERT INTO BorrowReturn
    (Member_ID, Book_ID, Issue_Date, Return_Date)
VALUES
    (1, 1, '2024-01-01', '2024-01-15'),
    (2, 2, '2024-01-05', NULL),
    (3, 3, '2024-01-10', NULL);


-- Inseerting into Message Table
INSERT INTO [Message]
    (ID, Sender, Receiver, Content)
VALUES
    (1, 3, 2, 'I had a problem with the book; Please extend the the return date.'),
    (2, 2, 2, 'I need a delay for the book');


-- Inserting into Report
INSERT INTO [Report]
    (ID, Username, Book_ID, DelayFine, Return_Date)
VALUES
    (1, 'admin_john', 1, 5.00, '2024-12-10'),
    (2, 'admin_amy', 2, 3.50, '2024-12-12'),
    (3, 'admin_john', 3, 7.25, '2024-12-14'),
    (4, 'admin_lucas', 4, 2.00, '2024-12-16'),
    (5, 'admin_amy', 5, 4.50, '2024-12-20');
