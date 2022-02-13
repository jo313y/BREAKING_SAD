# BREAKING_SAD

Analysis of a beer [dataset](https://www.kaggle.com/gauravharamkar/beer-data-analytics) consisting of beer features and reviews.

## Data Description

This dataset contains tasting reviews of 528870 beers (rows correspond to a single review). Features include:
* beer_ABV - numeric - alcohol by volume
* beer_beerId - numeric - unique beer ID - 1 to 1 relationship with beer name
* beer_brewerId - numeric - 1 to n relationship with beer name
* beer_name - string - name of the beer
* beer_style - string - type of beer ie. Ale, Stout. 102 unique values
* review_appearance - numeric 0-5 - review of what the beer looks like
* review_palette - numeric 0-5 - review of the beer's color
* review_overall - numeric 0-5 - overall review
* review_taste - numeric 0-5 - review of the beer's taste
* review_profileName - string - name of reviewer 
* review_aroma - numeric 0-5 - review of the beer's smell
* review_text - string - written review from taster
* review_time - numeric - time of review

## Reason why we selected our topic
There are over 100 categories of beer that exist in the world - Stouts, Pilsners, IPA's... the list goes on. Each beer type has a distinct brewing technique, curated over the course of thousands of years. But can we actually taste these differences in beer styles? Our machine learning model aims to answer two main questions tha can be seen below.

## Machine learning questions
1. Does an unsupervised machine learning algorithm trained on beer tasting data produce this abundance of beer types?
2. Can a supervised machine learning model trained on beer tasting data predict beer type?  

## Exploratory Questions:
- Overthrowing beer snobbery: This dataset indicates that there are 104 different ways of brewing beer (The "beer_style" column has 104 different beer types). Can our machine learning algorithm ‘taste’ beer better than the experts?
- Can we predict beer style based on the features in this dataset?
- Can our model predict which beers are most enjoyable based on the features in this dataset?
- Predict which what 5 beers will continue to get the highest rating
- Group beers by ABV, Brewer, Style, and Brand to see what impacts this has on reviews
- Group by reviewID to see if certain reviewers are showing biased
- Identify positive and negative reviewers to see if they are outliers or swaying overall scores

## Group Communication
- Slack Messages
- Weekly Zoom Meetings as needed (Week 1: Monday-Thursday, Saturday)
- [Google Drive](https://drive.google.com/drive/folders/1WGlmS1NS2MW85CG1k2vxHaIE9FhGiSVK) Live Documents in Google Sheets

## Exploratory Plots

![bar_beerStyle.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/bar_beerStyle.png)
![boxplot_reviews.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/boxplot_reviews.png)
![boxplot_beerABV.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/boxplot_beerABV.png)
