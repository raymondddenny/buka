import 'package:bukalapak_test/constants/constants.dart';
import 'package:bukalapak_test/model/stocks_symbol_model.dart';
import 'package:bukalapak_test/services/base_client.dart';
import 'package:bukalapak_test/services/base_controller.dart';
import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier with BaseController {
  List<StockSymbolModel> _stockSymbolList = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<StockSymbolModel> get stockSymbolList => _stockSymbolList;

  Future<void> getStocksSymbol() async {
    _isLoading = true;
    notifyListeners();

    _stockSymbolList = [];
    final request = await BaseClient().get(baseUrl: baseUrl, api: apiGetStocksSymbol).catchError(handleError);

    if (request != null) {
      final response = stockSymbolModelFromJson(request);

      _stockSymbolList = response;
      _isLoading = false;
      notifyListeners();
    } else {
      print('request is $request');
      _stockSymbolList = [];
      _isLoading = false;
      notifyListeners();
    }

    // print(response.toString());
  }
}
