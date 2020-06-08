//3.1 Create direct relation who meets who
// First delete pre existing relations
MATCH (n)-[r:MEETS]-(m)
DELETE r;
// Then readd
MATCH (n1:employee)-[r1]-(t)-[r2]-(n2:employee) 
WHERE type(r1)=type(r2)
MERGE (n1)-[:MEETS{seating:type(r1),table:t.id}]-(n2);