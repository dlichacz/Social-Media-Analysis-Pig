Social Media Analysis Using Pig
===================
This repository contains examples of social media analysis using Pig.  Individual examples are described in detail below.

#### <i class="icon-folder-open"></i> Data Files
- **full_text.txt**: Contains geo-tagged Twitter data with the following fields:
	- Twitter user ID
	- Timestamp of the tweet
	- Location of the tweet
	- Latitude of the tweet
	- Longitude of the tweet
	- Tweet content
- **cities15000.txt**: Contains information on cities around the world with the following fields:
	- Record ID
	- City name
	- Country code
	- Latitude of the city
	- Longitude of the city
	- Timezone ID

MostPopularHashtags.pig
-------------

This script file will find the top 5 hashtags from full_text.txt.  For this example, a hashtag is defined to be any string that starts with '#' and contains numbers, letters or underscores.
