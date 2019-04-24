# PostDoDjango

### Objetivo

Prover a estrutura mínima, baseada em containers dockers e "gerida" pelo docker-compose, na forma de um cluster com os seguintes nós:

1 - Um banco de dados postgreSQL, com persistência (statefull graças a um volume docker);  
2 - Um container web, baseado em django (statefull);  
3 - Um container pgadmin4, para ambiente de desenvolvimento;  
4 - Dois volumes docker.  
