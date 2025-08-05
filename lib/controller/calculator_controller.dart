import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  var hasil = ''.obs;

  void hitung(String operasi) {
    int? a = int.tryParse(angka1Controller.text);
    int? b = int.tryParse(angka2Controller.text);

    if (a == null || b == null) {
      hasil.value = 'Input harus berupa bilangan bulat';
      return;
    }

    num res;
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
          hasil.value = 'Tidak bisa dibagi 0';
          return;
        }
        res = a / b;
        break;
      default:
        res = 0;
    }

    if (res is double && res != res.truncate()) {
      hasil.value = 'Hasil: ${res.toStringAsFixed(2)}';
    } else {
      hasil.value = 'Hasil: ${res.toInt()}';
    }
  }

  void reset() {
    angka1Controller.clear();
    angka2Controller.clear();
    hasil.value = '';
  }

  // cleaning controller when the page is closed, so it wont explode boom puff lmfao.
  @override
  void onClose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.onClose();
  }
}
