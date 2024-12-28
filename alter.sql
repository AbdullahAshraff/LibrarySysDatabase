ALTER TABLE Message ADD 
    Content VARCHAR(1000);

ALTER TABLE Book DROP COLUMN genre;

ALTER TABLE Book ADD 
    Genre VARCHAR(100);

select * from book

delete from BOOK
where genre is null;