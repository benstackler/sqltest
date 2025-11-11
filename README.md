# :magic_wand: Creating CTEs

## What if we want to compare average player weight throughout different eras of baseball? 

We can create a CTE which divides all players within the "Master" file by debut date and then averages each era grouping's weight. We expect that modern players are, on average, heavier due to general growth trends within the overall human population.

````sql
with 
new_players as 
(SELECT avg(weight) as new_weight from master where debut > '1990-01-01'),
middle_players as 
(Select avg(weight) as middle_weight from master where debut between '1950-01-01' and '1990-01-01'),
old_players as 
(Select avg(weight) as old_weight from master where debut between '1920-01-01' and '1949-01-01'),
classic_players as 
(Select avg(weight) as classic_weight from master where debut between '1800-01-01' and '1919-01-01')

select new_weight, middle_weight, old_weight, classic_weight from new_players, 
    middle_players, 
    old_players, 
    classic_players;
````

### CTE Query Results
| new_weight | middle_weight | old_weight| classic_weight|
| ----------- | ----------- | ----------- | ----------- |
| 202.3784291619691845 | 186.1556427870461237 | 177.8614548747358889 | 171.0093245967741935 |
