# Consulta Registro.br - BrasilAPI 

Este é um aplicativo mobile desenvolvido em **Flutter** que permite consultar a disponibilidade e informações detalhadas de domínios com final `.br`. O app consome os dados em tempo real através da **BrasilAPI**.

##Tecnologias Utilizadas
- **Flutter**: Framework UI.
- **Dart**: Linguagem de programação.
- **Dio**: Cliente HTTP para requisições à API.
- **Provider**: Gerenciamento de estado (State Management).
- **MVVM (Model-View-ViewModel)**: Padrão de arquitetura para separação de responsabilidades.

## Arquitetura do Projeto
O código está organizado seguindo o padrão MVVM para garantir escalabilidade e facilidade de manutenção:

- **Model**: Representação dos dados (DomainModel).
- **View**: Interface do usuário (Widgets e Telas).
- **ViewModel**: Lógica de negócio e ponte entre a View e o Serviço.
- **Service**: Camada de infraestrutura que lida com as requisições HTTP (Dio).

## Funcionalidades
-  Busca de domínios `.br`.
-  Interpretação automática de códigos de status (0 a 10).
-  Exibição de data de expiração e servidores DNS (Hosts).
-  Sugestão de domínios alternativos quando disponíveis.
-  Tratamento de erros para domínios inválidos ou falhas de conexão.
-  Indicador visual de carregamento.
-  Diferenciação visual por cores conforme o status do domínio.

## Como Executar o Projeto

1. **Pré-requisitos:**
   - Ter o Flutter SDK instalado (versão estável).
   - Um emulador Android/iOS ou dispositivo físico conectado.

2. **Clonar o repositório:**
   ```bash
   git clone [https://github.com/seu-usuario/nome-do-repositorio.git](https://github.com/seu-usuario/nome-do-repositorio.git)
