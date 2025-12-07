# Airbnb-Market-Insights-Analysis-of-Listings-Hosts-and-Performance
This project analyses Airbnb listings to understand pricing patterns, host activity and property performance. It focuses on key factors such as property availability, average price, host engagement and customer interest. he dashboard highlights trends in locations, room types and ratings to give a quick view of market behavior.

![zepto_home](https://github.com/saicharannetha/Airbnb-Market-Insights-Analysis-of-Listings-Hosts-and-Performance/blob/main/Dashboard/airbnb_home.png)

## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#business-problem">Business Problem</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools & Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#data-cleaning--preparation">Data Cleaning & Preparation</a>
- <a href="#exploratory-data-analysis-eda">Exploratory Data Analysis (EDA)</a>
- <a href="#research-questions--key-findings">Research Questions & Key Findings</a>
- <a href="#dashboard">Dashboard</a>
- <a href="#final-recommendations">Final Recommendations</a>
- <a href="#author--contact">Author & Contact</a>
<h2><a class="anchor" id="overview"></a>Overview</h2>

This project covers a complete data analysis workflow for Airbnb listings. It explores pricing patterns, host behaviour, property types, availability and guest demand across different locations. Using a cleaned dataset, the analysis transforms raw listing information into clear insights that support decisions related to market trends, host performance, customer preferences and overall property competitiveness.
---
<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>

- Understanding how listing attributes such as price, room type, host rating and location influence guest interest and booking behaviour.

- Identifying properties or neighbourhoods with low occupancy or weak engagement to help improve positioning, pricing or presentation.

- Analysing price patterns to spot listings that are overpriced, underpriced or inconsistent with similar properties in the area, which affects competitiveness and revenue.

- Examining availability and minimum-night requirements to detect restrictions that may limit bookings and reduce overall demand.

- Evaluating host activity, response behaviour and number of listings to understand operational reliability and its impact on guest satisfaction.

  ---
<h2><a class="anchor" id="dataset"></a>Dataset</h2>
The project uses Airbnb listing data collected from multiple neighbourhoods, each exported as a separate CSV file inside the /data/ folder. The files include details on prices, availability, host information, property features and review metrics that support the full analysis workflow.

---

<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- SQL (Common Table Expressions,views, Filtering)
  
- Python (Pandas, Matplotlib, Seaborn)
  
- Power BI (Interactive Visualizations)
  
- GitHub
---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
airbnb-analysis/
│
├── README.md
│
├── airbnb_data_cleaning.ipynb        # Data cleaning and preprocessing
│
├── airbnb_EDA/                       # Exploratory Data Analysis
│   └── airbnb_exploration.ipynb
│
├── airbnb_sql/                       # SQL queries and analysis
│   └── airbnb_queries.sql
│
├── data/                             # Raw and processed dataset files
│   └── airbnb_listings.csv
│
├── dashboard/                        # Power BI dashboards
│   └── airbnb_property_overview.pdf
│   └── airbnb_host_activity.pdf

```
---
<h2><a class="anchor" id="data-cleaning--preparation"></a>Data Cleaning & Preparation</h2>

- Here is the Airbnb version written in the same style and structure:

-  Collected Airbnb listing data from the provided CSV file.

- Loaded the dataset into the notebook for profiling and exploration.

  *Cleaned and prepared the dataset by:*

- Removing listings with missing values in key fields such as price, host information or location

- Converting data types for numeric columns like price, minimum nights and number of reviews

- Handling duplicate listings or repeated entries

- Standardising neighbourhood, room type and host-related fields to ensure consistent analysis

---
<h2><a class="anchor" id="exploratory-data-analysis-eda"></a>Exploratory Data Analysis (EDA)</h2>

**Missing or Incorrect Values Detected:**

- 34 missing values in price

- 7 missing values each in neighbourhood, room_type, minimum_nights, number_of_reviews, last_review, calculated_host_listings_count and availability_365

- Numerical missing values filled using the median

- Categorical missing values filled using the mode

**Outliers Identified:**

- 1,383 extreme price values detected using the IQR method

- Price had very high right skew before treatment, with a skewness value of 90.04

- Outliers were capped using lower and upper IQR limits

- After capping, skewness reduced to 1.02, giving a more balanced distribution

**Correlation Insights:**

- Weak correlations across most numeric variables

- Price shows no strong linear relationship with number_of_reviews, availability_365 or calculated_host_listings_count

- Review behaviour and host activity do not show strong numeric influence on pricing patterns

**Key Visualisation Insight:**

- The heatmap of average price by room type and neighbourhood shows Manhattan consistently priced at the top across all room categories

- Shared rooms in Queens and Staten Island remain the most budget-friendly

- Entire homes and hotel rooms display the widest price variation across neighbourhood groups

---
<h2>Research Questions & Key Findings</h2>

**Neighbourhood Price Differences**

- Manhattan shows the highest average prices across all room types

- Bronx and Queens offer the most affordable stays

- Action: Use neighbourhood pricing insights to guide budget-friendly recommendations

**Room Type Impact on Price**

- Entire homes and hotel rooms command the highest price premiums

- Shared and private rooms show stable and predictable pricing

- Action: Tailor pricing strategies and filters based on room-type demand patterns

**Host Activity and Listing Scale**

- Most hosts manage only 1–2 listings

- A small cluster of hosts shows unusually high listing counts, creating market concentration

- Action: Monitor high-volume hosts for consistency and compliance

**Review and Engagement Patterns**

- Large share of listings has low or no reviews

- Review count has very weak correlation with price, showing no clear premium effect

- Action: Encourage review generation to improve transparency and customer confidence

**Availability & Minimum Nights**

- Several listings have unusually high minimum-night requirements, reducing booking flexibility

- Availability varies widely across neighbourhoods

- Action: Optimise minimum-night policies to increase occupancy

  ---
## Dashboard
The [dashboard](https://app.powerbi.com/view?r=eyJrIjoiZjAwOWU3YTktZWZlZS00YWNmLThhNjktNjUzOTExM2RlNTUxIiwidCI6IjM0YzYzYTY3LTQ3MDktNDMxZS1hYTJlLTkwOTY2NjMxNTRhYyJ9) consists of 2 dashoards: 

**home**

**Page 1 – Property Overview**


- Total Price by Room Type

- Rating by Reviews by Room Type

- Total Properties by License Group

- Total Beds and Total Baths by Room Type

- Total Properties KPI, Total Reviews, Average Rating, Total Baths, Total Beds, Rooms Available

-  Price by Year

-  Property Details Table
  
**Page 2 – Host Activity and Performance**


- Count of Hosts by Neighbourhood Group


- Count of Hosts by Room Type


- Host ID by License Group

- Hosts by Year

- Host Listings, Average Reviews and Average Price by Neighbourhood Group


- Host Summary Table


- KPIs: Total Hosts, Total Revenue, Average Host Rating, Active Hosts, Avg Listings per Host, Multi-Listing Hosts, Hosts Without License

![ Property Overview](https://github.com/saicharannetha/Airbnb-Market-Insights-Analysis-of-Listings-Hosts-and-Performance/blob/main/Dashboard/airbnb_page1.png)
![ Host Activity and Performance](https://github.com/saicharannetha/Airbnb-Market-Insights-Analysis-of-Listings-Hosts-and-Performance/blob/main/Dashboard/airbnb_page2.png)

<h2><a class="anchor" id="final-recommendations"></a>Final Recommendations</h2>

***Improve Pricing Balance Across Room Types**

- Insight: Entire homes charge the highest total price across all neighbourhood groups, while shared and hotel rooms contribute very little revenue.

- Action: Introduce dynamic pricing rules for low-performing room types to increase competitiveness, especially in high-demand neighbourhoods.

- Reference: Total Price by Room Type, Average Price Heatmap

**Address License Compliance Gaps**

- Insight: A large share of listings and hosts fall under the “No License” group.

- Action: Run host-level compliance checks and onboarding reminders. Provide local regulation guidance to encourage legal hosting.

- Reference: Properties by License Group, Hosts by License Group

**Optimise Host Engagement and Capacity**

- Insight: 11K active hosts manage 21K properties, with an average of only 1.67 listings per host.

- Action: Support hosts with tools to scale responsibly, such as pricing suggestions, automated responses and performance dashboards.

- Reference: Total Hosts KPI, Avg Listings per Host

**Strengthen Neighbourhood-Level Strategy**

- Insight: Brooklyn and Manhattan dominate both listing volume and host activity, while Queens and Bronx lag behind.

- Action: Encourage growth in underrepresented areas using targeted onboarding programmes, reduced listing fees or neighbourhood promotions.

- Reference: Host Count by Neighbourhood Group, Listing Distribution

**Improve Room-Type Mix in High-Demand Areas**

- Insight: Entire homes drive the most revenue and engagement, especially in Manhattan and Brooklyn. Private rooms perform well but are underpriced relative to demand.

- Action: Adjust pricing recommendations and visibility for private rooms and shared rooms to balance supply and improve occupancy.

- Reference: Average Price by Room Type and Neighbourhood, Host Listings and Average Price

**Leverage High Review Volume to Build Trust**

- Insight: The dataset shows 885K total reviews with a healthy average rating of 3.9.

- Action: Highlight top-rated hosts and listings more prominently. Introduce “Verified Quality” badges for listings with consistently good reviews.

- Reference: Review KPIs, Rating by Reviews Analysis

**Expand High-Performing Listing Segments**

- Insight: Entire homes and private rooms generate strong activity, high review counts and stable prices.

- Action: Encourage hosts to upgrade or convert shared spaces into private rooms or entire units to improve guest appeal.

- Reference: Room Type Distribution, Rating and Price Trends


---
<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>

**Sai Charan Konam**  
Aspring Data Analyst  
📧 Email: konamsaicharannetha@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/saicharannetha/)  
