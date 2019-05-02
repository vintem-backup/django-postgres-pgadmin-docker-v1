# List of project progress

## Before 01/05/2019
* [x] STAGE 1 (pré-dev):  
Um cluster docker, simples, com único docker compose, com um container django e um container de banco de dados 

## 01/05/2019 to 
* [x] Isolar o container worker, deixando o compose na home do projeto, apontando para o dockerfile correto 
* [x] Criar o modelo-base da Shell run
* [x] Criar os volumes
* [ ] Subir servidor gunicorn + Nginx em container
* [ ] Criar diferentes docker-compose para os diferentes cenários de run
* [ ] Habilitar e testar os diferentes cenários na run
* [x] Criar container pgadmin
* [x] Finalizar a automatização da criação do superuser (apontando para variáveis de ambiente)