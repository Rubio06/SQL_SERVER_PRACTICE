with open("INTERMEDIO_PYTHON\\archivos_txt\\archivo.txt", 'r', encoding="utf-8") as archive:
    # archive.write("jajajajaja que haces gi")
    
    contenido = archive.read()
    print(contenido)

    # archive.writelines(["Hola como estas\n", "otra vez"])

