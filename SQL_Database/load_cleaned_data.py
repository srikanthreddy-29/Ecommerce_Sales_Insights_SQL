import pandas as pd
from sqlalchemy import create_engine
import os

# === ✅ Step 1: PostgreSQL connection setup ===
engine = create_engine("postgresql://postgres:postgres@localhost:5432/E-Commerce_Database")

# === ✅ Step 2: Define cleaned data folder path ===
cleaned_path = "./datasets/cleaned_data" 

# === ✅ Step 3: Map cleaned CSVs to table names ===
tables = {
    "dim_customers": pd.read_csv(os.path.join(cleaned_path, "cleaned_customers.csv")),
    "dim_geolocation": pd.read_csv(os.path.join(cleaned_path, "cleaned_geolocation.csv")),
    "dim_products": pd.read_csv(os.path.join(cleaned_path, "cleaned_products.csv")),
    "dim_sellers": pd.read_csv(os.path.join(cleaned_path, "cleaned_sellers.csv")),
    "fact_orders": pd.read_csv(os.path.join(cleaned_path, "cleaned_orders.csv")),
    "fact_order_items": pd.read_csv(os.path.join(cleaned_path, "cleaned_order_items.csv")),
    "fact_payments": pd.read_csv(os.path.join(cleaned_path, "cleaned_payments.csv")),
}

# Fixing column name mismatch
tables["dim_products"].rename(columns={"product category": "product_category"}, inplace=True)

# Fixing the Filter order_items to only valid product_ids
valid_products = set(tables["dim_products"]["product_id"])
tables["fact_order_items"] = tables["fact_order_items"][
    tables["fact_order_items"]["product_id"].isin(valid_products)
]


# === ✅ Step 4: Load each dataset into PostgreSQL ===
for table_name, df in tables.items():
    print(f"Loading table: {table_name}...")
    try:
        df.to_sql(table_name, con=engine, if_exists="append", index=False)
        print(f"Successfully loaded: {table_name}")
    except Exception as e:
        print(f"Error loading {table_name}: {e}")