import 'package:get/get.dart';
import 'package:latihan1_10pplg1/pages/calculator_page.dart';
import 'package:latihan1_10pplg1/pages/football_page.dart';
import 'package:latihan1_10pplg1/pages/footballedit_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballedit, page: () => FootballEditPage()),
  ];
}
