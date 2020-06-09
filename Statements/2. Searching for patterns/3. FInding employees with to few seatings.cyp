// 2.3 Finding to few seatings PER Employee
MATCH (e:employee)-[r]->(t:table)
WITH e,r ,t order by r, t
WITH e, count(r) AS seatingsCount, collect(r.seatingNo) AS seatings, collect(t.id) AS tableIds
WHERE seatingsCount<3
RETURN e, seatingsCount, seatings, tableIds