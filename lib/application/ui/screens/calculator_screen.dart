import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_calculator/application/domain/cubits/loan_cubit/cubit.dart';
import 'package:loan_calculator/application/domain/models/loan_model/loan_model.dart';
import 'package:loan_calculator/application/ui/widgets/dropdown_button_widget.dart';
import 'package:loan_calculator/application/ui/widgets/main_button_widget.dart';
import 'package:loan_calculator/application/ui/widgets/padding_widget.dart';
import 'package:loan_calculator/application/ui/widgets/scaffold_widget.dart';
import 'package:loan_calculator/application/ui/widgets/text_field_widget.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanCubit, LoanState>(
      buildWhen: (previous, current) =>
          previous.loanModel != current.loanModel || previous.calculationResultModel != current.calculationResultModel,
      builder: (context, calculatorState) {
        final loanCubit = context.read<LoanCubit>();

        return ScaffoldWidget(
          title: 'Калькулятор',
          body: SafeArea(
            child: PaddingWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        _TextFieldFormItem(
                          text: 'Сумма кредита',
                          textInputType: const TextInputType.numberWithOptions(),
                          textFieldType: TextFieldType.digits,
                          textInputAction: TextInputAction.next,
                          onChanged: loanCubit.saveLoanAmount,
                        ),
                        const SizedBox(height: 16),
                        _TextFieldFormItem(
                          textInputType: const TextInputType.numberWithOptions(decimal: true),
                          text: 'Процентная ставка по кредиту',
                          textInputAction: TextInputAction.next,
                          onChanged: loanCubit.saveInterestRate,
                          textFieldType: TextFieldType.percent,
                        ),
                        const SizedBox(height: 16),
                        _TextFieldFormItem(
                          text: 'Срок кредита (в месяцах)',
                          textInputType: const TextInputType.numberWithOptions(),
                          textInputAction: TextInputAction.done,
                          textFieldType: TextFieldType.digits,
                          onChanged: loanCubit.saveTerm,
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonWidget(
                          value: calculatorState.loanModel.amountType,
                          onChanged: (value) {
                            loanCubit.saveAmountType(value);
                          },
                          items: const [
                            DropdownMenuItem(
                              value: AmountType.annuity,
                              child: Text(
                                'Аннуитетный платеж',
                              ),
                            ),
                            DropdownMenuItem(
                              value: AmountType.differentiated,
                              child: Text(
                                'Дифференцированный платеж',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Ежемесячный платеж: ${loanCubit.state.calculationResultModel.monthlyPayment.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Общая сумма выплат: ${loanCubit.state.calculationResultModel.summPayment.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Переплата по процентам: ${loanCubit.state.calculationResultModel.overPayment.toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                  ),
                  MainButtonWidget(
                    buttonText: 'Рассчитать',
                    isActive: loanCubit.isFormCorrect(),
                    onPressed: () {
                      loanCubit.calculateResult();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TextFieldFormItem extends StatelessWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextFieldType textFieldType;

  const _TextFieldFormItem({
    required this.text,
    required this.onChanged,
    required this.textInputAction,
    required this.textInputType,
    required this.textFieldType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 2),
        TextFieldWidget(
          keyboardType: textInputType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          textFieldType: textFieldType,
        ),
      ],
    );
  }
}
