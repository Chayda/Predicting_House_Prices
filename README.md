# Real Estate: Predicting House Prices
Supervised Machine Learning project to predict house prices for King County, USA.
### Contributors:
 **Asmaa Ahmed, Chayda Adora, Leonardo Aleixo, Saber Chowdhury, Xiao Wang** 
 
## Overview of Project
 
This project’s objective is to analyze the housing market sector in King County, USA between May 2014 and May 2015 and create a machine learning model which is able to predict prices and visualizations to provide insights on house sales.
 
### **Project Presentation Link (Google Slides):**
https://docs.google.com/presentation/d/1FSh0O_s-OfNs4f0mQAv_XbYGDBrPot1RKguuH9DE7T0/edit?usp=sharing

### **Tableau Dashboard Link:**
https://public.tableau.com/app/profile/leonardo.aleixo/viz/Ptest/Story1

## Why Supervised Machine Learning?
 
The housing market sector offers a variety of data where advanced regression techniques can be applied to predict price. As the data is known and the target outcome (price) is a continuous variable, Supervised Machine Learning is the appropriate approach.

#### **OLS Regression Model:**
<img width="800" alt="OLS_Regression" src="https://user-images.githubusercontent.com/74624855/143781869-0a2166de-e6be-453e-93bc-8554f855edfa.png">



### Data Source

**Name:** House Prices

**Origin:** Kaggle – Ames Housing dataset (kc_house_data.csv)  

**Publication:** House Prices - Advanced Regression Techniques | Kaggle  
 

## Questions that will be answered with the data:
* Predict housing market price 

* Differences of frequencies in sale by season

* **Correlation between:**

  - Property sales frequency and price

  - Property size and price 

  - Year the property was built and price

  - Location and price

## **Machine Learning**

#### **Description of data preprocessing:**
In this project, we examined the quality of the raw data, the following steps has been achieved prior to feeding the data into the model:
* Overview of the dataset
* Handling Null Values
* Handling missing values & duplicate rows
* Standardization of the numerical data while handling Categorical Variables

Importing the necessary libraries, including the following: Pandas_ For handling structured data, Scikit Learn_ For machine learning, NumPy_ For linear algebra and mathematics, Seaborn_ For data visualization,  Standard Scaler-For scaling and normalizing numerical data.

For the preliminary features, all available features were used that might affect the model including the date, number of bedrooms, bathrooms, floors, etc. An additional feature was added to include the month and the year to see if this would improve the model. The id column was dropped as it affects the model accuracy since it shows a high predictive value while trying to predict the price.

Data was split into training and tests sets as follows:
- **Training:** The training data consists of 21436 examples of houses with 21 features describing different aspects of the house. The training data is what is used to “teach”   the models.
- **Testing:** The test data set consists of 21436 examples with the same number of features as the training data. The test data set excludes the **sale price** because this is the dependent value (what we are trying to predict).
- Our training and testing setup is using a 70/30 train-test split ratio.

The Supervised Machine Learning model was chosen because the target outcome is already known (house price).Three different models were run and compared against each other for the accuracy outcome: Linear Regression, Decision Tree, and Random Forest.

1. **Linear Regression** returned an accuracy score of 0.68.
2. **Decision Tree** returned accuracy score of 0.75.
3. **Random Forest** returned accuracy score of 0.86.

<img width="450" alt="regressorforest_score" src="https://user-images.githubusercontent.com/74624855/143781912-68bef93b-57bd-4da5-92e1-b91805c6f2ea.png">
<img width="300" alt="regressorforest_head" src="https://user-images.githubusercontent.com/74624855/143781916-375ca4da-a77d-4f6b-86b5-d75babc3d090.png">


One of the limitations encountered with Random Forest is getting a score of 0.53 when using only the following parameters: max_dept =2 & Random state =79; however, after adding the hyper parameters such as n_estimators of 100, criterion as mse, max_depth as 100 then the model score significantly increased to 0.86. The runtime for the model was originally 32 minutes, but was decreased to 22 minutes by changing the n_jobs parameter from the default of 1 to -1, which means all processors run parallel in the backend.

### **Cleaning the data:**
Dataset has 21 columns, including the id for each house, and over 21K rows. There were no null values, but we did find duplicate rows by house id, which would indicate either the house was sold twice in this year or this was a duplicate entry. Found some duplicates and confirmed all feature details were the same including the closing date so these are duplicate entries. We decided to drop these rows as they only totalled 177. Also, an additional feature was created to show number of bedrooms by the home_size.
Correlation heatmap indicates that home_size and price had high correlation, as well as a high correlation between home_size and above_size. 

<img width="750" alt="correlation_heatmap" src="https://user-images.githubusercontent.com/74624855/144082899-ba4d9b0c-e63a-46a7-921b-51900d28dd9c.png">

Cleaned data is exported to csv and loaded into a PostgreSQL database.

## **Database ERD**

* House Database Flowchart created with QuickDBD: Raw Data Table:
<img width="800" alt="ERD_multi_table" src="https://user-images.githubusercontent.com/74624855/142777012-a84373ff-3409-422a-b428-2c4eee77b9ef.png">

The dataset for this project is simple; it was not necessary to design the database with multiple tables. A table "condition" was created to link the descriptive values for the condition column and connected to the main table as a foreign key. The schema.sql file has code for creating an inner join to query the database and return a joined table with condition description. Example:
<img width="577" alt="JOIN" src="https://user-images.githubusercontent.com/74624855/142783187-1dbfd0f0-9a52-4e3a-8e1e-0237540b4377.png">
<img width="231" alt="Joined table" src="https://user-images.githubusercontent.com/74624855/142783219-d8035b22-2745-4858-bb66-2be94eabd827.png">


Database is hosted in pgAdmin; screenshot of data loaded to house_data_clean table (via SQLAlchemy):
<img width="900" alt="DatabaseTable" src="https://user-images.githubusercontent.com/74624855/142777068-819b3876-f0e9-4f99-974d-f890156577e7.png">

#### **Connection String to RDS:**
<img width="800" alt="Connection_String" src="https://user-images.githubusercontent.com/74624855/142733428-b687af55-4e79-413f-893f-1ebb7bdbf3ce.png">

#### **Connect cleaned house data to SQL:**
<img width="800" alt="Connection_to_SQL" src="https://user-images.githubusercontent.com/74624855/142733465-7452977a-f4d9-473c-9d1e-397ee2dd1e79.png">



## **Tableau Dashboard**
Interact with the data by choosing different parameters for house size (see table below) and Rank of Units Sold (1st-70th place).
<img width="1000" alt="tableau_dashboard" src="https://user-images.githubusercontent.com/74624855/142777860-e0705a04-1a13-4583-99ba-106a286452fb.png">

#### **Market Share by Home Size**
Displays market share of the properties between May 2014 and May 2015 by home sizes, which have been divided into groups based on size in square feet. The medium-sized houses were most popular with 42.18%of the market share, and the small and large houses taking a combined market share of 49.97%. 

<img width="300" alt="House Size" src="https://user-images.githubusercontent.com/74624855/142778176-ba11ac6f-dfe6-4ea3-8e16-0bf04c05f416.png">

#### **Sales by Quarter**
Displays the total sales volume by Quarter.The 3rd quarter in 2014 has recorded the highest sales volume, hitting $3.16 billion, and then dropping to $2.50 billion in the 4th quarter. This could indicate that this is the time of year where the house prices are most competitive. Further, a Quarter on Quarter comparison of the 2nd quarter between 2014 and 2015 shows a 25% decrease in sales volume, which should be considered significant. 

#### **Sales Ranking Map**
Displays the sales ranking map based on the zip code of different areas in King County. The number on each area displays the ranking in terms of the number of houses sold between 2014 and 2015. Shoreline to the north of Seattle, has bagged 3 spots – 1st, 3rd and 5th out of the top 5 ranking and averaging 574 houses sold, and Hobart is the runner-up with 587 houses sold. No. 4 is the East side of Kirkland, closing 571 deals. On the other side of the coin, Carnation and Maury Island shows the least number of housed sold, averaging slightly over a 100 in the same period. 

### **Other visualizations in Tableau Story:**
House sales by condition, closing date, grading system, location, and comparison to ML models.

### Software/Tools:

Python, Pandas, Google Colab, Jupyter Notebook, PostgreSQL, Tableau, Supervised Machine Learning

