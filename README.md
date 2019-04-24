# PostDoDjango

### Objetivo

Prover a estrutura mínima, baseada em containers dockers e "gerida" pelo docker-compose, na forma de um cluster com os seguintes nós:

1 - Um banco de dados postgreSQL, com persistência (statefull graças a um volume docker);  
2 - Um container web, baseado em django (statefull);  
3 - Um container pgadmin4, para ambiente de desenvolvimento;  
4 - Dois volumes docker.  

### References

1 - https://docs.docker.com/compose/django/  

2 - https://medium.com/devopslinks/tech-edition-how-to-dockerize-a-django-web-app-elegantly-924c0b83575d  

3 - https://medium.com/@renato.groffe/postgresql-pgadmin-4-docker-compose-montando-rapidamente-um-ambiente-para-uso-55a2ab230b89  
