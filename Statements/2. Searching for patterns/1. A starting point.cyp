//2.1 a starting point
MATCH (n:employee{id:10})-[]-(t)
RETURN n,t