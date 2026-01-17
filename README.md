# NL2SQL
Project Overview

This project enables users to query a PostgreSQL database using plain English instead of writing SQL.
It leverages a Large Language Model (LLaMA 3.1 via Groq) with prompt engineering to convert natural language business questions into safe, executable SQL queries, execute them on a normalized relational database, and return analytical results.

The system is designed for data analysts and business users to perform self-service analytics without deep SQL expertise.

Problem Statement

Business users often rely on data teams to write SQL queries for basic analytical questions, creating delays and bottlenecks.
This project solves that problem by allowing users to ask questions in natural language and receive accurate results directly from the database.

Key Features

Natural Language → SQL conversion using LLM (Groq – LLaMA 3.1)

PostgreSQL integration with normalized schema

Schema-aware and JOIN-aware SQL generation

Prompt-engineered SQL safety (SELECT-only, schema-restricted)

End-to-end analytics workflow in Jupyter Notebook

Supports aggregations, filters, joins, and sorting


Dataset

Superstore Sales Dataset (Kaggle)
~9,994 records
Cleaned and preprocessed before loading into PostgreSQL

Database Schema (Normalized)
customer
customer_id PRIMARY KEY,
customer_name,
segment,
country,
city,
state,
region

products schema
product_id PRIMARY KEY,
category,
sub_category,
product_name

orders schema
order_id,
order_date,
ship_date,
customer_id,
product_id,
sales,
quantity,
discount,
profit


System Architecture

User Question (English)
        ↓
Schema-Aware Prompt Engineering
        ↓
Groq LLM (NL → SQL)
        ↓
SQL Safety Validation
        ↓
PostgreSQL Execution
        ↓
Query Result (DataFrame)


Tech Stack
Python
PostgreSQL
SQL
Groq LLM (LLaMA 3.1)
Jupyter Notebook
pandas, psycopg2, SQLAlchemy

Setup Instructions  (cmd)
git clone https://github.com/your-username/nl2sql-superstore.git
cd nl2sql-superstore

Install Dependencies
pip install -r requirements.txt


Configure Environment Variables
Create a env.txt file:

GROQ_API_KEY=your_groq_api_key
DB_HOST=localhost
DB_PORT=5432
DB_NAME=superstore
DB_USER=postgres
DB_PASSWORD=password


Prompt Engineering Strategy
Hard-coded database schema in system prompt
Enforced rules:
Only SELECT queries allowed
Only predefined tables and columns
Proper JOIN usage required
No explanations or markdown in output
This ensures accuracy, safety, and reliability.


Use Cases

Self-service analytics for business users
Rapid data exploration by analysts
AI-assisted business intelligence
SQL automation and analytics acceleration


Future Enhancements
Streamlit or web-based UI
Data visualizations (charts & dashboards)
Query history and logging
Multi-database support


Final Note
This project demonstrates SQL expertise, data modeling, analytics thinking, and LLM integration, making it well-suited for Data Analyst, Analytics Engineer, and BI roles.
