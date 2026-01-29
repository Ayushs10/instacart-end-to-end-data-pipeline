<h1>
  <img src="Instacart_carrot.svg.png" width="50" style="vertical-align:middle;" alt="Instacart Logo" />
  <font color="#F9F2E6">
    <span style="vertical-align:middle; margin-left:10px;">
      Instacart End-to-End Analytics Pipeline 
    </span>
  </font>
</h1>



This project simulates a real-world, production-style analytics workflow using the **Instacart Market Basket** dataset. It covers the complete lifecycle from **raw data ingestion** to a **business-ready star schema** in Snowflake and an **executive dashboard** in Tableau.

>  **Focus:** Analytics + dashboarding (KPIs, trends, business insights)  
>  **Note:** The raw dataset is 600MB, so it is **not stored in GitHub**. See **Data Setup**.

---

##  Project Overview
**Goal:** Build an end-to-end ELT pipeline and deliver actionable business insights through dashboards.

**What this project includes:**
- Ingest raw CSVs → land in Azure Blob Storage
- Build parameterized ingestion pipeline in **Azure Data Factory**
- Load into **Snowflake RAW** schema (staging)
- Transform + model into **CURATED** schema with a **star schema**
- Create a **2-page dashboard** with **5–6 KPI visuals** in **Tableau**
- Present key insights + recommendations

---

## Architecture
**Kaggle / Local CSVs**  
→ **Azure Blob Storage (RAW landing)**  
→ **Azure Data Factory (ADF) pipeline**  
→ **Snowflake RAW schema**  
→ **Snowflake CURATED schema (Star Schema)**  
→ **Tableau Dashboard**  
→ **Insights & Conclusion**

---

##  Tech Stack
- **Data Ingestion:** Azure Data Factory (ADF)
- **Storage:** Azure Blob Storage
- **Warehouse:** Snowflake
- **Modeling:** SQL (Star schema + KPI queries)
- **BI:**  Tableau
- **Version Control:** Git + GitHub

---


### Expected raw files (common Instacart set)
- `aisles.csv`
- `departments.csv`
- `products.csv`
- `orders.csv`
- `order_products__prior.csv`
- `order_products__train.csv`

---

##  Data Setup 

### (production-like): Azure Blob Storage + ADF
1. Download the dataset from Kaggle.
2. Create an Azure Blob Storage container (example: `instacart-raw`).
3. Upload all raw CSVs to the container (keep filenames consistent).
4. Verify the Blob paths match your ADF dataset configuration.

---

## Dashboard (Power BI / Tableau)

### Dashboard Summary
- **Pages:** 2  
- **KPIs/Visuals:** 5–6  
- **Audience:** business stakeholders / leadership  
- **Purpose:** analyze order behavior, reorders, and category/product performance  

### Suggested KPI Visuals (5–6)
- Total Orders (KPI card)
- Total Users / Customers (KPI card)
- Peak Ordering Hours (bar chart)
- Top Departments (bar chart)
- Top Products (table / bar chart)
- Reorder Rate / Reorder Trends (line chart / KPI card)

  
---

##  Prerequisites
- Azure account (Blob Storage + Data Factory)
- Snowflake account (warehouse + database access)
- Power BI Desktop or Tableau
- Git + VS Code (optional)

---

##  Setup & Configuration

### 1) Snowflake Setup
Run:
- `snowflake/database_schema.sql`

This typically creates:
- `RAW` schema (staging)
- `CURATED` schema (analytics-ready layer)
- required objects (tables/views/file formats/stages if included)

### 2) Azure Data Factory Setup
1. Create an ADF instance in Azure.
2. Import ADF JSON components from `/adf`:
   - `datasets/`
   - `linked_services/`
   - `pipeline/`
3. Update linked services:
   - Azure Blob Storage credentials/connection
   - Snowflake connection (account, warehouse, database, role, user)

### 3) Run the Ingestion Pipeline (ADF → Snowflake RAW)
1. Trigger the ADF pipeline.
2. Confirm RAW tables are populated in Snowflake.
3. Validate row counts and ingestion logs.

---

##  Data Modeling (Snowflake CURATED Star Schema)

After ingesting into RAW, run transformations to build a star schema.

Run:
- `snowflake/dim.sql`
- `snowflake/fact.sql`

### Star Schema Design (Example)

**Fact Table**
- `fact_order_products` (order-product transaction grain)

**Dimension Tables**
- `dim_products`
- `dim_aisles`
- `dim_departments`
- `dim_customers` (derived from orders/user_id)

 Benefits:
- fast, clean analytical queries
- consistent KPI definitions
- reliable dashboard measures

---

### Dashboard
![Dashboard Page 1](dashboard/Instacart_dashboard.png)

---

## 🔍 Sample SQL Queries (for Dashboard Validation)

Use:
- `snowflake/Dashboard_Sample_Queries.sql`

Examples you should include in this file:
- Peak order hours
- Top departments/products
- Reorder rate and reorder frequency
- Customer ordering behavior patterns
- Department-level performance KPIs

---

##  Insights 

### Insight 1 — Peak Ordering Behavior
Ordering volume is concentrated in specific time windows (peak hours), indicating predictable demand patterns.  
**Business impact:** helps optimize campaign scheduling and staffing decisions.

### Insight 2 — Department Contribution
A small set of departments contributes a large portion of overall orders, showing category concentration.  
**Business impact:** prioritize promotions and inventory planning for top departments.

### Insight 3 — Reorder Trends
Reorder behavior is strong for repeat-purchase products, indicating loyalty and predictable replenishment needs.  
**Business impact:** good candidates for subscriptions, bundles, and recommendation targeting.

### Insight 4 — Top Product Performance
Top products consistently drive volume and appear frequently in orders.  
**Business impact:** focus on availability, pricing strategy, and cross-sell opportunities.

### Insight 5 — Customer Purchase Patterns
Customers show repeat purchasing patterns across similar departments/aisles.  
**Business impact:** supports personalization and recommendation strategies.

---

## Conclusion

This project demonstrates an end-to-end analytics workflow:
- Ingested raw CSV data into **Azure Blob Storage**
- Built scalable ingestion with **Azure Data Factory**
- Loaded and modeled data in **Snowflake** using a **star schema**
- Delivered a **2-page Tableau dashboard** with **5–6 KPI visuals**
- Generated business insights that support decision-making

This mirrors real-world BI/analytics pipelines where raw operational data is transformed into decision-ready reporting.

---
