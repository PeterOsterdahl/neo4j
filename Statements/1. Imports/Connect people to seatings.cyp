//1.3 Connect people to seatings
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/PeterOsterdahl/neo4j/master/Seatings_1.txt' AS LINE FIELDTERMINATOR ';' MATCH (e:employee{id:toInteger(LINE.ID)}),(t:table{id:toInteger(LINE.TABLE)}) MERGE (e)-[:SEATING_1]->(t) RETURN e,t;
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/PeterOsterdahl/neo4j/master/Seatings_2.txt' AS LINE FIELDTERMINATOR ';' MATCH (e:employee{id:toInteger(LINE.ID)}),(t:table{id:toInteger(LINE.TABLE)}) MERGE (e)-[:SEATING_2]->(t) RETURN e,t;
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/PeterOsterdahl/neo4j/master/Seatings_3.txt' AS LINE FIELDTERMINATOR ';' MATCH (e:employee{id:toInteger(LINE.ID)}),(t:table{id:toInteger(LINE.TABLE)}) MERGE (e)-[:SEATING_3]->(t) RETURN e,t;
