import 'package:bukalapak_test/model/stocks_symbol_model.dart';
import 'package:bukalapak_test/model/watch_stock_model.dart';
import 'package:bukalapak_test/shared/boxes.dart';
import 'package:flutter/material.dart';

class WatchStockProvider extends ChangeNotifier {
  final boxStock = Boxes.getWatchStocks();
  void addToWatchList(StockSymbolModel stockData) {
    final watchStock = WatchStocks(
      currency: stockData.currency,
      description: stockData.description,
      displaySymbol: stockData.symbol,
      figi: stockData.figi,
      mic: stockData.mic,
      symbol: stockData.symbol,
      type: stockData.type,
    );

    // TODO: Check if stock already exist
    boxStock.add(watchStock);
  }

  void deleteWatchStock(WatchStocks watchStocks) {
    watchStocks.delete();
  }
}
