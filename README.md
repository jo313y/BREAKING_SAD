# Overview

Analysis of a beer [dataset](https://www.kaggle.com/gauravharamkar/beer-data-analytics) consisting of beer features and reviews.

- [Google Slides presentation](https://docs.google.com/presentation/d/1bTF2MEfPKpuOnKWnakhP0NXrdKPm-rZL-ZHQbyESMo0/edit#slide=id.p)
- [Interactive Dashboard](https://public.tableau.com/views/Final_Project_Beer/Scatter_reviewer_stats?:language=en-US&:retry=yes&:display_count=n&:origin=viz_share_link)

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
There are over 100 categories of beer that exist in the world - Stouts, Pilsners, IPA's... the list goes on. Each beer type has a distinct brewing technique, curated over the course of thousands of years. But can we actually taste these differences in beer styles? Our machine learning model aims to answer two main questions that can be seen below.

## Preliminary/Exploratory Questions
- Overthrowing beer snobbery: This dataset indicates that there are 104 different ways of brewing beer (The "beer_style" column has 104 different beer types). Can our machine learning algorithm ‘taste’ beer better than the experts?
- Can we predict beer style based on the features in this dataset?
- Can our model predict which beers are most enjoyable based on the features in this dataset?
- Predict which what 5 beers will continue to get the highest rating
- Group beers by ABV, Brewer, Style, and Brand to see what impacts this has on reviews
- Group by reviewID to see if certain reviewers are showing biased
- Identify positive and negative reviewers to see if they are outliers or swaying overall scores


## Machine Learning Questions

*Code for all machine learning models is located in Beer_Models_S3_conection.ipynb and was executed in Google Colab.*

#### 1. Does the number of clusters predicted by an unsupervised machine learning algorithm trained on beer tasting data predict a similar abundance of beer styles seen in the dataset?

Pre-processing:
- Input data was standardized features so that the mean is zero using a standard scaler. 
- We reduced the number of dimensions in the input data using a Principle Component Analysis. Three principal components were used. 

K-means:
K- means is a type of cluster analysis used to predict categorical data, making an appropriate model for predicting beer styles. 
Drawback: k-means isn't good at making generalizations about clusters of different sizes. In this dataset, each beer style is not represented equally. For example, there are over 40,000 American IPA’s but only 86 American Dark Wheat Ales. 

Input features were Using beer_ABV, review_appearance, review_palette, review_taste, review_overall and review_aroma. As seen in the elbow curve below, the line shifts to a horizontal direction at about k=9. So, we ran our k-means models with 9 clusters. Output from the k-means model is also shown in the 3-D plot below, with each cluster shown in color and shape. 

![elbow_curve.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/elbow_curve.png)
![3D_scatter_clusters.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/3D_scatter_clusters.png)

#### 2. Can a supervised machine learning model trained on beer tasting data predict beer type?  

Decision Tree:

Decision Trees can predict multiple classes - again, appropriate because we are trying to predict beer styles. Our feature columns are beer_ABV, review_appearance, review_palette, review_taste, review_overall and review_aroma. The target column is beer_style. The target and features were split into training and testing. X_train and X_test were scaled so that the mean is zero. 

Results:

After testing the decision tree model on the training data and testing it, we used a confusion matrix to assess the accuracy of the model. The accuracy score was 0.29 - not very accurate.

We decided to try to improve our accuracy by reducing the number of beer_syles that the model needed to predict. We took three approaches:

1. Manually sort beers based on our own knowledge of beer types: Lagers, stouts, ales, peters, and ‘other.’
2. Binning based on the abundance of each beer style. Using a density plot, we chose to put any beer style that appears less than 10,000 times in the dataset into an ‘Other’column. 
3. Our k-means model sorted the data into 9 clusters -we used these clusters as the target vector. 

We re-ran our decision tree using each of the three target vectors resulting in the following accuracy scores:
Manually Grouped Beer Styles: 0.53
Binned Beer Styles: 0.59
K-means Clusters: 0.99

So, according to our analysis of the beer tasting data, there are 9 distinct beer classes and our decision tree can accurately predict them 99% of the time. 

#### Model Improvements

However, as we noted earlier, beer styles are not evenly represented in this dataset -less common beers are out-represented by three orders of magnitude. This means that our model may be doing a good job of predicting common beers but not accurately predicting rare beers. This issue is called a 'class imbalance' and there are ways of dealing with it. 

We could tackle this class imbalance problem at both the unsupervised and supervised stages. For future unsupervised analyses, a Hierarchical clustering model may group our data more accurately than k-means (although a Hierarchical clustering algorithm would take a long time to run on this data!). Alternatively, beer syles could be evened out before training the supervised model: by under or oversampling our input dataset, or using combination sampling with SMOTE or SMOTEENN. 

*The Beer_Models_S3_connection.ipynb script contains the following order of operations:*

1. Read in the data from PostgreSQL DataFrame
2. Process Data for an Unsupervised Machine Learning Algorithm
	- remove unnecessary columns and rows with NA values
	- scale the data
3. Reducing Data Dimensions Using PCA
4. Clustering Beer Using K-Means
6. Process data for supervised machine learning: a decision tree
	- remove unnecessary columns and rows with NA values
	- define the target vector (beer_style)
	- split into training and testing
	- scale x_train and x_test
7. Fit the Decision Tree Model
8. Make Predictions Using the Tree Model
9. Model Evaluation using the accuracy score
10. Reducing the number of beer styles
	- manually by name
	- using binning based on the frequency
	- using the unsupervised machine learning algorithm we built earlier
11. Re-run our decision tree using these three grouping methods and compare accuracy scores

## Database
![ERD](https://github.com/jo313y/BREAKING_SAD/blob/main/ERD.png)

## Exploratory Plots

![bar_beerStyle.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/bar_beerStyle.png)
![boxplot_reviews.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/boxplot_reviews.png)
![boxplot_beerABV.png](https://github.com/jo313y/BREAKING_SAD/blob/main/Resources/boxplot_beerABV.png)
