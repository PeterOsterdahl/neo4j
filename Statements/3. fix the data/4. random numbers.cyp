//3.4 Create Random numbers
MATCH (e:employee)
WITH e, toInteger(rand()*100) AS pos
ORDER BY pos
RETURN e.id, pos