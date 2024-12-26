use LibrarySysDB

CREATE VIEW TotalBooksInBranches
AS
    SELECT
        Branch.ID AS BranchID,
        Branch.Name AS BranchName,
        Branch.Location,
        COUNT(Stored_at.Book_ID) AS TotalBooks
    FROM
        Branch
        JOIN
        Stored_at ON Branch.ID = Stored_at.Branch_ID
    GROUP BY
    Branch.ID, Branch.Name, Branch.Location;

SELECT *
FROM TotalBooksInBranches;
