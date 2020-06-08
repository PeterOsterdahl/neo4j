//3.2 Find some offenders
MATCH (n)-[m:MEETS]-(n2)
WITH n, n2, COUNT(m) AS antal
WHERE antal>1
RETURN n,n2