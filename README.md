# 🛒 Online Retail Sales Analysis Database

> A fully relational Oracle SQL project that models an e-commerce platform and extracts actionable business intelligence through structured queries, views, and stored procedures.

---

## 📌 Problem Statement

Retail businesses generate thousands of transactions daily but often lack the structured queries to answer critical business questions:
- Which products are driving revenue?
- Who are the most valuable customers?
- Which months show the strongest sales growth?
- Which customers are at risk of churning?

This project builds a normalized database from scratch and answers all of these using SQL — from basic `JOIN`s to window functions like `RANK()` and `LAG()`.

---

## 🗂️ Project Structure

```
retail-sales-sql/
│
├── sql/
│   ├── 00_run_all.sql              ← Master script (runs everything)
│   ├── 01_schema.sql               ← DDL: CREATE TABLE + indexes
│   ├── 02_data.sql                 ← DML: INSERT sample data (20 customers, 25 products, 30 orders)
│   ├── 03_analysis.sql             ← Business insight queries (6 sections)
│   └── 04_views_and_procedures.sql ← Reusable VIEWs + stored procedures
│
└── README.md
```

---

## 🏗️ Database Schema

```
Customers ──────────────────────── Orders
  customer_id  PK                    order_id      PK
  name                               customer_id   FK → Customers
  email        UNIQUE                order_date
  city                               status
  signup_date                        │
                                     └──── Order_Items
Products ───────────────────────────      item_id      PK
  product_id  PK                          order_id     FK → Orders
  name                                    product_id   FK → Products
  category                                quantity
  price                                   unit_price
  stock_qty
```

### Design Decisions
- `unit_price` stored on `Order_Items` (not pulled from Products) so historical prices are preserved even after catalog updates.
- `status` on Orders has a `CHECK` constraint limiting values to `PLACED / SHIPPED / DELIVERED / CANCELLED`.
- Indexes placed on all foreign keys and the `order_date` column for query performance.

---

## 📊 Analytical Queries Covered

| # | Query | SQL Concepts Used |
|---|-------|-------------------|
| 1A | Top 5 products by units sold | `JOIN`, `GROUP BY`, `ORDER BY`, `FETCH FIRST` |
| 1B | Top 5 products by revenue with rank | `RANK()` window function |
| 2A | Top 10 customers by lifetime value | `DENSE_RANK()`, multi-table `JOIN` |
| 2B | Customer segmentation (High/Mid/Low) | `CASE WHEN`, aggregate grouping |
| 3A | Monthly revenue summary | `TO_CHAR`, date formatting |
| 3B | Month-over-month growth % | `LAG()` window function, `NULLIF` |
| 4A | Category revenue + share % | `SUM() OVER()` (analytic), percentage calc |
| 4B | Best product per category | `RANK() OVER (PARTITION BY)` |
| 5A | Customers with zero orders | `NOT IN` subquery |
| 5B | Customers inactive for 180+ days | `HAVING`, date arithmetic |
| 6A | City-wise revenue distribution | Multi-level grouping |
| 6B | Repeat vs one-time buyer analysis | Nested subquery, `CASE WHEN` |
| 6C | Average basket size | Aggregate on aggregate |
| 6D | Dead stock (products never sold) | `NOT IN` subquery |

---

## 🔄 Views Created

| View | Purpose |
|------|---------|
| `vw_order_summary` | Full order details with customer info and totals |
| `vw_product_performance` | Each product's sales volume, revenue, and stock |
| `vw_customer_360` | Customer status: Active / At Risk / Inactive / Never Ordered |

---

## ⚙️ Stored Procedures

| Procedure | Parameters | What It Does |
|-----------|-----------|--------------|
| `sp_monthly_report` | `p_year`, `p_month` | Prints orders + revenue for a given month |
| `sp_customer_history` | `p_customer_id` | Prints all orders for a customer with totals |

---

## 🚀 How to Run

### Prerequisites
- Oracle Database (18c or above) or Oracle Live SQL (free at livesql.oracle.com)
- SQL*Plus or SQL Developer

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/retail-sales-sql.git
   cd retail-sales-sql/sql
   ```

2. Connect to your Oracle database and run the master script:
   ```sql
   @00_run_all.sql
   ```
   Or run each file individually in order:
   ```sql
   @01_schema.sql
   @02_data.sql
   @03_analysis.sql
   @04_views_and_procedures.sql
   ```

3. Enable output for stored procedures:
   ```sql
   SET SERVEROUTPUT ON
   EXEC sp_monthly_report(2024, 5);
   EXEC sp_customer_history(1001);
   ```

4. Query the views directly:
   ```sql
   SELECT * FROM vw_customer_360 ORDER BY lifetime_value DESC;
   SELECT * FROM vw_product_performance ORDER BY total_revenue DESC;
   ```

---

## 💡 Sample Output Snapshots

### Top Products by Revenue
```
PRODUCT_NAME                    CATEGORY       TOTAL_REVENUE  REVENUE_RANK
------------------------------ -------------- -------------- ------------
Air Fryer 4L Capacity           Home & Kitchen      14997.00             1
Wireless Bluetooth Headphones   Electronics         12495.00             2
Mechanical Gaming Keyboard      Electronics          7998.00             3
```

### Customer Segmentation
```
CUSTOMER_SEGMENT    COUNT
------------------- -----
High Value              3
Mid Value               8
Low Value               9
```

### Monthly Revenue Growth
```
YEAR_MONTH  MONTHLY_REVENUE  PREV_MONTH_REVENUE  GROWTH_PCT
----------  ---------------  ------------------  ----------
2024-01          8994.00                  -             -
2024-02          5196.00            8994.00        -42.23
2024-03          8794.00            5196.00         69.25
```

---

## 🧰 Technologies Used

- **Oracle SQL** — DDL, DML, DQL
- **PL/SQL** — Stored procedures, cursors, exception handling
- **SQL Window Functions** — `RANK()`, `DENSE_RANK()`, `LAG()`, `SUM() OVER()`
- **Views** — Reusable query abstractions
- **Constraints** — `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `UNIQUE`
- **Indexes** — Performance optimization on join columns

---

## 👤 Author

**Adarsh**  
Pre-Training Internship Project | Virtusa Learning & Development  

---

## 📄 License

This project is submitted as part of an academic/internship evaluation. All code is original.
