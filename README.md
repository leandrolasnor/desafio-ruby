# Marketplace

### Como foi construido

#### Atendendo aos requisitos do desafio, foi utilizado as gems
- cancancan
- rails_admin
- carrierwave-mongoid
- devise
- mongoid

#### Foi utilizado a gem devise para gerenciar o cadastro de usuários, juntamente com o login e recuperação de senha. O cancancan ficou com a parte de autorização de visualização e gerenciamento dos dados da aplicação. Por exemplo, o cancancan cuidou da parte em que controla o acesso aos dados do usuário logado, fazendo com que o usuário acesse apenas os seus dados. 

#### rails_admin é um gem que dispobiliza rotas e funcionalidades definidas para gerenciamento básico das entidades envolvidas. É na configuração desta gem que 