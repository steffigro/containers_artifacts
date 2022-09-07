# Create an AKS Cluster

az aks create \
    --resource-group teamResources \
    --name teamviewerk8s \
    --node-count 2 \
    --generate-ssh-keys \
    --attach-acr registrykcu5316

# Retrieve credentials to access the Cluster
az aks get-credentials --resource-group teamResources --name teamviewerk8s

# Create a Cluster secret called 'sql-secrets' for the SQL connection
kubectl create secret generic sql-secrets \
  --from-literal=username=sqladminkCu5316 \
  --from-literal=password='salkfjhs12334dLQkf@j'

# Deploy the 'Deployment' YAMLs to deploy the pods and services
kubectl apply -f k8s/poi-deployment.yml
kubectl apply -f k8s/trips-deployment.yml
kubectl apply -f k8s/user-java-deployment.yml
kubectl apply -f k8s/userprofile-deployment.yml
kubectl apply -f k8s/tripviewer-deployment.yml
