CREATE TABLE PandasPosts (
  Id INT,
  Title TEXT,
  Body TEXT,
  Tags TEXT
);

INSERT INTO PandasPosts
SELECT Id, Title, Body, Tags
FROM Posts
WHERE(
    P1.Tags LIKE '%<pandas>%' AND
    P1.Tags LIKE '%<python>%'
);

CREATE TABLE PandasPairs (
  Id1 INT,
  Title1 TEXT,
  Body1 TEXT,
  Tags1 TEXT,
  Id2 INT,
  Title2 TEXT,
  Body2 TEXT,
  Tags2 TEXT,
);


SELECT *
-- take cartesian product to get all pairs of posts
(SELECT
  P1.Id AS Id1, P1.Title AS Title1, P1.Body AS Body1, P1.Tags AS Tags1,
  P2.Id AS Id2, P2.Title AS Title2, P2.Body AS Body2, P2.Tags AS Tags2
FROM Posts P1, Posts P2)
-- remove all pairs that are duplicates
    EXCEPT 
( SELECT * FROM Duplicates);

