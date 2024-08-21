# Despesas Pessoais

Este é um aplicativo Flutter para gerenciar transações financeiras, permitindo adicionar, remover e visualizar suas despesas. O aplicativo também inclui um gráfico de despesas semanais para acompanhar seus gastos ao longo do tempo.

## Funcionalidades

- Adicionar novas transações com título, valor e data.
- Visualizar uma lista de todas as transações registradas.
- Remover transações indesejadas.
- Acompanhar seus gastos semanais através de um gráfico interativo.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- **main.dart:** Ponto de entrada do aplicativo.
- **models/transaction.dart:** Define o modelo de dados `Transaction`.
- **components/chart.dart:** Componente que exibe o gráfico semanal de despesas.
- **components/chart_bar.dart:** Barra individual do gráfico de despesas.
- **components/transaction_form.dart:** Formulário para adicionar novas transações.
- **components/transaction_list.dart:** Lista das transações registradas.

## Screenshots

Aqui estão algumas capturas de tela do aplicativo:

![Screenshot 1](assets/images/imagem_cards.jpeg)
![Screenshot 2](assets/images/imagem_sem_cards.jpeg)
![Screenshot 3](assets/icons/icone_card_app.png)

## Como Executar

1. Certifique-se de ter o Flutter instalado na sua máquina. Para mais informações, visite a [documentação oficial](https://docs.flutter.dev/get-started/install).
2. Clone este repositório.
3. Navegue até o diretório do projeto.
4. Execute `flutter pub get` para instalar as dependências.
5. Conecte um dispositivo ou inicie um emulador.
6. Execute `flutter run` para iniciar o aplicativo.

## Dependências

Este projeto utiliza as seguintes dependências:

- `flutter_launcher_icons`
- `intl`

## Contribuindo

Contribuições são bem-vindas! Se você encontrar algum problema ou tiver uma sugestão, sinta-se à vontade para abrir uma issue ou enviar um pull request.
