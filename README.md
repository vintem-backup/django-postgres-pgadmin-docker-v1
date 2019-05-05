# PostDoDjango

### 1 Objetivo

Prover a estrutura mínima de um cluster docker, rodando uma aplicação-modelo django com banco de dados PostgreSQL.

#### 1.1 A estrutura abstraída contém os seguintes "pods": 
i. Um banco de dados ***postgreSQL***, com persistência (statefull graças a um volume docker);  
ii. Um container web, baseado em django (stateless);  
iii. Um container ***PGadmin4*** (apenas no ambiente de homologação);  
iv. Um container ***NGINX*** (apenas em produção) para tratar das solicitações ao cluster, bem como servir arquivos estáticos quando for o caso.  
v. Volumes docker.  

### 2 Produção e Desenvolvimento

Apenas alterando a *flag* numérica na chamada da shell "***run***", este projeto permite rodar a estrutura em múltiplos modos:

#### 2.1 Em ambiente de desenvolvimento:  

O banco de dados aponta para um volume diferente do volume em produção.
Além disso o servidor Django é o ***WSGI*** em desenvolvimento e ***NGINX + Gunicorn*** em produção.  
Também é possível subir a aplicação "*Dockerizada*" ou "não *Dockerizada*" - mesmo em paralelo - pois serão servidas em portas diferentes. Isto proporciona um ritmo mais rápido em desenvovimento, já que é possível executar testes sem subir o container web pois a aplicação "não *dockerizada*" consome e opera sobre os mesmos dados que a aplicação "*Dockerizada*", que são servidos pelo banco de dados DEV, que é dockerizado.  

Uma vez que que se tenha finalizado uma etapa do desenvolvimento, é possíel "*buildar*" a imagem de container - ou mesmo dar o "*push*" para seu *registrador de container* - utilizando a mesma shell "***run***", apenas alterando para a flag correspondente.

#### 2.2 Em ambiente de produção

Basta "*setar*" o serviço "***run.service***" para correr a shell "***run***" ("***sh run 0***") no início do sistema operacional.  

#### 2.3 Observações importantes:  

A shell "***entrypoint***" (dentro do diretório worker/) também **EXECUTA** as "*migrations*" e "*migrate*" automaticamente, buscando tirar vantagem desta poderosa ferramenta de gestão de banco de dados que o django tem. Entretanto, isto pode causar alguns problemas caso falte correspondência entre os "***esquemas***" do banco de dados antes de uma migração e aqueles que serão definidos por ela. Sendo assim, esteja atento aos seus esquemas de dados e às mudanças nos mesmos; às vezes será preciso "arrumar na unha", mesmo em produção. Nas referências (abaixo) não pude encontrar um modo definitivo de lidar com isto sem possibilidade alguma de ocorência de erros.  

**É POSSÍVEL** criar automaticamente o "***superusuário***" do Django; esta tarefa é executada pelo comando "*python manage.py shell -c ...*" na shell "***entrypoint***". Caso queira criar automaticamente o superusuário, basta mudar a varíavel ***create_superuser*** para ***true*** em vez de ***false*** no arquivo de variáveis de ambinte (.env ou dev.env).

### 3 Por que Docker?

### 4 Por que Django?

### 5 Prefiro iniciar um projeto Django "do zero", como proceder?

### 6 Referências

https://docs.docker.com/compose/django/

https://medium.com/@renato.groffe/postgresql-pgadmin-4-docker-compose-montando-rapidamente-um-ambiente-para-uso-55a2ab230b89

https://medium.com/devopslinks/tech-edition-how-to-dockerize-a-django-web-app-elegantly-924c0b83575d

https://medium.com/devopslinks/tech-edition-django-dockerization-with-bells-and-whistles-and-a-tad-bit-of-cleverness-2b5d1b57e289

https://realpython.com/django-migrations-a-primer/

https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#add-or-copy

https://docs.docker.com/compose/compose-file/

https://pt.stackoverflow.com/questions/244368/d%C3%BAvida-quanto-a-marca%C3%A7%C3%A3o-volumes-dentro-do-docker-compose-yml

https://pythonacademy.com.br/blog/desenvolvimento-web-com-python-e-django-template

https://docs.docker.com/storage/volumes/

https://docs.djangoproject.com/pt-br/2.2/intro/tutorial01/





