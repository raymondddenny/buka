import 'package:bukalapak_test/constants/constants.dart';
import 'package:bukalapak_test/model/stocks_symbol_model.dart';
import 'package:bukalapak_test/services/base_client.dart';
import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier {
  List<StockSymbolModel> _stockSymbolList = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<StockSymbolModel> get stockSymbolList => _stockSymbolList;

  Future<void> getStocksSymbol() async {
    final request = await BaseClient().get(baseUrl: baseUrl, api: apiGetStocksSymbol);

    final response = stockSymbolModelFromJson(request);

    _stockSymbolList = response;
    _isLoading = false;

    notifyListeners();

    print(response.toString());
  }
}
