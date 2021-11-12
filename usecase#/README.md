Use Case #1 - Fundraising Growth/Trends Over Time <br>
    &ensp; &ensp;Distribution of Gift Range YoY and Cum YTD + Last 4 CY <br>
        &ensp; &ensp;&ensp; &ensp;Under $999; $1k-$4,999; $5k-$14,999; $15k-$24,999; $25k-$49,999; $50k-$99,999; $100k-$499,999; $500k-$999,999; $1 million+ <br>
        &ensp; &ensp;&ensp; &ensp;Same as Above by Account Record Type YTD + Last 4 CY <br>
    &ensp; &ensp;Helps Nonprofits Measure <br>
        &ensp; &ensp;&ensp; &ensp;In which giving ranges have we seen the most/least giving in a 5-year period?  <br>
        &ensp; &ensp;&ensp; &ensp;In which giving ranges have we seen the most personal vs. institutional giving in a 5-year period? <br>
    &ensp; &ensp;Typically Expressed As: Count (#), Percentage of the Whole (%), Variance (%) <br>
    &ensp; &ensp;Tables: Account (Salesforce), Opportunity (Salesforce) <br>
<br>Use Case #2 - Constituent File Analysis<br>
    &ensp; &ensp;Distribution of Accounts by Account Record Type and Geographic Location With an Overlay of Campaign Locations<br>
    &ensp; &ensp;Helps Nonprofits Measure<br>
        &ensp; &ensp;&ensp; &ensp;Where are our donors in relation to our events?<br>
        &ensp; &ensp;&ensp; &ensp;Is there any correlation between the quantity of donors per state & the events?<br>
    &ensp; &ensp;Typically Expressed As: Heatmap<br>
    &ensp; &ensp;Tables: Account (Salesforce), Campaign (Salesforce)<br>
<br>Use Case #3 - Determinants of Giving <br>
    &ensp; &ensp;Overlay Constituent File Analysis with Fundraising Growth/Trends Over Time<br>
    &ensp; &ensp;Helps Nonprofits Measure <br>
        &ensp; &ensp;&ensp; &ensp;Correlation between donor attributes and giving patterns?<br>
<br>Use Case #4 - Predictive Modeling<br>
    &ensp; &ensp;Project Distribution of Gift Range <br>
        &ensp; &ensp;&ensp; &ensp;Under $999; $1k-$4,999; $5k-$14,999; $15k-$24,999; $25k-$49,999; $50k-$99,999; $100k-$499,999; $500k-$999,999; $1 million+<br>
            &ensp; &ensp;&ensp; &ensp;YoY for the Next 3 to 5 Years<br>
        &ensp; &ensp;&ensp; &ensp;Same as Above by Account Record Type for the Next 3 to 5 Years<br>
    &ensp; &ensp;Helps Nonprofits Measure<br>
        &ensp; &ensp;&ensp; &ensp;Based on historical trends, in which giving ranges will we see the most/least giving for the next several years?<br>
        &ensp; &ensp;&ensp; &ensp;Based on historical trends, in which giving ranges will we see the most personal vs. institutional giving for the next several years?<br>
    &ensp; &ensp;Typically Expressed As: Count (#), Percentage of the Whole (%), Variance (%)<br>
    &ensp; &ensp;Tables: Account (Salesforce), Opportunity (Salesforce)<br>
<br>Observations/Recommendations<br>
    &ensp; &ensp;The location data in the account table is not clean/inconsistent<br>
        &ensp; &ensp;&ensp; &ensp;We're running across inconsistent values in the State column, such as countries/state/zip code values<br>
        &ensp; &ensp;&ensp; &ensp;Making it difficult to join to other tables and calculate the distribution of accounts<br>
