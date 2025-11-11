# :ballot_box: Dividing into Percentages Using Decimals

### Let's add the percentage of votes received by each HOF inductee (induction percentage). 
We want to convert our integer variables into decimals (using cast) and making zero-ballot instances (e.g. Veteran's Committee) null to avoid errors.

````sql
select CONCAT(namefirst, ' ', namelast) as fullname, yearid, votedby, 
 ROUND(CAST(votes AS DECIMAL(10,2)) / NULLIF(ballots, 0) * 100, 2)
AS approval_percentage  from hof left join master on 
hof.playerid = master.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;
````

## New Query Result with Induction Percentages
![percentage_table](https://github.com/benstackler/MLB-HOF-SQL/blob/main/percentages.png)
