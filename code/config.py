from dotenv import load_dotenv
import os 
import sys

load_dotenv() #load .env
table_to_fetch = os.getenv("table_to_fetch")