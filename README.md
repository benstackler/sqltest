# :open_hands: Creating Aggregate Functions Using Group By

## What if we want to query all players by career home runs?
We download the "Batting" database, which has batting information sorted by player, season, and team. This means we must query the data to group it by player (in order to get a career-level view).

Currently, the data is a mess and we cannot meaningfully sort through the statistics.

![unsorted](https://github.com/benstackler/MLB-HOF-SQL/blob/main/HRs%20unsorted.png)

### First we sum all of the career statistics, to allow us to group by the player's ID.

````sql
CREATE view combined_batting AS
SELECT playerid, sum(g) as g, sum(ab) as ab, sum(r) as r, sum(h) as h, sum(double) as doubles, sum(triple) as triples, 
sum(hr) as HRs, sum(rbi) as rbis, sum(sb) as sb_count, sum(cs) as cs_count, 
sum(bb) as bb_count, sum(so) as so_count, sum(ibb) as ibb_count, sum(hbp) as hbp_count, 
sum(sh) as sh_count, sum(sf) as sf_count, sum(gidp) as gidp_count from batting 
group by playerid;
````

### Then we create a new table using these query results (once validated).


````sql
create table batting2 as 
select * from combined_batting;
````
### We then replace null values with '0' to allow us to sort.
````sql
Create table hr_sorted as
select playerid, coalesce(g, 0) as games, coalesce(ab, 0) as at_bats, coalesce(r, 0) as runs,
coalesce(h, 0) as hits, coalesce(doubles, 0) as doubles, coalesce(triples, 0) as triples, coalesce(hrs, 0) as homers, 
coalesce(rbis, 0) as rbi, coalesce(so_count,0) as so from batting2 order by homers desc;
````

### New Table with Sorted HRs
![sorted](https://github.com/benstackler/MLB-HOF-SQL/blob/main/HRs%20sorted.png)

## Adding Player Names

It's hard to read our table because it only contains player_id. Let's link it back to our original table using a join function.
````sql
Create table joined_batting as 
Select hr_sorted.*, master.playerid as masterplayerid, master.namefirst, master.namelast, 
master.weight, master.height, master.birthyear 
from hr_sorted left join master on 
hr_sorted.playerid = master.playerid order by hr_sorted.homers desc;
````
### Final Table with Player Names
![newtable](https://github.com/benstackler/MLB-HOF-SQL/blob/main/new%20table.png)
