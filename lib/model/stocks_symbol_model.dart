// To parse required this JSON data, do
//
//     final stockSymbolModel = stockSymbolModelFromJson(jsonString);

import 'dart:convert';

List<StockSymbolModel> stockSymbolModelFromJson(String str) =>
    List<StockSymbolModel>.from(json.decode(str).map((x) => StockSymbolModel.fromJson(x)));

class StockSymbolModel {
  StockSymbolModel({
    required this.currency,
    required this.description,
    required this.displaySymbol,
    required this.figi,
    required this.mic,
    required this.symbol,
    required this.type,
  });

  String currency;
  String description;
  String displaySymbol;
  String figi;
  String mic;
  String symbol;
  String type;

  factory StockSymbolModel.fromJson(Map<String, dynamic> json) => StockSymbolModel(
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
