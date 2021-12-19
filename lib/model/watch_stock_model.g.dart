// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_stock_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchStocksAdapter extends TypeAdapter<WatchStocks> {
  @override
  final int typeId = 0;

  @override
  WatchStocks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchStocks(
      currency: fields[0] as String,
      description: fields[1] as String,
      displaySymbol: fields[2] as String,
      figi: fields[3] as String,
      mic: fields[4] as String,
      symbol: fields[5] as String,
      type: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WatchStocks obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.currency)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.displaySymbol)
      ..writeByte(3)
      ..write(obj.figi)
      ..writeByte(4)
      ..write(obj.mic)
      ..writeByte(5)
      ..write(obj.symbol)
      ..writeByte(6)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchStocksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
