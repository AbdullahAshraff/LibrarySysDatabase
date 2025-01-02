USE LibrarySystem2;

-- Insert into Publisher
INSERT INTO Publisher
    (ID, Name, Address, Email, Phone)
VALUES
    (1, 'Penguin Books', '123 Penguin Lane, New York, USA', 'info@penguin.com', '1234567890'),
    (2, 'HarperCollins', '456 Harper Street, London, UK', 'contact@harpercollins.co.uk', '0987654321'),
    (3, 'Random House', '789 Random Ave, Sydney, Australia', 'random@house.com.au', '1112223333'),
    (4, 'Scholastic', '101 Scholastic Blvd, Toronto, Canada', 'support@scholastic.ca', '4445556666'),
    (5, 'Hachette', '55 Hachette Road, Paris, France', 'info@hachette.fr', '7778889999'),
    (6, 'Macmillan', '22 Macmillan Square, Berlin, Germany', 'info@macmillan.de', '5554443333'),
    (7, 'Simon & Schuster', '30 Simon St, Dublin, Ireland', 'info@simonandschuster.ie', '2221110000'),
    (8, 'Oxford Press', 'Oxford Road, Oxford, UK', 'support@oxfordpress.com', '8887776666'),
    (9, 'Cambridge Press', 'Cambridge Road, Cambridge, UK', 'info@cambridgepress.com', '9996663333'),
    (10, 'Springer', 'Springer Lane, Vienna, Austria', 'support@springer.com', '3216549870');

-- Insert into Author
INSERT INTO Author
    (ID, Name, BirthDate, Biography)
VALUES
    (1, 'J.K. Rowling', '1965-07-31', 'Author of the Harry Potter series.'),
    (2, 'George Orwell', '1903-06-25', 'Known for 1984 and Animal Farm.'),
    (3, 'Agatha Christie', '1890-09-15', 'Famous mystery novelist.'),
    (4, 'Mark Twain', '1835-11-30', 'Author of Adventures of Huckleberry Finn.'),
    (5, 'Jane Austen', '1775-12-16', 'Pioneer of romantic fiction.'),
    (6, 'Charles Dickens', '1812-02-07', 'Notable Victorian-era author.'),
    (7, 'Ernest Hemingway', '1899-07-21', 'Author known for succinct prose style.'),
    (8, 'F. Scott Fitzgerald', '1896-09-24', 'Best known for The Great Gatsby.'),
    (9, 'Stephen King', '1947-09-21', 'Master of horror fiction.'),
    (10, 'Tolkien', '1892-01-03', 'Author of The Lord of the Rings.');

-- Insert into Category
INSERT INTO Category
    (ID, Type, Description)
VALUES
    (1, 'Fiction', 'Novels and short stories.'),
    (2, 'Mystery', 'Detective and crime stories.'),
    (3, 'Science Fiction', 'Stories about futuristic concepts.'),
    (4, 'Fantasy', 'Magical and supernatural themes.'),
    (5, 'Biography', 'Life stories of individuals.'),
    (6, 'History', 'Historical accounts and analysis.'),
    (7, 'Education', 'Textbooks and learning material.'),
    (8, 'Children', 'Books for kids and young readers.'),
    (9, 'Romance', 'Love and relationship-focused stories.'),
    (10, 'Horror', 'Scary and suspenseful stories.');

-- Insert into Book
INSERT INTO Book
    (ID, ISBN, Title, Year_of_publication, Edition, Publisher_ID, Category_ID, Author_ID)
VALUES
    (1, '9780439139595', 'Harry Potter and the Prisoner of Azkaban', 1999, '1st', 1, 4, 1),
    (2, '9780451524935', '1984', 1949, '1st', 2, 1, 2),
    (3, '9780007482247', 'Murder on the Orient Express', 1934, '2nd', 3, 2, 3),
    (4, '9780553213119', 'Adventures of Huckleberry Finn', 1885, '3rd', 4, 1, 4),
    (5, '9780141439518', 'Pride and Prejudice', 1813, '1st', 5, 9, 5),
    (6, '9780140449266', 'Oliver Twist', 1837, '4th', 6, 1, 6),
    (7, '9780743273565', 'The Great Gatsby', 1925, '1st', 7, 1, 8),
    (8, '9780307743657', 'The Shining', 1977, '5th', 9, 10, 9),
    (9, '9780547928227', 'The Fellowship of the Ring', 1954, '1st', 8, 4, 10),
    (10, '9780345803481', 'Fifty Shades of Grey', 2011, '1st', 9, 9, 9);

-- Insert into Admin
INSERT INTO Admin
    (ID, Name, Email, Phone, Username, Password, Hire_Date, Position)
VALUES
    (1, 'Alice Johnson', 'alice.johnson@library.com', '1234567890', 'aliceadmin', 'pass123', '2020-01-15', 'Head Librarian'),
    (2, 'Bob Smith', 'bob.smith@library.com', '0987654321', 'bobadmin', 'admin2020', '2019-06-01', 'Branch Manager'),
    (3, 'Carol Davis', 'carol.davis@library.com', '1112223333', 'caroladmin', 'securepass', '2021-03-10', 'IT Administrator'),
    (4, 'Dan Lee', 'dan.lee@library.com', '4445556666', 'danadmin', 'librarian123', '2022-07-20', 'Assistant Librarian'),
    (5, 'Eve Clark', 'eve.clark@library.com', '7778889999', 'eveadmin', 'evepass2021', '2023-01-25', 'Catalog Manager');

-- Insert into Branch
INSERT INTO Branch
    (ID, Location, Name, Phone, AdminId)
VALUES
    (1, 'Downtown', 'Central Library', '1234567890', 1),
    (2, 'Uptown', 'North Branch', '0987654321', 2),
    (3, 'Eastside', 'East Branch', '1112223333', 3),
    (4, 'Westside', 'West Branch', '4445556666', 4),
    (5, 'Southside', 'South Branch', '7778889999', 5);


-- Insert into Member
INSERT INTO Member
    (Member_ID, Name, Email, Phone, Username, Password, Gender)
VALUES
    (1, 'John Doe', 'john.doe@example.com', '1234567890', 'johndoe', 'pass123', 'M'),
    (2, 'Jane Smith', 'jane.smith@example.com', '0987654321', 'janesmith', 'securepass', 'F'),
    (3, 'Michael Brown', 'michael.brown@example.com', '1112223333', 'michaelbrown', 'mike2020', 'M'),
    (4, 'Emily Davis', 'emily.davis@example.com', '4445556666', 'emilydavis', 'emilypass', 'F'),
    (5, 'David Wilson', 'david.wilson@example.com', '7778889999', 'davidwilson', 'david123', 'M'),
    (6, 'Sarah Taylor', 'sarah.taylor@example.com', '3334445555', 'sarahtaylor', 'taylor2021', 'F'),
    (7, 'Daniel Harris', 'daniel.harris@example.com', '6667778888', 'danielharris', 'danpass', 'M'),
    (8, 'Laura Martin', 'laura.martin@example.com', '9990001111', 'lauramartin', 'laurapass', 'F'),
    (9, 'Chris Moore', 'chris.moore@example.com', '5556667777', 'chrismoore', 'chris123', 'M'),
    (10, 'Olivia Lee', 'olivia.lee@example.com', '8889990000', 'olivialee', 'olivepass', 'F');

-- Insert into Membership
INSERT INTO Membership
    (Membership_ID, Type, DurationDays, Fee)
VALUES
    (1, 'Monthly', 30, 15.00),
    (2, 'Quarterly', 90, 40.00),
    (3, 'Semi-Annual', 180, 70.00),
    (4, 'Annual', 365, 120.00),
    (5, 'Weekly', 7, 5.00),
    (6, 'Student Monthly', 30, 10.00),
    (7, 'Family Quarterly', 90, 50.00),
    (8, 'Senior Annual', 365, 100.00),
    (9, 'Corporate Annual', 365, 200.00),
    (10, 'Trial', 14, 0.00);

-- Insert into Message
INSERT INTO Message
    (MemberID, AdminID, IsMemberSender, TimeSent, Content)
VALUES
    (1, 1, 1, '2024-12-28 10:00:00', 'I need help with renewing my membership.'),
    (2, 2, 0, '2024-12-28 10:05:00', 'Your membership has been renewed.'),
    (3, 3, 1, '2024-12-28 10:15:00', 'Is the library open on weekends?'),
    (4, 4, 0, '2024-12-28 10:20:00', 'Yes, we are open on weekends.'),
    (5, 5, 1, '2024-12-28 10:30:00', 'Can I request a new book?'),
    (6, 1, 0, '2024-12-28 10:35:00', 'Sure, please submit your request form.'),
    (7, 2, 1, '2024-12-28 10:45:00', 'I forgot my login password.'),
    (8, 3, 0, '2024-12-28 10:50:00', 'We have sent a password reset link.'),
    (9, 4, 1, '2024-12-28 11:00:00', 'Can I extend my borrowed books?'),
    ( 10, 5, 0, '2024-12-28 11:05:00', 'Yes, please visit the branch.');

-- Insert into Report
INSERT INTO Report
    (ID, Type, AdminID, Content, Created_Date)
VALUES
    (1, 'Daily Operations', 1, 'Report on daily library activities.', '2024-12-27'),
    (2, 'Membership Statistics', 2, 'Analysis of membership renewals.', '2024-12-26'),
    (3, 'IT Infrastructure', 3, 'Details on system performance and issues.', '2024-12-25'),
    (4, 'Inventory Update', 4, 'Update on newly acquired books.', '2024-12-24'),
    (5, 'Security Audit', 5, 'Report on recent security measures.', '2024-12-23'),
    (6, 'Events Summary', 1, 'Summary of recent library events.', '2024-12-22'),
    (7, 'Staff Performance', 2, 'Evaluation of staff performance.', '2024-12-21'),
    (8, 'Feedback Analysis', 3, 'Analysis of member feedback.', '2024-12-20'),
    (9, 'Quarterly Report', 4, 'Overview of quarterly activities.', '2024-12-19'),
    (10, 'Annual Summary', 5, 'Comprehensive annual report.', '2024-12-18');

-- Insert into BorrowReturn
INSERT INTO BorrowReturn
    (Member_ID, Book_ID, Branch_ID, Issue_Date, Return_Date)
VALUES
    (1, 1, 1, '2024-12-01', '2024-12-15'),
    (2, 2, 2, '2024-12-02', '2024-12-16'),
    (3, 3, 3, '2024-12-03', '2024-12-17'),
    (4, 4, 4, '2024-12-04', '2024-12-18'),
    (5, 5, 5, '2024-12-05', '2024-12-19'),
    (6, 6, 1, '2024-12-06', '2024-12-20'),
    (7, 7, 2, '2024-12-07', '2024-12-21'),
    (8, 8, 3, '2024-12-08', '2024-12-22'),
    (9, 9, 4, '2024-12-09', '2024-12-23'),
    (10, 10, 5, '2024-12-10', '2024-12-24');

-- Insert into Stored_at
INSERT INTO Stored_at
    (Book_ID, Branch_ID, Available_Copies)
VALUES
    (1, 1, 5),
    (2, 2, 3),
    (3, 3, 4),
    (4, 4, 6),
    (5, 5, 2),
    (6, 1, 7),
    (7, 2, 5),
    (8, 3, 4),
    (9, 4, 3),
    (10, 5, 6);

