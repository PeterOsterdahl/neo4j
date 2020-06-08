// 2.3 FInding to few seatings
MATCH (e:employee)-[r]->(t:table)
WITH e,r ,t order by r, t
WITH e, count(r) AS seatingsCount, collect(type(r)) AS seatings, collect(t.id) AS tableIds
WHERE seatingsCount<3
RETURN e, seatingsCount, seatings, tableIds