FROM mcr.microsoft.com/mssql/server:2022-latest

# Nos aseguramos de ser root para preparar todo
USER root

# Creamos la estructura completa antes de que el motor la pida
RUN mkdir -p /var/opt/mssql/secrets /var/opt/mssql/data /var/opt/mssql/log && \
    chmod -R 777 /var/opt/mssql && \
    chown -R root:0 /var/opt/mssql

# FORZAMOS a que el motor corra como root para evitar el error de Access Denied
# SQL Server 2022 se quejará en el log, pero funcionará
USER root

EXPOSE 1433

CMD ["/opt/mssql/bin/sqlservr"]