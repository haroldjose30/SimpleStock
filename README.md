# SimpleStock



GLOBAL LAYER:
- Dependency Injection: Utilizado o Resolver como injetor de dependencias, por ser mais simples de usar, mas poderia ser utilizado qualquer outro como o Swinject, ou desenvolver um proprio.
- Clean Archtiect e SOLID: Tentei separar ao máximo as camadas e responsabilidade mesmo sendo um projeto simples para demonstrar o conhecimento sobre ambos os assuntos.
- Async/Await: Utilizei por ser mais simples e rapido, mas poderiamos utilizar Combine ou RXSwift, tenho experiencia em ambos. 

PRESENTATION LAYER:
- SwiftUI: Ecrã de Product List e Product Detail
- Atomic Design: Busquei componentizar ao máximo cada elemento de UI. Este modulo poderia futuramente ser uma biblioteca de Design System da aplicação
- MVVM Pattern: Uso do Combine (StateObject /Published) para realisar o data binding com a UI

DOMAIN LAYER:
- UseCase Pattern: Criado para centralizar as regras de negocio do resto da aplicação, alem de fazer o mapper do objeto de DTO para o objeto de negocio MODEL
- Aqui eu tambem poderia ter utilizar melhor o Combine, ao invéz do async/await para fazer uma melhor gestão do processamento que seria enviado para as thread de background e retornando para main thread o resultado que sera apresentado no ecran, evitando fazer esta gestao no ViewModel

DATA LAYER
- Repository Pattern: Foi utilizado apenas 1 Repository para gerir ambos os 2 DataSources, o LocalDataSource e o RemoteDataSource, ele ficará responsavel por decido de ontem deve buscar os dados e retornar a camada de negocio.
- URLSession: Poderia usar alamofire ou desenvolver nosso proprio clientHTTP, fiz mais simples e rapido por ser apenas 1 unico request.
- RealmDb: poderiamos utilizar tambem o coredata ou talvez o UserDefault para armazenar as informacoes de cache, mas tenho mais experiencia com Realm e pouco com CoreData

Funcionalidade 1 - lista de produtos

![image](https://raw.githubusercontent.com/haroldjose30/SimpleStock/main/Documents/ProductListPage.png)


Funcionalidade 2 - detalhe do produto

![image](https://raw.githubusercontent.com/haroldjose30/SimpleStock/main/Documents/ProductDetailPage.png)


