# BankTransactionsCI-CD

Aplicativo Flutter didático para controle financeiro com suporte a **saques e depósitos**, desenvolvido com foco em **TDD (Test-Driven Development)** e integração contínua.

## ✨ Funcionalidades
- Exibe o saldo atual
- Permite depósitos e saques com validação de valores
- Feedback visual via SnackBar em caso de erro (ex: saldo insuficiente)
- Interface mínima e funcional

## ✅ Testes
- Testes unitários para regras de negócio (`FinancesController`)
- Testes de widget para validação de interações na interface
- Validação de exceções e fluxos incorretos

## ⚙️ CI/CD com GitHub Actions
Este projeto utiliza uma esteira de CI/CD com os seguintes passos:

1. **Checkout do repositório**
2. **Instalação do Flutter (versão 3.32.0-0.2.pre, canal beta)**
3. **Análise de código com `flutter analyze`**
4. **Execução dos testes com `flutter test --coverage`**
5. **Geração e upload do relatório de cobertura**
6. **Build do APK (debug) com `flutter build apk --debug`**
7. **Upload do APK como artefato para download**

> Todos os passos são executados automaticamente a cada `push` na branch `main`.

## Como executar localmente

```bash
flutter pub get
flutter run