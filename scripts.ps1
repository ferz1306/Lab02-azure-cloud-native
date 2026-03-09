az login --tenant "ID do tenant" (para logar com a conta do Azure)

az extension add --name containerapp --upgrade (para instalar a extensão do container app e atualizar)

az provider register --namespace Microsoft.App (Registra o provedor de recursos do Azure Container Apps na sua assinatura)

az provider register --namespace Microsoft.OperationalInsights (Registra o provedor de recursos do Azure Container Apps na sua assinatura)

#variables
myRG= bsfernandacontainerapp
myLocation= eastus
myAppContainerEnv= bsfernanda-env-001

# create resource group
az group create --name bsfernandacontainerapp --location eastus

#Create container registry
az acr create --resource-group bsfernandacontainerapp --name blogbsfernandaacr --sku Basic

#login no acr
az acr login --name blogbsfernandaacr

#create environment variables container app
az containerapp env create --name bsfernanda-env-001 --resource-group bsfernandacontainerapp --location eastus

#Docker
docker build -t bsfernanda-app-001:latest .

#tag da imagem
docker tag bsfernanda-app-001:latest blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest

#push da imagem
docker push blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest

#criacao do container
az containerapp create --name bsfernanda-app-001 --resource-group bsfernandacontainerapp --image blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest --environment bsfernanda-env-001 --registry-server blogbsfernandaacr.azurecr.io --registry-username blogbsfernandaacr --registry-password GKZhmWQSXEzyQ5X677s2ym0kEaHRV5JLpM2Ua7GCXfCWH6swAbC8JQQJ99CCACYeBjFEqg7NAAACAZCRF92U --target-port 80 --ingress 'external'

#Container ID = blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest
#username = blogbsfernandaacr
#access key = GKZhmWQSXEzyQ5X677s2ym0kEaHRV5JLpM2Ua7GCXfCWH6swAbC8JQQJ99CCACYeBjFEqg7NAAACAZCRF92U


# container criado
https://bsfernanda-app-001.delightfulcliff-8484e52b.eastus.azurecontainerapps.io/

#Docker run 
docker run -d -p 80:80 --name bsfernanda-app-001 blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest

Fluxo

Dockerfile
     ↓
docker build
     ↓
docker tag
     ↓
docker push
     ↓
Azure Container Registry
     ↓
Container App Environment
     ↓
Container App
     ↓
URL pública









