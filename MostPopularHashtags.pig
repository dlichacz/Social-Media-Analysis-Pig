-- Load data
data = LOAD '/user/popularhashtags/full_text.txt' AS (id:chararray, ts:chararray, location:chararray, lat:float, lon:float, tweet:chararray);

-- Convert all tweets to lowercase to allow for accurate grouping
lowercase = FOREACH data GENERATE LOWER(tweet) as tweet;

-- Separate all tweets into individual words
tweetwords = FOREACH lowercase GENERATE FLATTEN(TOKENIZE(tweet)) as token;

-- Extract only hashtags from the collection of words
hashtags = FOREACH tweetwords GENERATE REGEX_EXTRACT(token, '(#)[a-z0-9_](\\w+)',0) as hashtag;

-- Group identical hashtags together and create an ordered list of aggregrate counts
grouphashtags = GROUP hashtags BY hashtag;
counthashtags = FOREACH grouphashtags GENERATE  group as hashtag, COUNT(hashtags) as cnt;
orderhashtags = ORDER counthashtags BY cnt desc;
limithashtags = LIMIT orderhashtags 5;
DUMP limithashtags;