# 
export ACR_REGISTRY=registrykcu5316

docker build -f dockerfiles/Dockerfile_0 -t "registrykcu5316.azurecr.io/tripinsights/user-java:1.0" src/user-java/.
docker build -f dockerfiles/Dockerfile_1 -t "registrykcu5316.azurecr.io/tripinsights/tripviewer:1.0" src/tripviewer/.
docker build -f dockerfiles/Dockerfile_2 -t "registrykcu5316.azurecr.io/tripinsights/userprofile:1.0" src/userprofile/.
docker build -f dockerfiles/Dockerfile_3 -t "registrykcu5316.azurecr.io/tripinsights/poi:1.0" src/poi/.
docker build -f dockerfiles/Dockerfile_4 -t "registrykcu5316.azurecr.io/tripinsights/trips:1.0" src/trips/.

docker push registrykcu5316.azurecr.io/tripinsights/user-java:1.0
docker push registrykcu5316.azurecr.io/tripinsights/tripviewer:1.0
docker push registrykcu5316.azurecr.io/tripinsights/userprofile:1.0
docker push registrykcu5316.azurecr.io/tripinsights/poi:1.0
docker push registrykcu5316.azurecr.io/tripinsights/trips:1.0


# # Run POI Container
# docker run --network $NETWORK_NAME \
# -e "SQL_USER=$SQL_USER" \
# -e "SQL_PASSWORD=$SQL_PASSWORD" \
# -e "SQL_SERVER=$SQL_SERVER" \
# -e "SQL_DBNAME=$SQL_DBNAME" \
# -e "ASPNETCORE_ENVIRONMENT=Local"  \
# -d -p 8081:80 --name user-java tripinsights/user-java:1.0

