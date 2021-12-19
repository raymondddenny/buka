import 'package:bukalapak_test/model/stocks_symbol_model.dart';
import 'package:bukalapak_test/model/watch_stock_model.dart';
import 'package:bukalapak_test/shared/boxes.dart';
import 'package:flutter/material.dart';

class WatchStockProvider extends ChangeNotifier {
  final boxStock = Boxes.getWatchStocks();
  void addToWatchList({required StockSymbolModel stockData, required int index, required BuildContext context}) {
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

    if (boxStock.containsKey(index)) {
      print('data existed');
      final text = 'Stock ${watchStock.displaySymbol} already exist in watchlist!';
      final snackBar = SnackBar(
        content: Text(text),
        duration: const Duration(milliseconds: 500),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      boxStock.put(index, watchStock);
      final text = 'Stock ${watchStock.displaySymbol} added to watchlist!';
      final snackBar = SnackBar(
        content: Text(text),
        duration: const Duration(milliseconds: 500),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void deleteWatchStock({required WatchStocks watchStocks, required BuildContext context}) {
    watchStocks.delete();
    final text = 'Stock ${watchStocks.displaySymbol} deleted from watchlist!';
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
