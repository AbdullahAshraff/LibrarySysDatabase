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

-- View 3: Borrowed Books with Member Details
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


-- View 4: Popular Books by Category
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

-- View 5: Admins Managing Each Branch
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


-- displaying a view
use LibrarySysDB
select *
from BranchInventory
