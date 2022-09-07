# Create Docker Network 
docker network create tripviewer

# Run SQL Server Container with tripviewer2 network
docker run --network tripviewer --name sql -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=salkfjhs12334dLQkf@j" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest