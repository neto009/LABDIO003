docker build -t blog-net:latest .

docker run -d -p 80:80 blog-net:latest

# Login to Azure
az login

# Create a resource group
az group create --name blog-net-rg --location eastus

# Create a container registry
az acr create --resource-group blog-net-rg --name blognetacr --sku Basic

# Login to the container registry
az acr login --name blognetacr

# Tag the image with the registry name
docker tag blog-net:latest blognetacr.azurecr.io/blog-net:latest

# Push the image to the container registry
docker push blognetacr.azurecr.io/blog-net:latest

# Create Environment container app
az containerapp env create --name blog-net-env --resource-group blog-net-rg --location eastus

# Create the container app
az containerapp create --name blog-net-app --resource-group blog-net-rg --environment blog-net-env --image blognetacr.azurecr.io/blog-net:latest --target-port 80 --ingress 'external' --registry-username XXXX --registry-password XXXX --registry-server blognetacr.azurecr.io 
