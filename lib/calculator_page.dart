import 'package:flutter/material.dart';
// pastikan path ini sesuai

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();

  String hasil = '';

  void _hitung(String operasi) {
    double? a = double.tryParse(_angka1Controller.text);
    double? b = double.tryParse(_angka2Controller.text);

    if (a == null || b == null) {
      setState(() {
        hasil = 'Input tidak valid';
      });
      return;
    }

    double res;
    switch (operasi) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '*':
        res = a * b;
        break;
      case '/':
        if (b == 0) {
          hasil = 'Tidak bisa dibagi 0';
          setState(() {});
          return;
        }
        res = a / b;
        break;
      default:
        res = 0;
    }

    setState(() {
      hasil = 'Hasil: $res';
    });
  }

  void _reset() {
    setState(() {
      _angka1Controller.clear();
      _angka2Controller.clear();
      hasil = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _angka1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _angka2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () => _hitung('+'), child: const Text('+')),
                ElevatedButton(onPressed: () => _hitung('-'), child: const Text('-')),
                ElevatedButton(onPressed: () => _hitung('*'), child: const Text('×')),
                ElevatedButton(onPressed: () => _hitung('/'), child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              hasil,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _reset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reset'),
            ),
            
          ],
        ),
      ),
    );
  }
}
