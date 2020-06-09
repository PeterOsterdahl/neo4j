//3.5 Find possible seatings per unseated
UNWIND [1,2,3] as seatingNumber
WITH seatingNumber

MATCH (notseated:employee)
WHERE NOT (notseated)-[:SEATING{seatingNo:seatingNumber}]-(:table) 
WITH seatingNumber, notseated

MATCH (notseated)-[:MEETS]-(alreadyMet:employee)
WITH seatingNumber, notseated, alreadyMet ORDER BY alreadyMet.name
WITH  seatingNumber, notseated, collect(alreadyMet.id) AS alreadyMets, collect(alreadyMet.name) AS alreadyMetsNames

MATCH (t:table)
WHERE NOT (t)-[:SEATING{seatingNo:seatingNumber}]-(:employee) -[:MEETS]-(notseated)


WITH seatingNumber, notseated ,t, alreadyMetsNames
MATCH P=((t)-[:SEATING{seatingNo:seatingNumber}]-(:employee))
WITH seatingNumber, notseated ,t, alreadyMetsNames,count(P) as antal ORDER BY antal asc
WITH seatingNumber, notseated ,head(collect(t.id)) as selectedTable, alreadyMetsNames
RETURN seatingNumber, notseated ,selectedTable, alreadyMetsNames  ORDER BY   seatingNumber, notseated