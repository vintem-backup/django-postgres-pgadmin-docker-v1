# PostDoDjango

### Objetivo

Prover a estrutura mínima de um cluster baseado em containers dockers, abstraído por um docker-compose (DB + web + DB_management).  

- A estrutura abstraída contém os seguintes "pods": 
1 - Um banco de dados postgreSQL, com persistência (statefull graças a um volume docker);  
2 - Um container web, baseado em django (statefull);  
3 - Um container pgadmin4 (apenas no ambiente de desenvolvimento);  
4 - Dois volumes docker.  

### Produção e Desenvolvimento

Apenas alterando a *flag* numérica na chamada da run.sh, este projeto permite rodar a estrutura em múltiplos modos:

- Em ambiente de desenvolvimento:  

O banco de dados aponta para um volume diferente do volume em produção.
Além disso o servidor Django é o ***WSGI*** em desenvolvimento e ***Gunicorn*** em produção.  
Também é possível subir a aplicação "*Dockerizada*" ou "não *Dockerizada*" - mesmo em paralelo - pois serão servidos em portas diferentes. Isto proporciona um ritmo mais rápido em desenvovimento, já que é possível executar testes sem subir o container web (a aplicação "não *dockerizada*" consomoe os mesmos dados que a aplicação "*Dockerizada*", que são servidos pelo banco de dados DEV, que é dockerizado).  

- Em ambiente de produção

Basta "*setar*" o serviço para correr a run.sh (sh run.sh -0) no início do sistema operacional.  

- Observações importantes:  

> A shell run.sh também **faz** as "*migrations*" e "*migrate*" automaticamente, buscando tirar vantagem desta poderosa ferramenta de gestão de banco de dados que o django tem. Entrtanto, isto pode causar alguns problemas, em caso de falta de correspondência entre os "***esquemas***" do banco de dados antes de uma migração e aqueles que serão definidos pela migração, então fique atento aos seus esquemas de dados e às mudanças nos mesmos, às vezes será preciso "arrumar na unha", mesmo em produção. Nas referências (abaixo) não pude encontrar um modo definitivo de lidar com isto sem possibilidade alguma de erros acontecere.  

> **É POSSÍVEL** criar automaticamente o superusuário; a opção "*python create-super-user.py*" vem comentada por padrão, tanto na shell run, quanto na shell "*entrypoint*", bastando descomentar (EM AMBAS!) para o procedimento acontecer.  

### Por que Docker?

### Por que Django?

### Prefiro iniciar um projeto Django "do zero", como proceder?

### Referências

https://realpython.com/django-migrations-a-primer/

https://medium.com/devopslinks/tech-edition-how-to-dockerize-a-django-web-app-elegantly-924c0b83575d

https://medium.com/devopslinks/tech-edition-django-dockerization-with-bells-and-whistles-and-a-tad-bit-of-cleverness-2b5d1b57e289

