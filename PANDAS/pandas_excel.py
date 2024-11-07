import pandas as pd
import os 

start_col = 5
start_row = 4

data = {
    'NOMBRE': ['enoc', 'carlos', 'roberto', 'Alaberto'],
    'APELLIDO': ['rubio', 'cardenas', 'esparado', 'Sincope'],
    'EDAD': ['22', '34', '55', '22']
}   

df = pd.DataFrame(data)

os.makedirs('archivos', exist_ok=True)
archivo_salida = 'archivos/archivo_con_bordes.xlsx'

if os.path.exists(archivo_salida):
    print("El archivo ya existe en el directorio")

with pd.ExcelWriter(archivo_salida, engine='xlsxwriter') as writer:
    archivo_excel = df.to_excel(writer, sheet_name="name_hoja", index=False, 
                startcol=start_col, startrow=start_row)

    workbook = writer.book
    worksheet = writer.sheets["name_hoja"]

    border_format = workbook.add_format({
        'border': 1,
        'border_color': 'black' 
    })
    
    for row in range(len(df) + 1):
        for col in range(len(df.columns)):
            excel_row = row + start_row  
            excel_col = col + start_col  
            value = df.columns[col] if row == 0 else df.iloc[row - 1, col]
            worksheet.write(excel_row, excel_col, value, border_format)
