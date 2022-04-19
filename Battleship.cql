// Create Battleship Field
// Create positions
WITH ['A','B','C','D','E','F','G','H','I','J'] AS letters
UNWIND range(1,10,1) AS x
UNWIND range(1,10,1) AS y
MERGE (loc:Location {location: point({x: x, y: y}), name: letters[x-1] + y});
// Connect positions
MATCH (loc1:Location)
MATCH (loc2:Location)
WHERE (loc2.location.x = loc1.location.x AND loc2.location.y = loc1.location.y-1) OR (loc2.location.x = loc1.location.x-1 AND loc2.location.y = loc1.location.y)
MERGE (loc1)-[:NEXT_POINT]->(loc2);