.read sp20data.sql

CREATE TABLE obedience AS
  SELECT seven, instructor FROM students;
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students
  WHERE smallest > 2 ORDER BY smallest
  LIMIT 20; 
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color
  FROM students as a, students as b 
  WHERE a.time < b.time and a.pet = b.pet and a.song = b.song;
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

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

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper SELECT name, height, height FROM dogs;

INSERT INTO stacks_helper
  SELECT h.dogs || ', ' || d.name, h.stack_height + d.height, d.height 
  FROM stacks_helper as h, dogs as d
  WHERE h.last_height < d.height and d.name <> h.dogs;

INSERT INTO stacks_helper
  SELECT h.dogs || ', ' || d.name, h.stack_height + d.height, d.height 
  FROM stacks_helper as h, dogs as d
  WHERE h.last_height < d.height and d.name <> h.dogs;

INSERT INTO stacks_helper
  SELECT h.dogs || ', ' || d.name, h.stack_height + d.height, d.height 
  FROM stacks_helper as h, dogs as d
  WHERE h.last_height < d.height and d.name <> h.dogs;

CREATE TABLE stacks AS
  SELECT dogs, stack_height 
  FROM stacks_helper 
  WHERE stack_height > 170 
  ORDER BY stack_height;

  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE smallest_int_having AS
  SELECT time, smallest
  FROM students
  GROUP BY smallest
  HAVING COUNT(*) = 1;
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE sp20favpets AS
  SELECT pet, COUNT(*) as count
  FROM students
  GROUP BY pet
  ORDER BY COUNT(*) DESC, pet
  LIMIT 10;
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE sp20dog AS
  SELECT pet, count
  FROM sp20favpets
  WHERE pet = 'dog';
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE obedienceimages AS
  SELECT seven, instructor, COUNT(*)
  FROM students
  WHERE seven = '7'
  GROUP BY instructor;
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";