//1.2 Create tables
UNWIND [1,2,3,4,5,6,7,8] AS Id 
CREATE (:table{id:Id});