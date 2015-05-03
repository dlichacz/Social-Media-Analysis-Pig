-- Load data
data = LOAD '/user/mobiletweeter/full_text.txt' AS (id:chararray, ts:chararray, location:chararray, lat:float, lon:float, tweet:chararray);

-- Join latitude and longitude coordintates into a tuple
locations = FOREACH data GENERATE id, TOTUPLE(lat, lon) as loc_tuple:tuple(lat:chararray, lon:chararray);

-- Find only unique locations for each user
distinct_locations = DISTINCT(FOREACH locations GENERATE id, loc_tuple);

-- Create an ordered list of the counts of unique locations for each user, returning the top result
group_locations = GROUP distinct_locations BY id;  
count_locations = FOREACH group_locations GENERATE group as id, COUNT(distinct_locations) as cnt;
ordered_counts = ORDER count_locations BY cnt desc;
limit_counts = LIMIT ordered_counts 1;
DUMP limit_counts;
