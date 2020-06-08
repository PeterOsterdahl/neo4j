// 1.1 Load people
// First empty database
MATCH (n) DETACH DELETE n;
// Now load
LOAD CSV WITH HEADERS 
FROM 'https://raw.githubusercontent.com/PeterOsterdahl/neo4j/master/sommarfestdeltagare4.txt' AS LINE 
FIELDTERMINATOR ';' 
CREATE (e:employee{id:toInteger(LINE.Id), name:LINE.Namn});