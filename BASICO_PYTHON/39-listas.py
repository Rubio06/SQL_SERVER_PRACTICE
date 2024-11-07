
# matriz = [[0,1], [1,0]]

# print(matriz[0][1])


# nombres = ["enoc", "carlos", "alberto", "rodrigo", "gian franco"]

# print(nombres[3::])
# print(nombres[::3])

# print(nombres[2:4])


# nombres_two = ["enoc", "carlos", "alberto", "rodrigo", "gian franco"]

# _ , _ ,p1, *nombres_two = nombres_two

# print(p1)


### METODOS DE LAS LISTAS
# 1. append(x)
# Agrega un elemento x al final de la lista.

name_append = ["ernesto", "roberto"] 
name_append.append("enoc") 
print(name_append) 

# 2. extend(iterable)
# Agrega todos los elementos de un iterable (como otra lista) al final de la lista.

name_extends = ["ernesto", "roberto"]
name_extends.extend(["enoc", "carlos"])
print(name_extends) 

# 3. insert(i, x)
# Inserta un elemento x en la posición i.
name_insert = ["ernesto", "roberto"]
name_insert.insert(1, "enoc")
print(name_insert)

# 4. remove(x)
# Elimina la primera aparición del elemento x de la lista.
name_remove = ["ernesto", "roberto"]
name_remove.remove("roberto")
print(name_remove)

# 5. pop([i])
# Elimina y devuelve el elemento en la posición i.
# Si no se especifica, elimina y devuelve el último elemento.
name_pop = ["carmen", "roberto", "rogelio"]
name_pop.pop(1)
print(name_pop)

# 6. clear()
# Elimina todos los elementos de la lista.
name_clear = ["carmen", "roberto", "rogelio"]
name_clear.clear()
print(name_clear)

# 7. index(x[, start[, end]])
# Devuelve el índice de la primera aparición del elemento x.
# Puedes especificar un rango de búsqueda con start y end.
name_index = ["carmen", "roberto", "rogelio"]
index = name_index.index("roberto")
print(index)

# 8. count(x)
# Devuelve el número de veces que el elemento x aparece en la lista.
name_count = ["carmen", "roberto", "rogelio", "roberto"]
count = name_count.count("roberto")
print(count)

# 9. sort(key=None, reverse=False)
# Ordena los elementos de la lista in situ (modifica la lista original).
# Puedes usar key para especificar una función de ordenación
# y reverse=True para ordenarlos de forma descendente.
name_sort = ["carmen", "roberto", "rogelio"]
name_sort.sort(reverse=True)
print(name_sort)

# 10. reverse()
# Invierte el orden de los elementos de la lista in situ.
name_reverse = ["carmen", "roberto", "rogelio"]
name_reverse.reverse()
print(name_reverse)

# 11. copy()
# Devuelve una copia superficial de la lista.
name_copy = ["carmen", "roberto", "rogelio"]
name_copy.copy()
print(name_copy)