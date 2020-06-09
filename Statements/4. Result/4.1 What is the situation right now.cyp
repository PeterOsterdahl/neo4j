// 4.1 Get seatings, tables and people
MATCH (t:table)<-[r]-(e:employee)
WITH t,r,e
ORDER BY e
RETURN  t.id, r.seatingNo AS seating, collect(e.name) AS employees
ORDER BY seating, t.id