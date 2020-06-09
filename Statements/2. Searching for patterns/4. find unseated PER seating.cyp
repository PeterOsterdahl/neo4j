// 2.4 find unseated PER seating
UNWIND [1,2,3] as seatingNumber
WITH seatingNumber
MATCH (notseated:employee)
WHERE NOT (notseated)-[:SEATING{seatingNo:seatingNumber}]-(:table) 
RETURN seatingNumber, collect(notseated.name)
