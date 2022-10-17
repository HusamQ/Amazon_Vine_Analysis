## Amazon Vine Analysis

# Amazon Product Review ETL. 

This analysis is to study the Amazon vine program. Amazon vine program is a paid program by Amazon to customers to review products listed on Amazon.com. 
- There are multiple categories in this program, but in this analysis I used the Grocery dataset that is offered by Amazon and availbal on an AWS S3 bucket. 
- The AWS S3 link to the review data: https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Grocery_v1_00.tsv.gz


# ETL 
Using Pyspark, the data was extracted from an AWS S3 bucket, transform the data, connect to an AWS RDS instance, and then load the transformed data into pgAdmin. Next, using SQL to determine if there is any bias toward favorable reviews from Vine members in the dataset. 

# Result

In this analysios we focus only on the reviews that gave 5 star reviews and marked as helpful reviews for these products. 
There are 14630 participants with more than 20 of total reviews. 

![Numberofvine](https://github.com/HusamQ/Amazon_Vine_Analysis/blob/2d4c9165b618dc0ce4a87b5a6dc8678289754736/Images/Nvine5star.PNG)

- Vine reviews 
![morethan20reviews](https://github.com/HusamQ/Amazon_Vine_Analysis/blob/2d4c9165b618dc0ce4a87b5a6dc8678289754736/Images/Vine%20participants.PNG)

- Non Vine Reviews
![Totalofunpaid]https://github.com/HusamQ/Amazon_Vine_Analysis/blob/2d4c9165b618dc0ce4a87b5a6dc8678289754736/Images/TotalNonVine.PNG

- Percentage of vine reviews: Total of vine helpful 5 star reviews divided by the total number of helpful and 5 star reviews
![Percentageofvine]https://github.com/HusamQ/Amazon_Vine_Analysis/blob/2d4c9165b618dc0ce4a87b5a6dc8678289754736/Images/Percentage_vine5.PNG

- Percentage of non vine reviews: The total of non vine helpful and 5 star reviews divided by the total number of helpful and 5 star reviews.
![Percentageofnonvine] (https://github.com/HusamQ/Amazon_Vine_Analysis/blob/af3cc6c2edd92b104cc6d502ffd7456768bf6347/Images/Percentage_novine.PNG)

# Summary 
Based on this dataset for Grocery products, we notice that the majority of helpful reviews came from a non vine reviewers (unpaid). As a result, I don't think there would be a bias in the reviews for these product by vine participants. 

In order to get more accurate study and analysis to measure the vine program, will need to analyze the eefect of unpaid reviews with no verified purchase on any of the products. 

