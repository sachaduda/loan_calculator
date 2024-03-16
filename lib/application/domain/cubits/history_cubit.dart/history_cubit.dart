part of 'cubit.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryState.initial()) {
    initialize();
  }
  void initialize() async {
    emit(state.copyWith(state: HistoryCubitState.proccessing));
    try {
      final historyBox = Hive.box<LoanHistoryModel>('history');
      final loanHistoryList = historyBox.values.toList();

      emit(state.copyWith(loanHistoryList: List.from(loanHistoryList), state: HistoryCubitState.withData));
    } catch (error) {
      emit(state.copyWith(state: HistoryCubitState.error));
    }
  }
}
