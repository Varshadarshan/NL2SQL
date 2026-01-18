## Project Overview
This project enables users to query a **PostgreSQL database using plain English** instead of writing SQL manually.  
It leverages **Groq LLM (LLaMA 3.1)** with prompt engineering to convert natural language questions into **accurate, schema-aware SQL queries**.

The system enforces **SQL safety rules (SELECT-only)** and executes queries on a **normalized relational database**, returning analytical results as **Pandas DataFrames** inside a **Jupyter Notebook**.

Designed to demonstrate **SQL expertise, data modeling, and AI integration**.

Key Features
- Natural Language → SQL conversion using **LLM (Groq – LLaMA 3.1)**
- **Schema-aware & JOIN-aware** SQL generation
- Prompt-engineered **SQL safety** (SELECT-only, schema-restricted)
- Normalized PostgreSQL database design
- End-to-end analytics workflow in **Jupyter Notebook**


## Database Schema (Normalized)

### Customers
- `customer_id` (PK)
- `customer_name`
- `segment`
- `country`
- `city`
- `state`
- `region`

### Products
- `product_id` (PK)
- `category`
- `sub_category`
- `product_name`

### Orders
- `order_id`
- `order_date`
- `ship_date`
- `customer_id` (FK)
- `product_id` (FK)
- `sales`
- `quantity`
- `discount`
- `profit`

##  Tech Stack
- Python
- PostgreSQL
- SQL
- Groq LLM (LLaMA 3.1)
- Pandas
- SQLAlchemy
- psycopg2
- Jupyter Notebook


##  How to Use
1. Open the Jupyter Notebook
2. Ensure PostgreSQL is running and connected
3. Enter a business question in plain English
4. The system generates SQL and executes it automatically
5. Results are displayed as a Pandas DataFrame


## System Architecture

```text
User enters a question in English
        ↓
Schema-aware prompt construction
(Hardcoded database schema + SQL rules)
        ↓
Groq LLM (LLaMA 3.1)
(Natural Language → SQL generation)
        ↓
SQL safety validation
(SELECT-only, schema-restricted)
        ↓
PostgreSQL query execution
        ↓
Query results returned as Pandas DataFrame
