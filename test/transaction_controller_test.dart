import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/transaction_controller.dart';

void main() {
  late TransactionController controller;

  setUp(() {
    controller = TransactionController();
  });

  group("Test start and all transactions logic", () {
    test("valida depósito com valor válido", () {
      expect(() => controller.deposit(value: 100.00), returnsNormally);
      expect(controller.balance, 100.00);
    });

    test("valida depósito com valor inválido", () {
      expect(
        () => controller.deposit(value: -50.00),
        throwsA(
          predicate(
            (e) => e is Exception && e.toString().contains("Valor inválido"),
          ),
        ),
      );
    });

    test("valida saque com valor menor que o saldo", () {
      controller.deposit(value: 100.00);
      controller.withdraw(value: 75.00);

      expect(controller.balance, 25.00); //novo saldo
    });

    test("valida saque com valor igual ao saldo", () {
      controller.deposit(value: 100.00);
      controller.withdraw(value: 100.00);

      expect(controller.balance, 0.00); //novo saldo
    });

    test("valida saque com saldo insuficiente", () {
      controller.deposit(value: 100.00);
      expect(
        () => controller.withdraw(value: 150.00),
        throwsA(
          predicate(
            (e) =>
                e is Exception && e.toString().contains("Saldo insuficiente"),
          ),
        ),
      );
    });

    test("valida saque com valor inválido", () {
      controller.deposit(value: 100.00);
      expect(
        () => controller.withdraw(value: -50.00),
        throwsA(
          predicate(
            (e) => e is Exception && e.toString().contains("Valor inválido"),
          ),
        ),
      );
    });

    test("realiza várias transações válidas", () {
      controller.deposit(value: 200.00);
      controller.withdraw(value: 50.00);
      controller.deposit(value: 30.00);
      controller.withdraw(value: 20.00);

      expect(controller.balance, 160.00);
    });
  });
}
