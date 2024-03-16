part of 'cubit.dart';

class LoanState {
  final LoanModel loanModel;
  final CalculationResultModel calculationResultModel;

  LoanState({
    required this.calculationResultModel,
    required this.loanModel,
  });

  factory LoanState.initial() => LoanState(
        loanModel: LoanModel(
          amountType: AmountType.annuity,
          loanAmount: null,
          interestRate: null,
          term: null,
        ),
        calculationResultModel: CalculationResultModel(
          monthlyPayment: 0,
          summPayment: 0,
          overPayment: 0,
        ),
      );

  LoanState copyWith({
    LoanModel? loanModel,
    CalculationResultModel? calculationResultModel,
  }) {
    return LoanState(
      loanModel: loanModel ?? this.loanModel,
      calculationResultModel: calculationResultModel ?? this.calculationResultModel,
    );
  }

  @override
  String toString() => 'LoanState(loanModel: $loanModel, calculationResultModel: $calculationResultModel)';

  @override
  bool operator ==(covariant LoanState other) {
    if (identical(this, other)) return true;

    return other.loanModel == loanModel && other.calculationResultModel == calculationResultModel;
  }

  @override
  int get hashCode => loanModel.hashCode ^ calculationResultModel.hashCode;
}
