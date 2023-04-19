CREATE TABLE Duplicates (
  PostId int,
  PostIdOfDuplicate int
);

INSERT INTO Duplicates (PostId, DuplId)
SELECT PostId, RelatedPostId AS DuplId 
FROM PostLinks 
WHERE LinkTypeId = 3;

SELECT
  P1.Id AS Id1, P1.Title AS Title1, P1.Body AS Body1, P1.Tags AS Tags1,
  P2.Id AS Id2, P2.Title AS Title2, P2.Body AS Body2, P2.Tags AS Tags2
FROM Posts P1, Posts P2, Duplicates D
WHERE P1.Id = D.PostId 
  AND P2.Id = D.DuplId
  AND ((
      P1.Tags LIKE '%<pandas>%' AND
      P1.Tags LIKE '%<python>%'
    )
);