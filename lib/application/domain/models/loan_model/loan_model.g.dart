// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoanModelAdapter extends TypeAdapter<LoanModel> {
  @override
  final int typeId = 0;

  @override
  LoanModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoanModel(
      loanAmount: fields[0] as int?,
      interestRate: fields[1] as double?,
      term: fields[2] as int?,
      amountType: fields[3] as AmountType?,
    );
  }

  @override
  void write(BinaryWriter writer, LoanModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.loanAmount)
      ..writeByte(1)
      ..write(obj.interestRate)
      ..writeByte(2)
      ..write(obj.term)
      ..writeByte(3)
      ..write(obj.amountType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoanModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AmountTypeAdapter extends TypeAdapter<AmountType> {
  @override
  final int typeId = 1;

  @override
  AmountType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AmountType.annuity;
      case 1:
        return AmountType.differentiated;
      default:
        return AmountType.annuity;
    }
  }

  @override
  void write(BinaryWriter writer, AmountType obj) {
    switch (obj) {
      case AmountType.annuity:
        writer.writeByte(0);
        break;
      case AmountType.differentiated:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmountTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
