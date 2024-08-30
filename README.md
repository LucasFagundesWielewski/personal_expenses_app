# Despesas Pessoais

Este é um aplicativo Flutter desenvolvido para gerenciar transações financeiras, permitindo adicionar, remover e visualizar suas despesas. O aplicativo inclui um gráfico de despesas semanais para acompanhar seus gastos ao longo do tempo.

## Funcionalidades

- **Adicionar novas transações:** Insira título, valor e data para cada transação.
- **Visualizar transações:** Veja todas as transações registradas em uma lista.
- **Remover transações indesejadas:** Exclua transações com facilidade.
- **Gráfico de despesas semanais:** Acompanhe seus gastos através de um gráfico interativo.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- **main.dart:** Ponto de entrada do aplicativo.
- **models/transaction.dart:** Define o modelo de dados `Transaction`.
- **components/chart.dart:** Componente que exibe o gráfico semanal de despesas.
- **components/chart_bar.dart:** Barra individual do gráfico de despesas.
- **components/transaction_form.dart:** Formulário para adicionar novas transações.
- **components/transaction_list.dart:** Lista das transações registradas.
- **components/adaptative_button.dart:** Botão adaptativo para iOS e Android.
- **components/adaptative_date_picker.dart:** Seletor de data adaptativo para iOS e Android.
- **components/adaptative_text_field.dart:** Campo de texto adaptativo para iOS e Android.

## Temas e Estilos

O aplicativo utiliza dois temas principais:
- **iOS:** Interface adaptada para dispositivos Apple com CupertinoTheme e CupertinoNavigationBar.
- **Android:** Interface com Material Design, utilizando ThemeData e AppBarTheme.

## Comportamento de Ciclo de Vida

O aplicativo reage às mudanças no ciclo de vida da aplicação, como suspensão ou retomada, utilizando o `WidgetsBindingObserver`.

## Screenshots

Aqui estão algumas capturas de tela do aplicativo:

### Tela com Transações Listadas
![Screenshot 1](assets/images/tela_card_preenchido.jpeg.jpeg)

### Tela Sem Transações Registradas
![Screenshot 2](assets/images/tela_card_vazio.jpeg.jpeg)

### Tela Vazia em Modo Paisagem
![Screenshot 3](assets/images/tela_deitada_vazia.jpeg.png)

### Tela com Transações em Modo Paisagem
![Screenshot 4](assets/images/tela_deitada_cards.jpeg.png)

### Tela com Gráfico de Despesas em Modo Paisagem
![Screenshot 5](assets/images/tela_deitada_gráfico.jpeg.png)

### Ícone do Aplicativo
![Screenshot 6](assets/icons/icone_card_app.png)

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
