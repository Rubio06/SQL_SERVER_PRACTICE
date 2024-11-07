archive = open("INTERMEDIO_PYTHON\\archivos_txt\\archivo.txt", encoding="utf-8")
# leyendo archivos
# print(archive.read())



linea = archive.readlines()
archive.close()

print(linea)

