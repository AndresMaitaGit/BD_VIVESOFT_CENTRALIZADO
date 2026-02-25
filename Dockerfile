FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

# Crear todas las rutas que SQL Server intenta tocar por defecto
RUN mkdir -p /var/opt/mssql /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/secrets /.system /log && \
    chown -R mssql:0 /var/opt/mssql /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/secrets /.system /log && \
    chmod -R 777 /var/opt/mssql /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/secrets /.system /log

USER mssql

# Forzar los directorios mediante variables de entorno internas de SQL Server
ENV MSSQL_DATA_DIR=/var/opt/mssql/data
ENV MSSQL_LOG_DIR=/var/opt/mssql/log

CMD ["/opt/mssql/bin/sqlservr"]