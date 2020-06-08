//Remove double seatings
MATCH (n)-[m:MEETS]-(n2)
WITH n, n2, COUNT(m) AS antal, collect (m.seating) as seatings
WHERE antal>1 AND n.id < n2.id
MATCH (n)-[r]->(t)
WHERE type(r)=head(seatings)
DELETE r