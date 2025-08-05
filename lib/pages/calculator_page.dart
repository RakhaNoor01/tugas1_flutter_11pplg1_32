import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());

    Widget buildOperatorButton(String operator) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 12),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => controller.hitung(operator), // Memanggil fungsi dari controller
        child: Text(operator == '*' ? '×' : operator == '/' ? '÷' : operator),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Kalkulator GetX'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Masukkan Dua Angka",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: controller.angka1Controller, // Menggunakan controller dari GetX
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Angka 1',
                prefixIcon: Icon(Icons.looks_one_outlined),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.angka2Controller, // Menggunakan controller dari GetX
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Angka 2',
                prefixIcon: Icon(Icons.looks_two_outlined),
              ),
            ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.8 / 1,
              children: [
                buildOperatorButton('+'),
                buildOperatorButton('-'),
                buildOperatorButton('*'),
                buildOperatorButton('/'),
              ],
            ),
            const SizedBox(height: 24),
            
            Obx(() {
              if (controller.hasil.value.isEmpty) {
                return const SizedBox.shrink();
              }
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(26),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    controller.hasil.value,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: controller.hasil.value.contains('valid') ||
                             controller.hasil.value.contains('Tidak bisa')
                          ? Colors.redAccent
                          : Colors.black87,
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
            
            ElevatedButton(
              onPressed: controller.reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
