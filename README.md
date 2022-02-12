# BREAKING_SAD

Analysis of a beer [dataset](https://www.kaggle.com/gauravharamkar/beer-data-analytics) consisting of beer features and reviews.

## Data Description

This dataset contains tasting reviews of 528870 beers (rows correspond to a single review). Features include:
* beer_ABV - numeric - alcohol by volume
* beer_beerId - numeric - unique beer ID
* beer_brewerId - numeric 
* beer_name - string - name of the beer
* beer_style - string - type of beer ie. Ale, Stout. 102 unique values
* review_appearance - numeric 0-5 
* review_palette - numeric 0-5 
* review_overall - numeric 0-5 
* review_taste - numeric 0-5 
* review_profileName - string - name of reviewer 
* review_aroma - numeric 0-5 
* review_text - sting - written review from taster
* review_time - numeric - time of review

## Reason why they selected our topic
There are over 100 categories of beer that exist int the world - Stouts, Pilsners, IPS's... the list goes on. Each beer type has distinct brewing techniques, curated over the coars of thousands of years. But can we actually taste these differences in beer styles? This dataset contains 528870 beer reviews. Our project has two main questions: 

1. Does an unsupervised machine learning algorithm trained on beer tasting data produce this abundance of beer types?
2. Can a supervised machine learning model tained on beer tasting data predict beer type?  

## Exploratory Questions:
- Overthrowing beer snobbery: This dataset indicates that there are 104 different ways of brewing a beer (column x has 104 different beer types). Can our machine learning algorithm ‘taste’ beer better than the experts?
- Can we predict beer style based on the features in this dataset?
- Can our model predict which beers are most enjoyable based on the features in this dataset?
- How does ABV affect overall scores?
- Predict which what 5 beers will continue to get the highest rating
- Group beers by ABV, Brewer, Style, and Brand to see what impacts this has on reviews
- Group by reviewID to see if certain reviewers are showing biased
- Identify positive and negative reviewers to see if they are outliers or swaying overall scores

## Group Communication
- Slack Messages
- Weekly Zoom Meetings as needed (Week 1: Monday-Thursday, Saturday)
- [Google Drive](https://drive.google.com/drive/folders/1WGlmS1NS2MW85CG1k2vxHaIE9FhGiSVK) Live Documents in Google Sheets
