import os


## retornando el la ruta del directorio
print('la ruta es ', os.getcwd())

# print(os.chdir('/ruta/a/nuevo/directorio'))

## creando directorios
crear_directorio = 'INTERMEDIO_PYTHON/modules_examples/module'

if not os.path.exists(crear_directorio):
    os.mkdir(crear_directorio)
    print("El directorio fue creado correctamente")
else:
    print("El directorio ya existe")
    
## os.chdir(path)
# Descripción: Cambia el directorio de trabajo a la ruta especificada.
os.chdir('/ruta/a/otro/directorio')

## os.listdir(path)
# Devuelve una lista de nombres de archivos y carpetas en el directorio especificado.
files = os.listdir('.')
print("Archivos y carpetas en el directorio:", files)

## os.makedirs(path)
# Crea una carpeta en la ruta especificada, creando todas las carpetas intermedias necesarias.

os.makedirs('carpeta/principal/subcarpeta')

## os.remove(path)
# Elimina el archivo especificado.
os.remove('archivo_a_eliminar.txt')

# os.rmdir(path)
# Descripción: Elimina una carpeta vacía
os.rmdir('carpeta_vacia')



# os.removedirs(path)
# Descripción: Elimina una carpeta y todas sus carpetas intermedias si están vacías.
os.removedirs('carpeta/principal/subcarpeta')

# os.rename(src, dst)
# Descripción: Cambia el nombre de un archivo o carpeta.

os.rename('archivo_viejo.txt', 'archivo_nuevo.txt')







