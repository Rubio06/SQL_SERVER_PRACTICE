
from datetime import date, time, datetime

## METODOS COMUNES Y ATRIBUTOS DE DATE
fecha_hoy = date.today()

mi_fecha = date(2024, 1, 11)
print(mi_fecha)  # 2024-10-22


print(fecha_hoy)  # Fecha actual (2024-10-22)

print("retorna el año: ", fecha_hoy.year)
print("retorna el mes: ", fecha_hoy.month)
print("retorna el dia: ", fecha_hoy.day)



dias_semana = ["lunes", "martes", "miercoles", "juevez", "viernes", "sabado", "domingo"]

for index in dias_semana:
    obtener_dia = fecha_hoy.weekday()
print(dias_semana[obtener_dia])

print(fecha_hoy.isoformat())

## METODOS PARA TIME

mi_hora = time(14, 12, 45)
print(mi_hora)  

print(mi_hora.hour)  # 14
print(mi_hora.minute)  # 30
print(mi_hora.second)  # 45





print(mi_hora.isoformat())  # 14:30:45

## FECHA Y HORA ACTUAL

fecha_hora_actual = datetime.now()

print(fecha_hora_actual.strftime('%Y/%m/%d %H:%M:%S'))  # 2024/10/22 14:30:45


print(fecha_hora_actual)





