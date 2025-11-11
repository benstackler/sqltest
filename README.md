  # :heavy_plus_sign: Combining Names Using CONCAT
  
  ## Now let's combine our name columns using the CONCAT function

````sql
select CONCAT(namefirst, ' ', namelast) as fullname, yearid, votedby  from hof left join master on 
hof.playerid = master.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;
````
