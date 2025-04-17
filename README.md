# Blog Frontend Static Site

Este projeto é um site estático de blog, desenvolvido em HTML e hospedado usando o Nginx em um contêiner Docker. O objetivo é fornecer uma interface simples para visualização de posts e comentários, podendo ser facilmente implantado em ambientes de nuvem como Azure Container Apps.

## Estrutura

- `html/`: Contém os arquivos HTML do blog (`index.html`, `create-posts.html`, `post-detail.html`).
- `dockerfile`: Dockerfile para empacotar o site estático com Nginx.
- `scripts.ps1`: Script PowerShell para build, push e deploy do contêiner no Azure.

## Como executar localmente

1. **Build da imagem Docker:**
   ```sh
   docker build -t blog-net:latest .

2. **Executar o contêiner:**
   ```sh
   docker run -d -p 8080:80 blog-net:latest
   ```