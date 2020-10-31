## Me de um Sinal

Me de um Sinal e um software para aprendizagem de libras, utilizando uma metodologia de gamificação, 
cheios de atividades interativas e descontraida para poder aumentar o maximo a capacidade de ensino.
Ele possou um integração com uma IA, onde ele faz o procesarmento de video em tempo real, para poder 
Validade se o gerto com a mao corresponde com a lição dada pelo app.

## Desenvolvedores

* Norton Ricardo
* Wilian Antunes
* Omar
* Victor Junior 

## Ferramento utilizada no desenvolvimento

Toda aplicaçao web foi desenvolvica com Ruby on rails.
Para conseguir rodar esta aplicacao localmente e necessario fazer a instalacao das seguintes ferramentas.
* Ruby     -> version = '2.7.1'
* Rails    -> version = '6.0.2'
* postgres

Ambos o processos de instalacao pode ser feitos por este guia:
* [Instalação](https://gorails.com/setup/ubuntu/18.04)

## Rodando o Projeto
- Abra o projeto via terminar
- Execute o seguinte comando:   
  - rails db:create db:migrate (Neste passo o banco sera gerado de acordo com a aplicação)
- Execure o comando:
  - blunde install (Neste passo o camando ira instalar todas as dependencias)
- Execure o comando:
  - yarn install (Neste passo o camando ira precompilar todo front and)
- Execure o comando:
  - rails s (Neste passo o camando ira subir o servidor localmente)

## Hospedagem 

 Projeto possui uma versao beta em desenvolvimento que ja pode ser acessada pelo link:
 
 - https://medeumsinal.herokuapp.com/dashboards/home
 
   Podendo fazer liguin com usuario teste:
    - email: teste@gmail.com
    - senha: 123123
    
    Tento a funcionalidade de cadastro desponivel tambem caso queria fazer.

## Checklist das funcionalidade do app

- [x] Estrutura base para desenvolvimento com todas as dependencias
- [x] Pagina home com a apresentação do site
- [x] Pagina do loguin para acessar o site com as credenciais 
- [x] Pagina de cadastro para se registrar no site
- [x] Pagina de atividade 
- [x] Pagina de resposta da atividade
- [ ] Pagina da comunidade
- [ ] Pagina de perfil
- [ ] Integração com a IA 
- [ ] Funcionalidade para consumo da IA 
