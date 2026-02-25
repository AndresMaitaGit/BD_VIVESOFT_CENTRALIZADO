FROM mcr.microsoft.com/mssql/server:2022-latest

USER root
# Limpiamos y preparamos las rutas de tus variables
RUN mkdir -p /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/backup /var/opt/mssql/secrets && \
    chown -R mssql:0 /var/opt/mssql && \
    chmod -R 770 /var/opt/mssql

USER mssql
# El puerto debe coincidir con tu variable
EXPOSE 1433
CMD ["/opt/mssql/bin/sqlservr"]