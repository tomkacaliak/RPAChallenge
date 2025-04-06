import pandas as pd
import json

def ExcelToJson(excelPath):
    try:
        df = pd.read_excel(excelPath)
        json_data = df.to_json(orient="records")
        return json.loads(json_data)
    except Exception as e:
        print(f"An error occurred while processing Excel: {e}")
    

    