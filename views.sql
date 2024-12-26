use LibrarySysDB

-- View 1: Books with Authors and Publishers
CREATE VIEW BooksWithAuthorsAndPublishers
AS
    SELECT
        Book.ID AS BookID,
        Book.Title AS BookTitle,
        Author.Name AS AuthorName,
        Publisher.Name AS PublisherName,
        Book.Year_of_publication AS YearPublished,
        Book.Genre,
        Book.Available_copies AS CopiesAvailable
    FROM
        Book
        JOIN Author ON Book.Author_ID = Author.ID
        JOIN Publisher ON Book.Publisher_ID = Publisher.ID;

-- View 2: Members with Active Memberships
CREATE VIEW ActiveMembers
AS
    SELECT
        Member.Member_ID,
        Member.Name AS MemberName,
        Member.Email,
        Membership.Type AS MembershipType,
        Membership.Status,
        Membership.Due_Date AS MembershipDueDate
    FROM
        Member
        JOIN Membership ON Member.Member_ID = Membership.Member_ID
    WHERE 
    Membership.Status = 'Active';

-- View 3: Books Stored at Each Branch
CREATE VIEW BooksInBranches
AS
    SELECT
        Branch.Name AS BranchName,
        Branch.Location AS BranchLocation,
        Book.Title AS BookTitle,
        Book.Genre,
        Book.Available_copies AS CopiesAvailable
    FROM
        Stored_at
        JOIN Branch ON Stored_at.Branch_ID = Branch.ID
        JOIN Book ON Stored_at.Book_ID = Book.ID;

-- View 4: Borrowed Books with Member Details
CREATE VIEW BorrowedBooks
AS
    SELECT
        BorrowReturn.Member_ID,
        Member.Name AS MemberName,
        BorrowReturn.Book_ID,
        Book.Title AS BookTitle,
        BorrowReturn.Issue_Date,
        BorrowReturn.Return_Date
    FROM
        BorrowReturn
        JOIN Member ON BorrowReturn.Member_ID = Member.Member_ID
        JOIN Book ON BorrowReturn.Book_ID = Book.ID;

-- View 5: Late Returns with Fine (Based on Report Table)
CREATE VIEW LateReturns
AS
    SELECT
        Report.Username AS AdminUsername,
        Admin.Name AS AdminName,
        Report.Book_ID,
        Book.Title AS BookTitle,
        Report.DelayFine AS Fine,
        Report.Return_Date AS ReturnDate
    FROM
        Report
        JOIN Admin ON Report.Username = Admin.Username
        JOIN Book ON Report.Book_ID = Book.ID
    WHERE 
    Report.DelayFine > 0;

-- View 6: Popular Books by Category
CREATE VIEW PopularBooksByCategory
AS
    SELECT
        Category.Type AS CategoryType,
        Category.Description AS CategoryDescription,
        Book.Title AS BookTitle,
        Book.Genre,
        Category.Popularity_score AS PopularityScore
    FROM
        Book
        JOIN Category ON Book.Category_ID = Category.ID
    WHERE 
    Category.Popularity_score > 80;

-- View 7: Admins Managing Each Branch
CREATE VIEW AdminsByBranch
AS
    SELECT
        Branch.Name AS BranchName,
        Branch.Location AS BranchLocation,
        Admin.Name AS AdminName,
        Admin.Position,
        Admin.Email AS AdminEmail
    FROM
        Admin
        JOIN Branch ON Admin.Branch_ID = Branch.ID;

-- View 8: Books Authored by Specific Authors
CREATE VIEW BooksByAuthor
AS
    SELECT
        Author.Name AS AuthorName,
        Book.Title AS BookTitle,
        Book.Year_of_publication AS YearPublished,
        Book.Genre,
        Publisher.Name AS PublisherName
    FROM
        Book
        JOIN Author ON Book.Author_ID = Author.ID
        JOIN Publisher ON Book.Publisher_ID = Publisher.ID;

-- View 9: Branch Inventory Overview
CREATE VIEW BranchInventory
AS
    SELECT
        Branch.Name AS BranchName,
        COUNT(Stored_at.Book_ID) AS TotalBooks,
        COUNT(DISTINCT Book.Genre) AS UniqueGenres
    FROM
        Stored_at
        JOIN Branch ON Stored_at.Branch_ID = Branch.ID
        JOIN Book ON Stored_at.Book_ID = Book.ID
    GROUP BY 
    Branch.Name;

-- View 10: Members Without Borrowed Books
CREATE VIEW MembersWithoutBorrowedBooks
AS
    SELECT
        Member.Member_ID,
        Member.Name AS MemberName,
        Member.Email,
        Membership.Type AS MembershipType
    FROM
        Member
        LEFT JOIN BorrowReturn ON Member.Member_ID = BorrowReturn.Member_ID
        LEFT JOIN Membership ON Member.Member_ID = Membership.Member_ID
    WHERE 
    BorrowReturn.Member_ID IS NULL;
