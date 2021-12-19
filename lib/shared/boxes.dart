import 'package:bukalapak_test/model/watch_stock_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<WatchStocks> getWatchStocks() {
    return Hive.box<WatchStocks>('watch_stocks');
  }
}
