part of 'cubit.dart';

class LoanCubit extends Cubit<LoanState> {
  LoanCubit() : super(LoanState.initial());
  void saveLoanAmount(String amount) {
    emit(state.copyWith(
        loanModel: state.loanModel
            .copyWith(loanAmount: amount.isEmpty ? const Wrapped.value(null) : Wrapped.value(int.tryParse(amount)))));
  }

  void saveInterestRate(String rate) {
    emit(state.copyWith(
        loanModel: state.loanModel
            .copyWith(interestRate: rate.isEmpty ? const Wrapped.value(null) : Wrapped.value(double.tryParse(rate)))));
  }

  void saveTerm(String term) {
    emit(state.copyWith(
        loanModel: state.loanModel
            .copyWith(term: term.isEmpty ? const Wrapped.value(null) : Wrapped.value(int.tryParse(term)))));
  }

  void saveAmountType(AmountType amountType) {
    emit(state.copyWith(loanModel: state.loanModel.copyWith(amountType: amountType)));
  }

  void calculateResult() async {
    final resultModel =
        state.loanModel.amountType == AmountType.annuity ? _calculateAnnuityResult() : _calculateDifferentiatedResult();

    emit(state.copyWith(calculationResultModel: resultModel));

    final loanHistory = LoanHistoryModel(
      loanModel: state.loanModel,
      calculationResultModel: resultModel,
    );

    _saveLoanHistory(loanHistory);
  }

  void _saveLoanHistory(LoanHistoryModel loanHistory) async {
    final historyBox = Hive.box<LoanHistoryModel>('history');

    await historyBox.add(loanHistory);
  }

  CalculationResultModel _calculateAnnuityResult() {
    final loanAmount = state.loanModel.loanAmount!;
    final interestRate = state.loanModel.interestRate! / (100 * 12);
    final term = state.loanModel.term!;

    final double monthlyPayment =
        loanAmount * ((interestRate * pow(1 + interestRate, term)) / ((pow((1 + interestRate), term) - 1)));
    final double summPayment = (monthlyPayment * term);
    final double overPayment = (summPayment - loanAmount);
    return CalculationResultModel(
      monthlyPayment: monthlyPayment,
      summPayment: summPayment,
      overPayment: overPayment,
    );
  }

  CalculationResultModel _calculateDifferentiatedResult() {
    final loanAmount = state.loanModel.loanAmount!;
    final interestRate = state.loanModel.interestRate! / (100 * 12);
    final term = state.loanModel.term!;

    double remainingLoanAmount = loanAmount.toDouble();
    double totalPayments = 0;

    final double monthlyPrincipalPayment = loanAmount / term;

    for (int i = 0; i < term; i++) {
      double interestPayment = remainingLoanAmount * interestRate;
      double monthlyPayment = monthlyPrincipalPayment + interestPayment;
      totalPayments += monthlyPayment;
      remainingLoanAmount -= monthlyPrincipalPayment;
    }
    return CalculationResultModel(
      monthlyPayment: monthlyPrincipalPayment,
      summPayment: totalPayments,
      overPayment: totalPayments - loanAmount,
    );
  }

  bool isFormCorrect() {
    if (state.loanModel.loanAmount == null || state.loanModel.interestRate == null || state.loanModel.term == null) {
      return false;
    } else {
      return true;
    }
  }
}
