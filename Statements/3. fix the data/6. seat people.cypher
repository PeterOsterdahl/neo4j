//3.6 Find possible seatings per unseated the short way
// Create seatings to match against


UNWIND [1,2,3] as seatingNumber
WITH seatingNumber

// Find all unseated employees as well as who they already met
MATCH (notseated:employee)
WHERE NOT (notseated)-[:SEATING{seatingNo:seatingNumber}]-(:table) 
WITH seatingNumber, notseated

MATCH (t:table)
WHERE NOT (t)-[:SEATING{seatingNo:seatingNumber}]-(:employee) -[:MEETS]-(notseated)
WITH seatingNumber, notseated , t

MATCH P=((t)-[:SEATING{seatingNo:seatingNumber}]-(:employee))
WITH seatingNumber, notseated ,t,  count(P) as antal ORDER BY antal asc
WITH seatingNumber, notseated ,head(collect(t)) AS selectedTable
MERGE (notseated)-[:SugestedSeating{seatingNo:seatingNumber}]->(selectedTable)
RETURN notseated, selectedTable