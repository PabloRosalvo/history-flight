# History Flight

## Descrição
O projeto **History Flight** é uma aplicação móvel desenvolvida para exibir o histórico de voos de um usuário, com detalhes completos de cada voo. O objetivo principal é fornecer uma interface simples e eficaz para visualizar, monitorar e gerenciar dados de voos.

## Funcionalidades
- Exibição do histórico de voos de um usuário.
- Detalhamento completo dos dados de cada voo.
- Filtros para visualização de diferentes tipos de voos (ex.: concluídos, cancelados, futuros).
- Navegação intuitiva para acessar os detalhes dos voos.

## Tecnologias Utilizadas
- **Linguagem**: Swift
- **Arquitetura**: MVVM-C (Model-View-ViewModel-Coordinator), separando claramente as responsabilidades das classes.
- **Frameworks**:
  - Combine (para programação reativa)
  - UIKit (ViewCode)
  - SwiftUI (para a tela de lista)
  - **Ferramentas de monitoramento**: NFX (para monitoramento de rede)

## Destaques do Projeto
- O projeto tem quase **100% de cobertura de testes** nas classes principais.
- O foco não foi em layout, mas a estrutura do projeto está altamente organizada e bem arquitetada.
- Utilização de **Quick** e **Nimble** para testes simples e fáceis de entender, mesmo para iniciantes.
- A view principal foi criada com **ViewCode** e a tela de lista com **SwiftUI**, de forma clean, mostrando a simplicidade da migração entre UIKit e SwiftUI.
- O projeto demonstra um sólido domínio de **arquitetura MVVM-C**, com uma clara separação de responsabilidades, tornando o código fácil de manter e escalar.

## Arquitetura e Benefícios
O projeto segue uma arquitetura bem definida com **ViewModel**, **Coordinator**, e uma **camada de rede** desacoplada, resultando em um código modular e escalável.

- **ViewModel**: Responsável pela lógica de negócios e manipulação de dados, mantendo a interface desacoplada, o que facilita a manutenção e melhora a testabilidade.
- **Coordinator**: Gerencia a navegação de forma organizada e desacoplada, permitindo fácil escalabilidade e reuso de fluxos de navegação sem afetar outras partes do código.
- **Camada de Rede**: Abstrai a comunicação com APIs, oferecendo flexibilidade e permitindo a simulação de respostas em testes, garantindo uma arquitetura testável e fácil de manter.

## Instalação
### Pré-requisitos:
- **Xcode 15.0** (Versão: 15A240d)
- **iOS 17** ou superior
- **Cocoapods** 

### Simplicidade para baixar e rodar o projeto:
1. **Baixar o projeto**: O download do projeto é simples e rápido. Basta seguir os comandos abaixo.
2. **Configuração fácil**: O projeto está pronto para ser rodado com um simples comando, tornando a instalação descomplicada.
3. **Compatibilidade**: O projeto foi desenvolvido e testado para funcionar com o Xcode 15 e iOS 17, garantindo uma experiência fluida.

### Clonando o Repositório
1. git clone https://github.com/PabloRosalvo/history-flight.git
2. rodar pod install
