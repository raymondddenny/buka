import 'package:bukalapak_test/constants/constants.dart';
import 'package:bukalapak_test/model/stocks_symbol_model.dart';
import 'package:bukalapak_test/services/base_client.dart';
import 'package:bukalapak_test/services/base_controller.dart';
import 'package:flutter/material.dart';

class StockProvider extends ChangeNotifier with BaseController {
  List<StockSymbolModel> _stockSymbolList = [];
  List<StockSymbolModel> _filteredList = [];

  bool _isLoading = false;
  String _searchSymbol = '';

  bool get isLoading => _isLoading;
  String get searchSymbol => _searchSymbol;

  List<StockSymbolModel> get stockSymbolList => _stockSymbolList;
  List<StockSymbolModel> get filteredList => _filteredList;

  void setSearchSymbol(String text) {
    _searchSymbol = text.toLowerCase();
    _filteredList = _stockSymbolList;

    if (searchSymbol.isNotEmpty) {
      _filteredList = filteredList.where((stock) => stock.displaySymbol.toLowerCase().contains(_searchSymbol)).toList();
    } else {
      _filteredList = stockSymbolList;
    }

    notifyListeners();
  }

  Future<void> getStocksSymbol() async {
    _isLoading = true;
    notifyListeners();

    _stockSymbolList = [];
    final request = await BaseClient().get(baseUrl: baseUrl, api: apiGetStocksSymbol).catchError(handleError);

    if (request != null) {
      final response = stockSymbolModelFromJson(request);

      _stockSymbolList = response;
      _filteredList = stockSymbolList;

      _isLoading = false;
      notifyListeners();
    } else {
      print('request is $request');
      _stockSymbolList = [];
      _filteredList = stockSymbolList;

      _isLoading = false;
      notifyListeners();
    }
  }
}
