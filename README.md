# PostDoDjango

### 1 Objetivo

Prover a estrutura mínima de um cluster baseado em containers dockers, abstraído por um docker-compose (DB + web + DB_management).  

#### 1.1 A estrutura abstraída contém os seguintes "pods": 
i. Um banco de dados ***postgreSQL***, com persistência (statefull graças a um volume docker);  
ii. Um container web, baseado em django (statefull);  
iii. Um container ***PGadmin4*** (apenas no ambiente de desenvolvimento);  
iv. Um container ***NGINX*** (apenas em produção) para tratar das solicitações ao cluster, bem como servir arquivos estáticos quando for o caso.
v. Dois volumes docker.  

### 2 Produção e Desenvolvimento

Apenas alterando a *flag* numérica na chamada da shell "***run***", este projeto permite rodar a estrutura em múltiplos modos:

#### 2.1 Em ambiente de desenvolvimento:  

O banco de dados aponta para um volume diferente do volume em produção.
Além disso o servidor Django é o ***WSGI*** em desenvolvimento e ***NGINX + Gunicorn*** em produção.  
Também é possível subir a aplicação "*Dockerizada*" ou "não *Dockerizada*" - mesmo em paralelo - pois serão servidos em portas diferentes. Isto proporciona um ritmo mais rápido em desenvovimento, já que é possível executar testes sem subir o container web (a aplicação "não *dockerizada*" consomoe os mesmos dados que a aplicação "*Dockerizada*", que são servidos pelo banco de dados DEV, que é dockerizado).  

Uma vez que que se tenha finalizado uma etapa do desenvolvimento, é possíel "*buildar*" a imagem de container - ou mesmo dar o "*push*" para seu *registrador de container* - utilizando a mesma shell "***run***", apenas alterando para a flag correspondente.

#### 2.2 Em ambiente de produção

Basta "*setar*" o serviço "***run.service***" para correr a shell "***run***" ("***sh run -0***") no início do sistema operacional.  

#### 2.3 Observações importantes:  

A shell "***run***" também **faz** as "*migrations*" e "*migrate*" automaticamente, buscando tirar vantagem desta poderosa ferramenta de gestão de banco de dados que o django tem. Entrtanto, isto pode causar alguns problemas, em caso de falta de correspondência entre os "***esquemas***" do banco de dados antes de uma migração e aqueles que serão definidos pela migração, então fique atento aos seus esquemas de dados e às mudanças nos mesmos, às vezes será preciso "arrumar na unha", mesmo em produção. Nas referências (abaixo) não pude encontrar um modo definitivo de lidar com isto sem possibilidade alguma de erros acontecere.  

**É POSSÍVEL** criar automaticamente o superusuário; a opção "*python create-super-user.py*" vem comentada por padrão, tanto na shell "***run***", quanto na shell "***entrypoint***", bastando descomentar (EM AMBAS!) para o procedimento acontecer.  

### 3 Por que Docker?

### 4 Por que Django?

### 5 Prefiro iniciar um projeto Django "do zero", como proceder?

### 6 Referências

https://realpython.com/django-migrations-a-primer/

https://medium.com/devopslinks/tech-edition-how-to-dockerize-a-django-web-app-elegantly-924c0b83575d

https://medium.com/devopslinks/tech-edition-django-dockerization-with-bells-and-whistles-and-a-tad-bit-of-cleverness-2b5d1b57e289

