//2.2 In detail
MATCH (n:employee)-[]-(t:table)
where n.id IN [] AND t.id IN []
RETURN n,t