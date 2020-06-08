// 2.3 FInding to few seatings
MATCH (e:employee)-[r]->(t:table)
WITH e,r ORDER BY r
WITH e, count(r) AS seatingsCount, collect(type(r)) AS seatings
WHERE seatingsCount<3
RETURN e, seatingsCount, seatings