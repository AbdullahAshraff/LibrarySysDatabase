ALTER TABLE Member ADD 
    Membership_ID INT FOREIGN KEY REFERENCES Membership(Membership_ID);

ALTER TABLE Book DROP COLUMN genre;

ALTER TABLE Book ADD 
    Genre VARCHAR(100);

select * from book

delete from BOOK
where genre is null;