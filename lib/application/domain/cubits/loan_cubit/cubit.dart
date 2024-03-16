import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:loan_calculator/application/domain/models/calculation_result_model/calculation_result_model.dart';
import 'package:loan_calculator/application/domain/models/loan_history_model/loan_history_model.dart';
import 'package:loan_calculator/application/domain/models/loan_model/loan_model.dart';
import 'package:loan_calculator/application/ui/widgets/wrapped.dart';

part 'loan_cubit.dart';
part 'loan_state.dart';
