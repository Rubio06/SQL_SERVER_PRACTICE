animal = "chanChito feliz"

print("convierte a mayuscula: ", animal.upper())
print("convirtiendo a minuscula: ", animal.lower())
print("convierte la primera letra en mayuscula: ", animal.capitalize())
print("convierte el inicio de cada letra en mayuscula: ", animal.title())
print("remueve todos los campos vacios del texto de izquierda a derecha: ", animal.strip())
print(animal.lstrip)
print(animal.rstrip)
print("verifica el indice en donde se encuentra la cadena", animal.find("cH"))
print("reemplaza el nCH por j", animal.replace("nCH", "j"))
print("nCH" in animal) ## devuelve un true si encuentra la cadena
print("nCH" not in animal) ## devuelve un true si encuentra la cadena
