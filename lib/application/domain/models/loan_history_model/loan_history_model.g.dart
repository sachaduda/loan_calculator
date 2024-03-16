// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoanHistoryModelAdapter extends TypeAdapter<LoanHistoryModel> {
  @override
  final int typeId = 3;

  @override
  LoanHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoanHistoryModel(
      loanModel: fields[0] as LoanModel,
      calculationResultModel: fields[1] as CalculationResultModel,
    );
  }

  @override
  void write(BinaryWriter writer, LoanHistoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.loanModel)
      ..writeByte(1)
      ..write(obj.calculationResultModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoanHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
