# import modules_examples.modulo_saludar as moExample

# module = moExample.saludar("enoc")

# print(type(module))

# print(module)


from modules_examples.modulo_saludar import saludar
import sys

saludo = saludar("enoc")
print(saludo)

print(sys.builtin_module_names)



print(sys.path)

