import pandas as pd

xl = pd.ExcelFile("data/domestic_garden_database.xlsx")

for sheet in ["Fauna", "Objects and other", "Garden Styles"]:
    print(f"\n=== {sheet} ===")
    df = pd.read_excel(xl, sheet)
    print(f"Rows: {len(df)}")

    for col in df.columns:
        max_len = df[col].astype(str).str.len().max()
        if max_len > 255:
            print(f"  {col}: {max_len} chars (TOO LONG)")
