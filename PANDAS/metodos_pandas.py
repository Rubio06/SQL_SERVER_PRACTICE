# df.to_excel(
#     excel_writer, 
#     sheet_name='Sheet1', 
#     na_rep='',  'REEMPLAZA LOS VALORES NaN dentro del archivo excel'
#     float_format=None, 'Formato para valores de punto flotante. Por ejemplo, float_format="%.2f" mostrará dos decimales en los números flotantes.'
#     columns=None, 'Lista de nombres de columnas que deseas incluir en el archivo. Si no lo especificas, se escribirán todas las columnas del DataFrame.'
#     header=True, 'Define si quieres incluir los nombres de las columnas como encabezados. Si es False, no se escribirán los encabezados'
#     index=True, 'Determina si se debe escribir el índice del DataFrame como una columna en el archivo Excel. Si es False, no se incluirá el índice.'
#     index_label=None, 'Etiqueta para el índice, si deseas personalizar su nombre en el archivo. Puede ser un str (para un solo índice) o una lista (para índices múltiples).' 
#     startrow=0, 'Fila inicial en la que se escribirán los datos dentro de la hoja de Excel. Útil si necesitas escribir datos más abajo en la hoja.'
#     startcol=0, 'Columna inicial en la que se escribirán los datos en la hoja de Excel.'
#     engine=None, '(Por defecto: None) Motor de escritura a utilizar. Normalmente, pandas selecciona automáticamente el motor en función de la extensión del archivo, pero puedes especificar uno (por ejemplo, 'openpyxl' o 'xlsxwriter').'
#     merge_cells=True, '(Por defecto: True) Si True, las celdas con valores idénticos en una columna se fusionan en celdas únicas. Esto es útil si el DataFrame tiene una estructura jerárquica.'
#     encoding=None, 'Codificación para el archivo de salida. Esto es útil para archivos con caracteres especiales.'
#     inf_rep='inf', '(Por defecto: 'inf') Representación de valores infinitos (inf) en el archivo Excel.'
#     verbose=True, '(Por defecto: True) Si True, muestra información de salida adicional al escribir el archivo.'
#     freeze_panes=None '(Por defecto: None) Una tupla, como (fila, columna), que establece el punto donde se congelarán las filas y columnas cuando el archivo sea visualizado (similar a "congelar filas/columnas" en Excel). Ejemplo: (1, 0) congela la primera fila.'
# )
# pandas.DataFrame(data=None, index=None, columns=None, dtype=None, copy=False)

##################### METODOS DE PANDAS #############################

# 1. Creación de DataFrames y Series
# pd.DataFrame(data): Crear un DataFrame a partir de un diccionario, lista de listas, u otro tipo de estructura de datos.
# pd.Series(data): Crear una Serie (columna única) a partir de una lista o diccionario.




# 2. Carga y guardado de datos
# pd.read_csv('file.csv'): Leer datos desde un archivo CSV.
# pd.read_excel('file.xlsx'): Leer datos desde un archivo Excel.
# df.to_csv('file.csv'): Guardar un DataFrame en formato CSV.
# df.to_excel('file.xlsx'): Guardar un DataFrame en formato Excel.


# 3. Visualización rápida
# df.head(n): Ver las primeras n filas (por defecto, n=5).
# df.tail(n): Ver las últimas n filas.
# df.info(): Información general sobre el DataFrame (tipos de datos, valores nulos, etc.).
# df.describe(): Estadísticas descriptivas de las columnas numéricas.


# 4. Selección de datos
# df['column']: Seleccionar una columna como Serie.
# df[['col1', 'col2']]: Seleccionar varias columnas como un DataFrame.
# df.loc[row_index, 'column']: Selección por etiqueta de fila y columna.
# df.iloc[row_index, col_index]: Selección por índice de fila y columna.

import pandas as pd 


data = {
    'NOMBRE': ['enoc', 'carlos', 'roberto', 'Alaberto'],
    'APELLIDO': ['rubio', 'cardenas', 'esparado', 'Sincope'],
    'EDAD': ['22', '34', '55', '22']
}   

df = pd.DataFrame(data=data, index=None)
print(df)
print("")

#permite acceder a un registro en especifico (es como un arreglo)
print(df.iat[0,1])

print("")

# print(df.loc[3])
print(df.loc[:, 'NOMBRE'])
print("")

print(df.loc[0:, ["NOMBRE"]])









# 5. Filtrado y ordenación
# df[df['column'] > value]: Filtrar filas donde una condición sea verdadera.
# df.sort_values(by='column', ascending=True): Ordenar el DataFrame por una columna.


# 6. Manipulación de datos
# df.drop(columns=['col1', 'col2']): Eliminar columnas.
# df.drop(index): Eliminar filas por índice.
# df.rename(columns={'old_name': 'new_name'}): Renombrar columnas.
# df.set_index('column'): Establecer una columna como índice.
# df.reset_index(): Resetear el índice, convirtiéndolo en columna.
# df.assign(new_column=value): Añadir una nueva columna al DataFrame.


# 7. Tratamiento de valores nulos
# df.isnull(): Ver dónde hay valores nulos.
# df.dropna(): Eliminar filas con valores nulos.
# df.fillna(value): Rellenar valores nulos con un valor específico.


# 8. Operaciones de agrupamiento y agregación
# df.groupby('column').mean(): Agrupar por una columna y calcular la media.
# df.groupby('column').agg({'col1': 'mean', 'col2': 'sum'}): Agrupación con varias operaciones.
# df.pivot_table(values='value_column', index='row_column', columns='col_column', aggfunc='mean'): Crear tablas dinámicas.


# 9. Unión y combinación de DataFrames
# pd.concat([df1, df2]): Concatenar dos DataFrames.
# df1.merge(df2, on='column'): Hacer una combinación de DataFrames en una columna común.
# df.append(df2): Añadir filas de otro DataFrame.


# 10. Aplicación de funciones
# df['column'].apply(func): Aplicar una función a cada elemento de una columna.
# df.apply(lambda x: x.max() - x.min()): Aplicar funciones a lo largo de filas o columnas.


# 11. Conversión de tipos de datos
# df['column'].astype('int'): Convertir el tipo de una columna.
# pd.to_datetime(df['column']): Convertir una columna a formato de fecha.


# 12. Métodos de fechas y tiempos
# pd.to_datetime(df['column']): Convertir columna a datetime.
# df['column'].dt.year: Extraer el año de una columna datetime.
# df['column'].dt.month: Extraer el mes.


# 13. Operaciones avanzadas
# df.pivot(): Reestructurar el DataFrame, reorganizando columnas y filas.
# df.melt(id_vars='id_column', value_vars=['col1', 'col2']): Reorganizar un DataFrame a formato largo.
# df.duplicated(): Verificar duplicados en filas.
# df.drop_duplicates(): Eliminar filas duplicadas.