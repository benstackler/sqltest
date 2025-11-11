# :window: Creating New Views

## Can we create a new view that will serve as a query shortcut for hall of fame players?

We start out by creating a new view that will give us HOF players born after 1890, with combined first and last names.

````sql
CREATE VIEW hof_player_view AS
SELECT CONCAT(namefirst, ' ', namelast), playerid, birthyear, weight, height
FROM joined_hof
WHERE birthyear > 1890;
````

## Now we want to double-check our results and also order by birth year.

````sql
select * from hof_player_view order by birthyear asc;
````
### New View Query Result
![newview](https://github.com/benstackler/MLB-HOF-SQL/blob/main/view1.png))
