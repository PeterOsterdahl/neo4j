// 4.1 Get seatings, tables and people
MATCH (t:table)-[r]-(e:employee)
WITH t,r,e
ORDER BY e
WITH t,r, type(r) AS seating, collect(e.name) AS employees
MATCH (notseated:employee)
WHERE NOT (notseated)-[:SEATING_1]-(:table) 
ORDER BY seating, t.id, notseated.name
WITH seating, t.id, employees, collect(notseated.name) as notSeateds
RETURN seating, t.id, employees, notSeateds