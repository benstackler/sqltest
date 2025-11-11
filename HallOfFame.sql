# Creating Necessary Table - Master

 Create table master (playerID text, birthyear int, birthmonth int, birthday int, birthcountry text, 
 birthstate text, birthcity text, deathyear int, deathmonth int, deathday int, deathcountry text, deathstate text, 
 deathcity text, namefirst text, namelast text, namegiven text, weight int, height int, bats text, throws text, debut date, 
 finalgame date, retroid text, bbrefid text);

# Importing Kaggle Dataset - Master
# 1. Tables
# 2. "Master"
# 3. Import/Export data
# 4. "Master.csv"
# 5. "Header" - checked
# 6. "Delimiter" - comma

# Checking Your Import - Master

  Select * from master;

# Creating Necessary Table - HOF

Create table HOF 
(playerid text, yearid int, votedby text, ballots int, needed int, votes int, 
inducted text, category text, needed_note text);

# Importing Kaggle Dataset - HOF
# 1. Tables
# 2. "HOF"
# 3. Import/Export data
# 4. "HallofFame.csv"
# 5. "Header" - checked
# 6. "Delimiter" - comma

# Checking Your Import - HOF
  Select * from HOF;

# Join tables together so that we can find Hall of Fame player profiles inducted after 1990

select * from hof left join master on hof.playerid = master.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;

# Let's limit our results to player name, year, and voting committee

 Select namefirst, namelast, yearid, votedby  from hof left join master on 

 # Now let's combine our name columns using the CONCAT function

 select CONCAT(namefirst, ' ', namelast) as fullname, yearid, votedby  from hof left join master on 
hof.playerid = master.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;
hof.playerid = master.playerid where hof.inducted = 'Y' and yearid > 1990 order by yearid desc;
