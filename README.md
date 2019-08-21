# iMarvel
O iMarvel é um aplicativo de para o pessoal da SOUTH SYSTEM acompanhar os ultimos lançamentos do cinema ;D.
### Executando 
  ``` Este projeto foi desenvolvido utilizando xCode 10.2.1 e Swift 4.2 ``` 
  Antes de executar o projeto é necessário instalar o `cocoapods`. Caso você não tenha o `cocoapods` instalado basta apenas clicar [aqui](https://guides.cocoapods.org/using/getting-started.html) e seguir o tutorial. 
  
  Após a instalação do `cocoa pod` vá até a pasta de seu projeto e execute o comando `pod install`. Este comando irá instalar as bibliotecas de terceiros utilizadas no projeto.

### Bibliotecas 
  - ``Alamofire`` -> Biblioteca utilizada para realizar a comunicação via request com a [api do desafio](http://ec2-34-215-199-111.us-west-2.compute.amazonaws.com:5000/desafio). Para conhecer um pouco mais clique [aqui](https://github.com/Alamofire/Alamofire) 
  - `Kingfisher` -> Biblioteca utilizada para baixar e armazenar em cache imagens da web. Para conhecer um pouco mais clique [aqui](https://github.com/onevcat/Kingfisher) 
  - ``Cosmos`` -> Biblioteca utilizada para avaliação de classificação do filme por estrelas. Para conhecer um pouco mais clique [aqui](https://github.com/evgenyneu/Cosmos)

### Abrindo projeto 
Após executar o comando `pod install` vá até a pasta de seu projeto e abra o arquivo `iMarvel.xcworkspace`.

### Próximos passos 
 - Finalizar tela de detalhes.
 - Salvar dados offlines.
 - Criar testes automatizados.
 - Mudar o nome do app.
 - Criar usuário autenticado para pode salvar filmes favoritos, filmes assitidos entre outras coisas.
