# Usamos la imagen oficial de SQL Server 2022 (Linux)
FROM mcr.microsoft.com/mssql/server:2022-latest

# Cambiamos a usuario root para asegurar permisos si fuera necesario
USER root

# Exponemos el puerto estándar
EXPOSE 1433

# El comando de inicio ya viene configurado en la imagen base