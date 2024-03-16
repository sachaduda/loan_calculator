import 'package:hive/hive.dart';

part 'calculation_result_model.g.dart';

@HiveType(typeId: 2)
class CalculationResultModel {
  @HiveField(0)
  final double monthlyPayment;

  @HiveField(1)
  final double summPayment;

  @HiveField(2)
  final double overPayment;

  CalculationResultModel({
    required this.monthlyPayment,
    required this.summPayment,
    required this.overPayment,
  });

  CalculationResultModel copyWith({
    double? monthlyPayment,
    double? summPayment,
    double? overPayment,
  }) {
    return CalculationResultModel(
      monthlyPayment: monthlyPayment ?? this.monthlyPayment,
      summPayment: summPayment ?? this.summPayment,
      overPayment: overPayment ?? this.overPayment,
    );
  }

  @override
  String toString() =>
      'CalculationResultModel(monthlyPayment: $monthlyPayment, summPayment: $summPayment, overPayment: $overPayment)';

  @override
  bool operator ==(covariant CalculationResultModel other) {
    if (identical(this, other)) return true;

    return other.monthlyPayment == monthlyPayment &&
        other.summPayment == summPayment &&
        other.overPayment == overPayment;
  }

  @override
  int get hashCode => monthlyPayment.hashCode ^ summPayment.hashCode ^ overPayment.hashCode;
}
