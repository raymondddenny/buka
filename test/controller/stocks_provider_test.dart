import 'package:bukalapak_test/controller/stocks_provider.dart';
import 'package:bukalapak_test/model/stocks_symbol_model.dart';
import 'package:bukalapak_test/services/base_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBaseClient extends Mock implements BaseClient {}

void main() {
  // test('Given user loading when fetch stocks then after get data loading off', () async {
  //   // arrange
  //   final stockProvider = StockProvider();
  //   // final mockHttp = MockHttp();

  //   // when(mockHttp.get(any)).thenAnswer((invocation) => Future.value(Response()));

  //   // act -> call method to test

  //   stockProvider.getStocksSymbol();

  //   // assety
  //   expect(stockProvider.isLoading, true);
  // });

  // test('test fetching stocks', () async {
  //   // arrange
  //   final mockBaseClient = MockBaseClient();
  //   final stockProvider = StockProvider();

  //   // act
  //   stockProvider.getStocksSymbol(mockBaseClient);

  //   // assert
  //   expect(stockProvider.stockSymbolList, <List<StockSymbolModel>>[]);
  // });
}
