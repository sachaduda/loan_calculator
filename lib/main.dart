import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loan_calculator/application/domain/models/calculation_result_model/calculation_result_model.dart';
import 'package:loan_calculator/application/domain/models/loan_history_model/loan_history_model.dart';
import 'package:loan_calculator/application/domain/models/loan_model/loan_model.dart';
import 'package:loan_calculator/application/ui/my_app.dart';
import 'package:loan_calculator/application/ui/navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeHive();

  final AppRouter router = AppRouter();
  final app = MyApp(appRouter: router);
  runApp(app);
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AmountTypeAdapter());
  Hive.registerAdapter(LoanModelAdapter());
  Hive.registerAdapter(CalculationResultModelAdapter());
  Hive.registerAdapter(LoanHistoryModelAdapter());

  await Hive.openBox<LoanHistoryModel>('history');
}
