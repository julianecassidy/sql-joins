-- write your queries here

-- Join the two tables so that every column and record appears, regardless of if
-- there is not an owner_id.
SELECT *
  FROM owners
    FULL JOIN vehicles ON owners.id = vehicles.owner_id;


-- Count the number of cars for each owner who has a vehicle. Display the owners
-- first_name and count of vehicles. The first_name should be ordered in ascending order.
SELECT o.first_name, COUNT(*)
  FROM owners AS o
    JOIN vehicles AS v ON o.id = v.owner_id
  GROUP BY o.first_name -- BUG: Grouping by first name doesn't account for the fact that ppl have same first name, better to group by id
  ORDER BY o.first_name;

SELECT o.first_name, ROUND(AVG(v.price), 0) AS average_price, COUNT(*)
  FROM owners as o
    JOIN vehicles as v ON o.id = v.owner_id
  GROUP BY o.first_name
  HAVING COUNT(*) > 1 AND AVG(v.price) > 10000
  ORDER BY o.first_name DESC;
