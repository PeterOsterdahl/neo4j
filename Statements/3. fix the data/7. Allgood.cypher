//3.7 All good or?
MATCH (n:employee)-[r]->(t:table)
WITH count(r) as seatings, n
WHERE seatings<>3
RETURN n, seatings