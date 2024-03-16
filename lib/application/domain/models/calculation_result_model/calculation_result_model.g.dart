// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculationResultModelAdapter
    extends TypeAdapter<CalculationResultModel> {
  @override
  final int typeId = 2;

  @override
  CalculationResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculationResultModel(
      monthlyPayment: fields[0] as double,
      summPayment: fields[1] as double,
      overPayment: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CalculationResultModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.monthlyPayment)
      ..writeByte(1)
      ..write(obj.summPayment)
      ..writeByte(2)
      ..write(obj.overPayment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
