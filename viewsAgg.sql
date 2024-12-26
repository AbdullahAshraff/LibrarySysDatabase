use LibrarySysDB

-------------

CREATE VIEW AveragePopularityScoreByGenre
AS
    SELECT
        Book.Genre,
        AVG(Category.Popularity_score) AS AveragePopularityScore
    FROM
        Book
        JOIN Category ON Book.Category_ID = Category.ID
    GROUP BY 
        Book.Genre;

use LibrarySysDB
SELECT *
FROM AveragePopularityScoreByGenre
ORDER BY AveragePopularityScore DESC;

-------------

CREATE VIEW MostBorrowedBooks
AS
    SELECT
        Book.Title AS BookTitle,
        COUNT(BorrowReturn.Book_ID) AS TimesBorrowed
    FROM
        BorrowReturn
        JOIN Book ON BorrowReturn.Book_ID = Book.ID
    GROUP BY 
        Book.Title

use LibrarySysDB
SELECT *
FROM MostBorrowedBooks
ORDER BY TimesBorrowed DESC;

-------------

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


use LibrarySysDB
SELECT *
FROM BranchInventory
ORDER BY UniqueGenres DESC;
