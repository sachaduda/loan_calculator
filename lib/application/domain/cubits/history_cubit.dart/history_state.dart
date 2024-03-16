part of 'cubit.dart';

enum HistoryCubitState {
  initial,
  proccessing,
  error,
  withData,
}

class HistoryState {
  final List<LoanHistoryModel?>? loanHistoryList;
  final HistoryCubitState state;

  HistoryState({
    this.loanHistoryList,
    this.state = HistoryCubitState.initial,
  });

  factory HistoryState.initial() => HistoryState(
        loanHistoryList: [],
        state: HistoryCubitState.initial,
      );

  HistoryState copyWith({
    List<LoanHistoryModel?>? loanHistoryList,
    HistoryCubitState? state,
  }) {
    return HistoryState(
      loanHistoryList: loanHistoryList ?? this.loanHistoryList,
      state: state ?? this.state,
    );
  }

  @override
  String toString() => 'HistoryState(loanHistoryList: $loanHistoryList, state: $state)';

  @override
  bool operator ==(covariant HistoryState other) {
    if (identical(this, other)) return true;

    return listEquals(other.loanHistoryList, loanHistoryList) && other.state == state;
  }

  @override
  int get hashCode => loanHistoryList.hashCode ^ state.hashCode;
}
