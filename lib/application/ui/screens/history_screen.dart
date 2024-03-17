import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_calculator/application/domain/cubits/history_cubit.dart/cubit.dart';
import 'package:loan_calculator/application/ui/widgets/circular_progress_indicator_widget.dart';
import 'package:loan_calculator/application/ui/widgets/history_card_widget.dart';
import 'package:loan_calculator/application/ui/widgets/padding_widget.dart';
import 'package:loan_calculator/application/ui/widgets/scaffold_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      title: 'История расчетов',
      body: SafeArea(
        child: PaddingWidget(
          child: BlocBuilder<HistoryCubit, HistoryState>(
            buildWhen: (previous, current) =>
                previous.state != current.state || previous.loanHistoryList != current.loanHistoryList,
            builder: (context, historyState) {
              if (historyState.loanHistoryList == null) {
                return const Center(
                  child: Text('История пуста'),
                );
              }

              WidgetsBinding.instance.addPostFrameCallback((_) {
                scrollController.jumpTo(scrollController.position.maxScrollExtent);
              });
              switch (historyState.state) {
                case HistoryCubitState.initial:
                  {
                    return const Center(
                      child: CircularProgressIndicatorWidget(),
                    );
                  }
                case HistoryCubitState.proccessing:
                  {
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicatorWidget(),
                      ),
                    );
                  }
                case HistoryCubitState.error:
                  {
                    return const Center(
                      child: Text('Произошла ошибка при загрузке данных'),
                    );
                  }
                case HistoryCubitState.withData:
                  {
                    return ListView.builder(
                      controller: scrollController,
                      reverse: true,
                      itemCount: historyState.loanHistoryList?.length,
                      itemBuilder: (context, index) {
                        final loanHistoryModel = historyState.loanHistoryList?[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: HistoryCardWidget(
                            loanHistoryModel: loanHistoryModel!,
                          ),
                        );
                      },
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
