# Marketplace

### Como foi construido

#### Atendendo aos requisitos do desafio, foi utilizado as gems
- cancancan
- rails_admin
- carrierwave-mongoid
- devise
- mongoid

#### Foi utilizado a gem devise para gerenciar o cadastro de usuários, juntamente com o login e recuperação de senha. O cancancan ficou com a parte de autorização de visualização e gerenciamento dos dados da aplicação. Por exemplo, o cancancan cuidou da parte em que controla o acesso aos dados do usuário logado, fazendo com que o usuário acesse apenas os seus dados. 

#### rails_admin é um gem que dispobiliza rotas e funcionalidades definidas para gerenciamento básico das entidades envolvidas. É na configuração desta gem que defimos os campos que vão aparecer no formulário de cadastro de cada entidade por exemplo. Indo um pouco além com esta gem, foi feita a customização de uma ação que nos possibilitou realizar uma chamada ao rails_admin para que pudesse atender ao requisito "Importar produtos de API externa". Ou seja, utilizando o rails_admin, é possivel extender suas funcionalidades, adicionando novas funcionalidades e botões na tela.

#### mongoid nos permite conectar e manipular os dados no banco de dados não relacional mongoDB.

#### carrierwave é a gem que cuida da parte de upload de arquivo. Para atender a requisitos do desafio, foi utilizado esta gem para realizar o upload de imagens ao cadastrar lojas e produtos.

