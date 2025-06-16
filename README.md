# ***Sales Data Analysis Project – AtliQ Hardware (India)***

This project aims to analyze and visualize sales data for AtliQ Hardware, a company that supplies computer hardware and peripherals to various clients across India. The project involves cleaning raw data, performing SQL-based analysis, and building a Power BI dashboard to generate actionable business insights for the sales team.

## About the Business
AtliQ Hardware operates pan-India with its headquarters in Delhi and multiple regional offices. It serves clients such as Surge Stores, Nomad Stores, and others. Due to the dynamic nature of the Indian market, the Sales Director struggles to get reliable insights from regional managers who only provide verbal updates, often without evidence or data backing.

This lack of clarity in data reporting makes it difficult to make informed business decisions—especially when the overall sales are declining. The company, therefore, needs a centralized, reliable, and visual tool for daily tracking of key sales metrics.

Enable the Sales Director of AtliQ Hardware to:

- Access real-time, visual sales insights
- Understand performance by region, month, and product
- Identify currency issues, invalid transactions, and growth trends
- Make data-driven decisions to increase overall company performance

 ## Tools & Technologies Used


| Tool        | Purpose                                     |
|-------------|---------------------------------------------|
| **MySQL** | SQL queries, data extraction, cleansing     |
| **Power BI**| Data visualization and dashboard creation   |
| **MS Excel**| Supporting calculations and quick summaries |

## Dataset Overview
This project utilizes 5 primary tables from a database:

- Customers
- Date
- Markets
- products
- Transactions

## Data Analysis Using DAX (Power BI)
The following DAX measures were used to derive meaningful business insights:

### Key Measures

**Revenue = SUM('sales transactions'[sales_amount])**

**Revenue Contribution % = DIVIDE([Revenue], CALCULATE([Revenue], ALL('sales products'), ALL('sales customers'), ALL('sales markets')))**

**Revenue LY = CALCULATE([Revenue], SAMEPERIODLASTYEAR('sales date'[date]))**

**Sales Quantity = SUM('sales transactions'[sales_qty])**

**Total Profit Margin = SUM('Sales transactions'[Profit_Margin])**

**Profit Margin % = DIVIDE([Total Profit Margin], [Revenue], 0)**

**Profit Margin Contribution % = DIVIDE([Total Profit Margin], CALCULATE([Total Profit Margin], ALL('sales products'), ALL('sales customers'), ALL('sales markets')))**

### Profit Target

**Profit Target1 = GENERATESERIES(-0.05, 0.15, 0.01)**

**Profit Target Value = SELECTEDVALUE('Profit Target1'[Profit Target])**

**Target Diff = [Profit Margin %] - 'Profit Target1'[Profit Target Value]**

## Power BI Dashboard

### Key Insights

![Screenshot (163)](https://github.com/user-attachments/assets/2260d9f8-3e3b-4e7c-bba6-7f7b8c7fbcb2)

### Profit Analysis

![Screenshot (164)](https://github.com/user-attachments/assets/8d5684d8-2f31-4d1f-bcf9-89fd1d8bc55d)

### Performance Insights

![Screenshot (165)](https://github.com/user-attachments/assets/8bb7f56a-49c8-423e-97ec-495cd299efbb)

## Conclusions:

- **Sales Decline:** Total sales volume and revenue showed a significant decline in 2020, approximately 57.7% compared to 2019.
- **Top Revenue Markets:** Major revenue was generated from Delhi NCR, Mumbai, Ahmedabad, Bhopal, and Nagpur.
- **High Sales Quantity:** Maximum sales quantity was observed in Delhi NCR, Mumbai, Nagpur, Kochi, and Ahmedabad.
- **Peak Sales Months:** Most sales occurred in January, followed by November and March.
- **Low Performance Markets:** Lucknow, Surat, and Bhubaneswar reported the lowest revenue and profit margins.
- **Top Customers:** Customers like Electronics and Excel stores contributed a high profit margin (up to 45.4%).

## Recommendations:

- **Focus on Lucknow, Surat, and Bhubaneswar to redesign sales strategy and address underperformance.** 
- **Increase sales volumes in Patna, Surat, and Kanpur through localized offers and promotions.** 
- **Prioritize campaigns for Prod047 and Prod061 due to their high profitability and sales.** 
- **Offer loyalty programs and special deals to Electronics and Excel stores to retain high-profit customers.**
- **Launch marketing campaigns during January, November, and March for maximum sales impact.**
- **Align top-performing products with high-revenue regions, like promoting Prod040 in Delhi NCR or Mumbai.**



