part of 'cubit.dart';

enum LoanCubitState {
  initial,
  error,
  withData,
}

class LoanState {
  final LoanModel loanModel;
  final CalculationResultModel calculationResultModel;
  final LoanCubitState loanCubitState;

  LoanState({
    required this.loanCubitState,
    required this.calculationResultModel,
    required this.loanModel,
  });

  factory LoanState.initial() => LoanState(
        loanCubitState: LoanCubitState.initial,
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
    LoanCubitState? loanCubitState,
  }) {
    return LoanState(
      loanModel: loanModel ?? this.loanModel,
      calculationResultModel: calculationResultModel ?? this.calculationResultModel,
      loanCubitState: loanCubitState ?? this.loanCubitState,
    );
  }

  @override
  String toString() =>
      'LoanState(loanModel: $loanModel, calculationResultModel: $calculationResultModel, loanCubitState: $loanCubitState)';

  @override
  bool operator ==(covariant LoanState other) {
    if (identical(this, other)) return true;

    return other.loanModel == loanModel &&
        other.calculationResultModel == calculationResultModel &&
        other.loanCubitState == loanCubitState;
  }

  @override
  int get hashCode => loanModel.hashCode ^ calculationResultModel.hashCode ^ loanCubitState.hashCode;
}
