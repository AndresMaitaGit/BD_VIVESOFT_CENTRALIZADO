FROM mcr.microsoft.com/mssql/server:2022-latest

# Cambiamos a root para arreglar los permisos
USER root

# Creamos la carpeta del sistema y le damos permisos totales
RUN mkdir -p /.system /var/opt/mssql && \
    chown -R mssql:0 /.system /var/opt/mssql && \
    chmod -R 777 /.system /var/opt/mssql

# Volvemos al usuario mssql para que SQL Server inicie feliz
USER mssql

EXPOSE 1433

CMD ["/opt/mssql/bin/sqlservr"]