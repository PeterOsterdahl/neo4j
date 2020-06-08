//2.2 In detail
MATCH (n:employee)-[]-(t:table)
where n.id IN [8,10,13] AND t.id IN [2,3,5]
RETURN n,t