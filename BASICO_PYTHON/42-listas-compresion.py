usuarios = [
    ["Chanchito", 4],
    ["Felipe", 1],
    ["Pulga", 5]
]

usuarios.sort(key=lambda el: el[1])
print(usuarios)

nombres = [usuario[0] for usuario in usuarios]


# filtrar 
# if usuario[1] > 2
nombres = [usuario[0] for usuario in usuarios if usuario[1] > 2]
nombres.append("Chancho blanco") 
print(nombres)

primer = {1,2,3,4,5,6,7,4,3,4,5}


print(primer)

punto = tuple([1,2] + [24,22])
print(punto)


