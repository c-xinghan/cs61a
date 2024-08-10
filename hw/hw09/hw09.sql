CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-- copy your solution from prev hw!
-- The size of each dog
CREATE TABLE size_of_dogs AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT d.name as name, s.size as size
  FROM dogs as d, sizes as s
  WHERE s.min < d.height and d.height <= s.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT child FROM parents, dogs WHERE parent = name ORDER BY height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT a.child as first, b.child as second
  FROM parents as a, parents as b
  WHERE a.parent = b.parent and a.child < b.child;

-- Sentences about siblings that are the same size
-- CREATE TABLE sentences AS
--   -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
--   SELECT sib.first || " and " || sib.second || " are " || siz1.size || " siblings"
--   FROM siblings as sib, size_of_dogs as siz1, size_of_dogs as siz2
--   WHERE sib.first = siz1.name AND sib.second = siz2.name AND siz1.size = siz2.size;

-- Alternate solution without helper table
CREATE TABLE sentences AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT d1.name || " and " || d2.name || " are " || s1.size || " siblings"
  FROM dogs as d1, dogs as d2,
    size_of_dogs as s1, size_of_dogs as s2,
    parents as p1, parents as p2
  WHERE d1.name = s1.name and d2.name = s2.name
    and d1.name = p1.child and d2.name = p2.child
    and s1.size = s2.size and p1.parent = p2.parent and d1.name < d2.name;
