# Define Env Variables
export NETWORK_NAME=tripviewer
export SQL_USER=sa
export SQL_PASSWORD=salkfjhs12334dLQkf@j
export SQL_DBNAME=mydrivingDB
export SQL_SERVER=sql
export ACR_REGISTRY=registrykcu5316

# Create Docker Network 
docker network create $NETWORK_NAME

# Run SQL Server Container with tripviewer network
docker run --network $NETWORK_NAME \
--name $SQL_SERVER \
-e "ACCEPT_EULA=Y" \
-e "SA_PASSWORD=$SQL_PASSWORD" \
-p 1433:1433 \
-d mcr.microsoft.com/mssql/server:2017-latest

sleep 20

# Create Database
docker exec -it $SQL_SERVER /opt/mssql-tools/bin/sqlcmd \
-S $SQL_SERVER \
-U $SQL_USER \
-P $SQL_PASSWORD \
-Q "CREATE DATABASE ${SQL_DBNAME}"

# Running ACR dataload container
docker run --network $NETWORK_NAME \
-e "SQLFQDN=$SQL_SERVER" \
-e "SQLUSER=$SQL_USER" \
-e "SQLPASS=$SQL_PASSWORD" \
-e "SQLDB=$SQL_DBNAME" \
--name dataload \
$ACR_REGISTRY.azurecr.io/dataload:1.0

# Build POI service Image
docker build -f dockerfiles/Dockerfile_3 -t "tripinsights/poi:1.0" src/poi/.

# Run POI Container
docker run --network $NETWORK_NAME \
-e "SQL_USER=$SQL_USER" \
-e "SQL_PASSWORD=$SQL_PASSWORD" \
-e "SQL_SERVER=$SQL_SERVER" \
-e "SQL_DBNAME=$SQL_DBNAME" \
-e "ASPNETCORE_ENVIRONMENT=Local"  \
-d -p 8080:80 --name poi tripinsights/poi:1.0
