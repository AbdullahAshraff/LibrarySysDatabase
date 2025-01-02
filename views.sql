USE LibrarySystem2;

-- added
CREATE VIEW Books_Data
AS
    SELECT
        B.Title AS Title,
        a.Name AS Author,
        p.Name AS Publisher,
        c.Type AS Category
    FROM Book B
        JOIN Publisher p ON p.ID = B.Publisher_ID
        JOIN Category c ON c.ID = B.Category_ID
        JOIN Author a ON a.ID = B.Author_ID

--------------------
-- view 1
-- added
CREATE VIEW Books_By_Category
AS
    SELECT
        C.Type AS Category,
        COUNT(B.ID) AS Total_Books
    FROM
        Book B
        JOIN
        Category C ON B.Category_ID = C.ID
    GROUP BY 
    C.Type;


--------------------
-- view 2

-- added
CREATE VIEW Membership_Report
AS
    SELECT
        Ms.Type AS Membership_Type,
        COUNT(Mb.Member_ID) AS Total_Members
    FROM
        Membership Ms
        LEFT JOIN
        Member Mb ON Ms.Membership_ID = Mb.Membership_ID
    GROUP BY Ms.Type;


--------------------
-- view 3
-- added

CREATE VIEW Borrowed_Books_By_Branch
AS
    SELECT
        Br.Name AS Branch_Name,
        COUNT(Bor.Book_ID) AS Borrowed_Books
    FROM
        BorrowReturn Bor
        JOIN
        Branch Br ON Bor.Branch_ID = Br.ID
    GROUP BY Br.Name;


--------------------
-- view 4
-- added

CREATE VIEW Active_Admins
AS
    SELECT
        A.Name AS Admin_Name,
        A.Position,
        B.Name AS Branch_Name
    FROM
        Admin A
        LEFT JOIN
        Branch B ON A.ID = B.AdminId;


--------------------
-- added

CREATE VIEW Member_Gender_Distribution
AS
    SELECT
        Gender,
        COUNT(Member_ID) AS Total_Members
    FROM
        Member
    GROUP BY Gender;



--------------------
-- view 
-- added

CREATE VIEW Books_Availability_By_Branch
AS
    SELECT
        B.Title AS Book_Title,
        Br.Name AS Branch_Name,
        SA.Available_Copies
    FROM
        Stored_at SA
        JOIN Book B ON SA.Book_ID = B.ID
        JOIN Branch Br ON SA.Branch_ID = Br.ID;

SELECT *
FROM Books_Availability_By_Branch
ORDER BY Book_Title



--------------------
-- added
CREATE VIEW Admin_Messages
AS
    SELECT
        A.Name AS Admin_Name,
        COUNT(*) AS Total_Messages
    FROM
        Message M
        JOIN
        Admin A ON M.AdminID = A.ID
    GROUP BY A.Name;



--------------------
-- added

CREATE VIEW Reports_By_Admin
AS
    SELECT
        A.Name AS Admin_Name,
        COUNT(R.ID) AS Total_Reports
    FROM
        Report R
        JOIN
        Admin A ON R.AdminID = A.ID
    GROUP BY 
    A.Name;

--------------------




-- displaying a view
use LibrarySystem2
select *
from 
