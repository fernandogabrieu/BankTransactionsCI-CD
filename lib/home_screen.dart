import 'package:flutter/material.dart';
import 'transaction_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TransactionController controller = TransactionController();
  final depositController = TextEditingController();
  final withdrawController = TextEditingController();

  @override
  void dispose() {
    depositController.dispose();
    withdrawController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transações Bancárias")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo: ${controller.balance.toStringAsFixed(2)}',
              key: const Key('saldo-text'),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),

            const Text('Depositar:', style: TextStyle(fontSize: 18)),
            TextField(
              key: const Key('deposit-input'),
              controller: depositController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              key: const Key('deposit-button'),
              onPressed: () {
                final raw = depositController.text.replaceAll(',', '.');
                final value = double.tryParse(raw);

                if (value == null || value <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Valor inválido')),
                  );
                  return;
                }

                try {
                  setState(() {
                    controller.deposit(value: value);
                    depositController.clear();
                  });
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: const Text("Depositar"),
            ),
            const SizedBox(height: 30),

            const Text('Sacar:', style: TextStyle(fontSize: 18)),
            TextField(
              key: const Key('withdraw-input'),
              controller: withdrawController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              key: const Key('withdraw-button'),
              onPressed: () {
                final raw = withdrawController.text.replaceAll(',', '.');
                final value = double.tryParse(raw);

                if (value == null || value <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Valor inválido')),
                  );
                  return;
                }

                try {
                  setState(() {
                    controller.withdraw(value: value);
                    withdrawController.clear();
                  });
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: const Text("Sacar"),
            ),
          ],
        ),
      ),
    );
  }
}
