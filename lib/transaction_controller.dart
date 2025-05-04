class TransactionController {
  double _balance = 0;
  double get balance => _balance;

  void deposit({required double value}) {
    if (value <= 0) {
      throw Exception('Valor inválido');
    }
    _balance += value;
  }

  void withdraw({required double value}) {
    if (value <= 0) {
      throw Exception('Valor inválido');
    }
    if (_balance < value) {
      throw Exception('Saldo insuficiente');
    }
    _balance -= value;
  }
}
