import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_calculator/application/domain/cubits/history_cubit.dart/cubit.dart';
import 'package:loan_calculator/application/domain/cubits/loan_cubit/cubit.dart';
import 'package:loan_calculator/application/ui/screens/calculator_screen.dart';
import 'package:loan_calculator/application/ui/screens/history_screen.dart';

@RoutePage()
class CalculatorScreenWrapper extends StatelessWidget {
  const CalculatorScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoanCubit(),
      child: const CalculatorScreen(),
    );
  }
}

@RoutePage()
class HistoryScreenWrapper extends StatelessWidget {
  const HistoryScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(),
      child: const HistoryScreen(),
    );
  }
}
