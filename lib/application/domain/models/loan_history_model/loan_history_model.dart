import 'package:hive/hive.dart';
import 'package:loan_calculator/application/domain/models/calculation_result_model/calculation_result_model.dart';
import 'package:loan_calculator/application/domain/models/loan_model/loan_model.dart';

part 'loan_history_model.g.dart';

@HiveType(typeId: 3)
class LoanHistoryModel {
  @HiveField(0)
  final LoanModel loanModel;

  @HiveField(1)
  final CalculationResultModel calculationResultModel;

  LoanHistoryModel({
    required this.loanModel,
    required this.calculationResultModel,
  });
}
