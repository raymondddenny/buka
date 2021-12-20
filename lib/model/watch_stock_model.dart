// TODO 1: buat model untuk watch stocks
// TODO 2 setup hive

import 'package:hive/hive.dart';

part 'watch_stock_model.g.dart';

@HiveType(typeId: 0)
class WatchStocks extends HiveObject {
  @HiveField(0)
  late String currency;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late String displaySymbol;
  @HiveField(3)
  late String figi;
  @HiveField(4)
  late String mic;
  @HiveField(5)
  late String symbol;
  @HiveField(6)
  late String type;
  WatchStocks({
    required this.currency,
    required this.description,
    required this.displaySymbol,
    required this.figi,
    required this.mic,
    required this.symbol,
    required this.type,
  });

  factory WatchStocks.fromJson(Map<String, dynamic> json) => WatchStocks(
        currency: json["currency"],
        description: json["description"],
        displaySymbol: json["displaySymbol"],
        figi: json["figi"],
        mic: json["mic"],
        symbol: json["symbol"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "description": description,
        "displaySymbol": displaySymbol,
        "figi": figi,
        "mic": mic,
        "symbol": symbol,
        "type": type,
      };
}
