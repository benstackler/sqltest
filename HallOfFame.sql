# Creating Necessary Table - Master

 Create table master (playerID text, birthyear int, birthmonth int, birthday int, birthcountry text, 
  birthstate text, birthcity text, deathyear int, deathmonth int, deathday int, deathcountry text, deathstate text, 
  deathcity text, namefirst text, namelast text, namegiven text, weight int, height int, bats text, throws text, debut date, 
  finalgame date, retroid text, bbrefid text);

# Checking Your Import

  Select * from master;

select * from hof left join players on hof.playerid = players.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;
