# Let's limit our results to player name, year, and voting committee

 Select namefirst, namelast, yearid, votedby  from hof left join master on 

 # Now let's combine our name columns using the CONCAT function

 select CONCAT(namefirst, ' ', namelast) as fullname, yearid, votedby  from hof left join master on 
hof.playerid = master.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;

# Let's add the percentage of votes received by each HOF inductee (approval percentage) by converting our integers into decimals, rounding, and ensuring zero ballot cases do not cause errors

select CONCAT(namefirst, ' ', namelast) as fullname, yearid, votedby, 
 ROUND(CAST(votes AS DECIMAL(10,2)) / NULLIF(ballots, 0) * 100, 2) AS approval_percentage  from hof left join master on 
hof.playerid = master.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;

# Now let's saved our joined table query as an actual separate table

Create table joined_hof as 
Select hof.*, master.playerid as masterplayerid, master.namefirst, master.namelast, master.weight, master.height, master.birthyear from hof left join master on 
hof.playerid = master.playerid where hof.inducted = 'Y';

# Note: must differentiate the key column (i.e. playerid) by renaming it for one of the tables being joined

# What if we want to look at just hall-of-famers who were born after 1950?

select * from joined_hof where inducted = 'Y' and birthyear > 1950 order by birthyear desc;


