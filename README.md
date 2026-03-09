☁️ Especialista Azure vem aí 🚀
Deploy de Aplicação Containerizada com Docker e Azure Container Apps

Projeto desenvolvido durante o Bootcamp da Digital Innovation One (DIO) com foco em Docker, Azure Container Registry e Azure Container Apps.

Neste laboratório foi criado um blog simples em HTML, containerizado com Docker e publicado na Azure Cloud, utilizando Azure Container Apps.

📌 Objetivo do Projeto

Demonstrar o fluxo completo de containerização e deploy de uma aplicação web na Azure, passando por etapas fundamentais de DevOps e Cloud.

O laboratório abordou:

- criação de aplicação web simples

- containerização com Docker

- criação de imagem Docker

- envio da imagem para o Azure Container Registry

- deploy da aplicação com Azure Container Apps

- disponibilização pública da aplicação

🧰 Tecnologias Utilizadas

- HTML

- Docker

- NGINX

- Azure CLI

- Azure Container Registry (ACR)

- Azure Container Apps

- GitHub

- VS Code

📁 Estrutura do Projeto

Blog/HTML

Dockerfile| Scripts | index.html | create-post.html | post-detail.html | Dockerfile 


🐳 Containerização com Docker

A aplicação foi containerizada utilizando NGINX como servidor web.

Dockerfile
FROM nginx:latest

COPY Blog/html /usr/share/nginx/html

EXPOSE 80

Esse Dockerfile:

1️⃣ utiliza a imagem oficial do NGINX
2️⃣ copia os arquivos HTML para dentro do container
3️⃣ expõe a porta 80 para acesso web

🚀 Pipeline de Deploy

Fluxo utilizado para publicar a aplicação na Azure:

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
Azure Container Apps
     ↓
Aplicação publicada na internet
⚙️ Build da Imagem
docker build -t bsfernanda-app-001:latest .

🏷️ Tag da Imagem
docker tag bsfernanda-app-001:latest blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest

📤 Push para o Azure Container Registry
docker push blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest

☁️ Deploy no Azure Container Apps
az containerapp create \
--name bsfernanda-app-001 \
--resource-group bsfernandacontainerapp \
--environment bsfernanda-env-001 \
--image blogbsfernandaacr.azurecr.io/bsfernanda-app-001:latest \
--registry-server blogbsfernandaacr.azurecr.io \
--registry-username blogbsfernandaacr \
--registry-password ****** \
--target-port 80 \
--ingress external


🌍 Aplicação Publicada

A aplicação está disponível no endereço:

https://bsfernanda-app-001.delightfulcliff-8484e52b.eastus.azurecontainerapps.io/

📸 Demonstração

Adicionar aqui prints do projeto:

/images/docker-build.png
/images/docker-push.png
/images/container-app.png
/images/blog-running.png


📚 Aprendizados

Durante esse laboratório foram praticados conceitos importantes de Cloud e DevOps, como:

Containerização de aplicações

Criação de imagens Docker

Uso de registries de containers

Deploy de aplicações containerizadas na Azure

Utilização da Azure CLI

Publicação de aplicações na internet

👩‍💻 Autora

Fernanda Barberato

Estudante de Cloud Computing com foco em:

☁️ Azure

⚙️ DevOps

🐳 Containers

🚀 Arquitetura Cloud

📎 Referência

Projeto baseado no laboratório disponibilizado pela Digital Innovation One (DIO).
