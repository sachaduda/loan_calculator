import 'package:hive/hive.dart';
import 'package:loan_calculator/application/ui/widgets/wrapped.dart';

part 'loan_model.g.dart';

@HiveType(typeId: 1)
enum AmountType {
  @HiveField(0)
  annuity,

  @HiveField(1)
  differentiated,
}

@HiveType(typeId: 0)
class LoanModel {
  @HiveField(0)
  final int? loanAmount;

  @HiveField(1)
  final double? interestRate;

  @HiveField(2)
  final int? term;

  @HiveField(3)
  final AmountType? amountType;

  LoanModel({
    this.loanAmount,
    this.interestRate,
    this.term,
    this.amountType,
  });

  LoanModel copyWith({
    Wrapped<int?>? loanAmount,
    Wrapped<double?>? interestRate,
    Wrapped<int?>? term,
    AmountType? amountType,
  }) {
    return LoanModel(
      loanAmount: loanAmount != null ? loanAmount.value : this.loanAmount,
      interestRate: interestRate != null ? interestRate.value : this.interestRate,
      term: term != null ? term.value : this.term,
      amountType: amountType ?? this.amountType,
    );
  }

  @override
  String toString() {
    return 'LoanModel(loanAmount: $loanAmount, interestRate: $interestRate, term: $term, amountType: $amountType)';
  }

  @override
  bool operator ==(covariant LoanModel other) {
    if (identical(this, other)) return true;

    return other.loanAmount == loanAmount &&
        other.interestRate == interestRate &&
        other.term == term &&
        other.amountType == amountType;
  }

  @override
  int get hashCode {
    return loanAmount.hashCode ^ interestRate.hashCode ^ term.hashCode ^ amountType.hashCode;
  }
}
