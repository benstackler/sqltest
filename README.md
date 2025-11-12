# 🏏 Sorting Career Statistics

## Let's Sort Each Player by Career Batting Average
Each player's batting average can be calculated by dividing number of hits by at bats (with a minimum of 5,000 at-bats). 

To do this, we must create a new column called "batting average," which is the product of dividing hits by at-bats (and making any 0 at-bat players null). 

````sql
select CONCAT(namefirst, ' ', namelast) as name, hits, at_bats, 
ROUND(CAST(hits AS DECIMAL(10,3)) / NULLIF(at_bats, 0), 3) as batting_average from joined_batting 
 where at_bats > 5000 order by batting_average desc NULLS LAST;
````

### Career Batting Average Leaders
![percentage_table](https://github.com/benstackler/MLB-HOF-SQL/blob/main/batting%20averages.png)
