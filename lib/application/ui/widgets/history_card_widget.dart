import 'package:flutter/material.dart';
import 'package:loan_calculator/application/domain/models/loan_history_model/loan_history_model.dart';
import 'package:loan_calculator/application/domain/models/loan_model/loan_model.dart';

class HistoryCardWidget extends StatelessWidget {
  final LoanHistoryModel loanHistoryModel;

  const HistoryCardWidget({
    super.key,
    required this.loanHistoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.black38,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сумма кредита ${loanHistoryModel.loanModel.loanAmount}',
          ),
          Text(
            'Процент ${loanHistoryModel.loanModel.interestRate}',
          ),
          Text(
            'Срок ${loanHistoryModel.loanModel.term}',
          ),
          Text(
            'Тип платежа: ${loanHistoryModel.loanModel.amountType == AmountType.annuity ? 'Аннуитетный' : 'Дифференцированный'}',
          ),
          const Divider(),
          Text(
            'Ежемесяный платеж ${loanHistoryModel.calculationResultModel.monthlyPayment.toStringAsFixed(2)}',
          ),
          Text(
            'Общая сумма выплат ${loanHistoryModel.calculationResultModel.summPayment.toStringAsFixed(2)}',
          ),
          Text(
            'Переплата по процентам ${loanHistoryModel.calculationResultModel.overPayment.toStringAsFixed(2)}',
          )
        ],
      ),
    );
  }
}
