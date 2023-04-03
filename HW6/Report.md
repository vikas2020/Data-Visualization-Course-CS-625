HW 6  Project - Initial Dataset Exploration
================
Vikas Chhillar

CS 625, Spring 2023


## Software used for this assignment.
   
For this Assignment, I used **Tableau online** for creating visualization.
and **excel software** for viewing and filtering, sorted the data.

## STEP 1.

### About Data

COVID-19 is an infectious disease caused by the SARS-CoV-2 virus. It affects the human respiratory system, making breathing difficult. It’s a contagious disease that has spread across the world like wildfire. The virus was initially discovered in Wuhan, China, in 2019. The pandemic has affected millions of people worldwide, who are either sick or have died due to the spread of this disease    
COVID-19 has affected people’s lives in many ways, from social distancing to lockdowns and quarantines. It has also affected the global economy and air quality. By comparing COVID-19 datasets with other datasets related to global economic data or air quality index data, you can gain insights into how COVID-19 has affected these areas.    

Due to the significant impact of COVID-19 on every aspect of human society, there are many sectors that have been completely disrupted. As a result, COVID-19 historical data is an excellent dataset for visualizing the changes in different aspects of society.    

For the initial exploration, I have selected the Coronavirus (COVID-19) Data in the United States from the New York Times repository (https://github.com/nytimes/covid-19-data). I am using this dataset to explore interesting insights and plan to add multiple datasets to this COVID-19 data.


The COVID-19 pandemic has caused the biggest blow to the US economy since the Great Depression. GDP fell at a 32.9% annualized rate, the deepest decline since records began back in 1947. The COVID-19 pandemic has also caused a severe disruption of the supply of goods to final consumers. Temporary disruptions were widespread and easy for consumers to observe in the empty shelves and “product temporarily unavailable” notices that were prevalent at the outset of the pandemic. In addition to consumer spending, the COVID-19 crisis has damaged the nation’s industrial production (i.e., output in the manufacturing, mining, and utility sectors).

### Choose a dataset
Dataset Selected :  Coronavirus (Covid-19) Data in the United States, New York Times - https://github.com/nytimes/covid-19-data.

This dataset contains 1159 rows and 3 columns. 
- Date ( From 21st january 2020 to 23rd january 2023 ) 
- Cases (Total number of cases)
- Death. (Total number of death)  
![](download.png)

## Step 2: Start the EDA Process
Exploratory Data Analysis (EDA) is an important step in any data analysis or data science project. EDA is the process of investigating the dataset to discover patterns and anomalies (outliers) and form hypotheses based on our understanding of the dataset. EDA involves generating summary statistics for numerical data in the dataset and creating various graphical representations to understand the data better. The goal of EDA is to maximize insights into a dataset.

After analyzing the data, I determined that for the initial visualization, I needed the total number of cases and total number of deaths per day. To achieve this, I used a formula in Microsoft Excel and added two new columns to the main dataset

- Case per date
- Death per date

![](maindata.png)

Now the first question that comes to mind is: 

Q1. What are the total number of cases and total number of deaths?

Because the dataset is quite big, I converted the date into months in Tableau for visualization.

![](q1.png)    

Q2. On which date was the highest number of COVID-19 cases reported in a single day?

![](.png)     

Q3. On which date was the highest number of COVID-19 deaths reported in a single day?

While analyzing the dataset, I found some negative values such as -2435 which appear to be mistakes in the dataset. Upon further investigation, I found that there were errors in four rows, specifically rows 502, 785, 993, and 1148.

![](.png) 

Now after the initial analysis and answering the questions. So final two questions are 

1 Does the incidence of COVID-19 infections vary with different seasons?
![](mainq1.png) 

 
### Creating Visualization in Tableau 
---    

- I used class lecture and some online search to learn about how to create **boxplt**, **eCDF** and **histogram** in **R**. 
**Boxplot**
- Firstly I imported the **required libraries** for the visualization.
- Used **read.csv** function to download data to the Rstudio
- I used **data.frame** to get three glyphs for the three columns 
- To get all glyphs in a single chart i used **rbind function**
- The population values are very big, so I find the **exponential values** as a solution for this problem. 
- x and y axis are properly labelled and also different color pallets used to make visualization effective.

![](dualaxis2.png) 

#### Observation
---
1. By looking into the boxplot chart, all three glyphs with different data, showing quite similiar population distribution.
2. There is a slight difference in th epopulation distribution of 2015 and 2019 between 10^2 -10^3. there is one extra outlier in 2019 population distribution.
3.Majority of outliers are present in the counties with maximum population distribution.
4. The median value in all 3 glyphs is quite similar so we can assume that there is approximately equal distribution between the high and low population counties
5.The outliers in the lower distribution (between 10^2 - 10^3) in estimated population distribution of both 2015 and 2019 is different from the cencus 2010.
6. Also the outliers in lower distribution is periodically increasing with respect to time. 
7. Boxplot can give a summarized view of the distribution.In other words, it can give an idea about the whole data. Also for more precise visualization we can use some other variants of box plot also. 



2. Is there a direct correlation between the rise in COVID-19 cases and the rise in deaths of infected individuals?

![](mainq2.png) 
---
### eCDF    

-eCDF is **Empirical cumulative distribution function** 
-It provides an alternative visualization of distribution.
-For this visualization I used the **CENSUS2010POP** column for the distribution of the population of all counties in the US as of the 2010 Census.  
-The **geom parameter of the stat_ecdf() function** can be used to change the shape of the ECDF plot. We can add any shape as the value of **parameter geom**. For example, we can have a **point-shaped ECDF plot** made using **stat_ecdf()** function with the geom parameter being **point**.
-I used the similar **log 10 function** to visualize the **population range**. 
-X and Y axis are properly **labelled** and also different **color pallets** used to make visualization effective.

![](dualaxis.png) 
#### Observation
---    

1.  This graph displays the data points from lowest to highest against their percentile range.
2. Between 10^2 to 10^3 there are many outliers and population distribution is not dense.That`s why there is so much white space between data points.
3. The population distribution between 10^4 and 10^6 is more dense because in this area the curve is quite strong. that means there are so many data points or we can say population distribution is high in this zone. 
4. The reason cureve is quite dense here is because I used log 10 value for the population distribution. So the distribution is compressed because of exponent of 10 scale.The curve is quite smooth as there are a lot of values that are compressed by the log10 scale. And also the main reason for using the exponential value is because the range of the values is enormous.
5. The eCDF curve is massively change its course of motion betwen 10^4 to 10^6. which implies it is the zone of median. and majority of the population distribution is in this zone




---     
## References

-   [1](https://www.vdh.virginia.gov/content/uploads/sites/182/2020/08/VA-regions_districts_localities.pdf)
-   [2](https://ggplot2.tidyverse.org/reference/geom_boxplot.html?q=boxplot#null)
-   [3](https://ggplot2.tidyverse.org/reference/geom_histogram.html?q=histogram#null)
-   [4](https://ggplot2.tidyverse.org/reference/stat_ecdf.html?q=eCDF#ref-examples?q=histigram#undefined?q=histgram#undefined)
-   [5](https://www.youtube.com/watch?v=iI8RA6fjxNg)
-   [6](https://data.virginia.gov/dataset/VDH-COVID-19-PublicUseDataset-Cases-by-Vaccination/vsrk-d6hx)
-   [7](https://www.youtube.com/watch?v=Xe4U_-o_EWw)
-   [8](https://data.virginia.gov/Government/VDH-COVID-19-PublicUseDataset-Vaccines-DosesAdmini/28k2-x2rj)
-   [9](https://wisdomanswer.com/what-is-the-advantages-and-disadvantages-of-histogram/)
-   [10](https://towardsdatascience.com/6-reasons-why-you-should-stop-using-histograms-and-which-plot-you-should-use-instead-31f937a0a81c)
