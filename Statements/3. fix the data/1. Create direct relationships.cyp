//3.1 Create direct relation who meets who
// First delete pre existing relations
MATCH (n)-[r:MEETS]-(m)
DELETE r;
// Then readd
MATCH (n1:employee)-[r1]-(t)-[r2]-(n2:employee) 
WHERE r1.seatingNo = r2.seatingNo
MERGE (n1)-[:MEETS{seating:r1.seatingNo,table:t.id}]-(n2);