## 📌 Project Overview
This project enables users to query a **PostgreSQL database using plain English** instead of writing SQL manually.  
It leverages **Groq LLM (LLaMA 3.1)** with prompt engineering to convert natural language questions into **accurate, schema-aware SQL queries**.

The system enforces **SQL safety rules (SELECT-only)** and executes queries on a **normalized relational database**, returning analytical results as **Pandas DataFrames** inside a **Jupyter Notebook**.

Designed to demonstrate **SQL expertise, data modeling, and AI integration** for Data Analyst roles.

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



System Architecture

User Question (English)
        ↓
Schema-Aware Prompt (Hardcoded Rules)
        ↓
Groq LLM (NL → SQL)
        ↓
SQL Validation (SELECT-only)
        ↓
PostgreSQL Execution
        ↓
Result (Pandas DataFrame)


##  Tech Stack
- Python
- PostgreSQL
- SQL
- Groq LLM (LLaMA 3.1)
- Pandas
- SQLAlchemy
- psycopg2
- Jupyter Notebook


