//3.5 Find possible seatings per unseated
UNWIND [1,2,3] as seatingNumber
WITH seatingNumber

MATCH (notseated:employee)
WHERE NOT (notseated)-[:SEATING{seatingNo:seatingNumber}]-(:table) 
WITH seatingNumber, notseated

MATCH (notseated)-[:MEETS]-(alreadyMet:employee)
WITH seatingNumber, notseated, alreadyMet ORDER BY alreadyMet.name
WITH  seatingNumber, notseated, collect(alreadyMet.id) AS alreadyMets, collect(alreadyMet.name) AS alreadyMetsNames

MATCH (t:table)-[:SEATING{seatingNo:seatingNumber}]-(alreadySeated:employee)
WITH seatingNumber, notseated ,t,  alreadySeated, alreadyMetsNames ORDER BY alreadySeated.name
RETURN  seatingNumber, notseated.name, alreadyMetsNames ,t.id,  collect(alreadySeated.name) AS alreadySeateds

ORDER BY notseated.name, seatingNumber, t.id