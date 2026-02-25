FROM mcr.microsoft.com/mssql/server:2022-latest

# Cambiamos a root para poder ajustar los permisos del disco
USER root

# Creamos las carpetas necesarias y les damos el dueño correcto (mssql)
RUN mkdir -p /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/secrets && \
    chown -R mssql:0 /var/opt/mssql && \
    chmod -R g=u /var/opt/mssql

# Volvemos al usuario mssql por seguridad y para que el motor arranque
USER mssql

# Exponemos el puerto estándar
EXPOSE 1433

CMD ["/opt/mssql/bin/sqlservr"]