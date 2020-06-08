//1.3 Connect people to seatings
MATCH (e:employee)-[r]->(t:table)
DELETE r;

UNWIND([1,2,3]) AS seating
WITH seating
MATCH (e:employee)
WITH e, rand() AS r, seating
ORDER BY r
WITH collect(e) as emps , seating
MATCH (t:table)
WITH emps, collect (t) AS tables, seating
UNWIND range(0, size(emps)-1) as pos
WITH emps[pos] AS emp,tables[pos%8] AS tableNo, seating
MERGE (emp)-[:SEATING{seatingNo:seating}]->(tableNo);

MATCH (e:employee)
WITH e, rand() AS r
ORDER BY r
WITH collect(e) as emps 
MATCH (t:table)
WITH emps, collect (t) AS tables
UNWIND range(0, size(emps)-1) as pos
WITH emps[pos] AS emp,tables[pos%8] AS tableNo
MERGE (emp)-[:SEATING_2]->(tableNo);

MATCH (e:employee)
WITH e, rand() AS r
ORDER BY r
WITH collect(e) as emps 
MATCH (t:table)
WITH emps, collect (t) AS tables
UNWIND range(0, size(emps)-1) as pos
WITH emps[pos] AS emp,tables[pos%8] AS tableNo
MERGE (emp)-[:SEATING_3]->(tableNo);

MATCH (n:employee)-[]-(t:table)
RETURN n,t