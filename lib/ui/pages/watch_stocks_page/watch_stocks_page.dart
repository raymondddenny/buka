import 'package:auto_route/auto_route.dart';
import 'package:bukalapak_test/controller/watch_stock_provider.dart';
import 'package:bukalapak_test/model/watch_stock_model.dart';
import 'package:bukalapak_test/routes/routes.gr.dart';
import 'package:bukalapak_test/shared/boxes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class WatchStockPage extends StatelessWidget {
  const WatchStockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<WatchStocks>>(
        valueListenable: Boxes.getWatchStocks().listenable(),
        builder: (context, box, _) {
          final watchStocks = box.values.toList().cast<WatchStocks>();
          return watchStocks.isEmpty
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.navigate(const StockRoute());
                    },
                    child: const Text(
                      'No stocks watched!, \nplease go to stocks page to add your watched stock',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: watchStocks.length,
                  itemBuilder: (context, index) {
                    return watchListContent(context: context, watchStock: watchStocks[index]);
                  },
                );
        });
  }

  Widget watchListContent({required WatchStocks watchStock, required BuildContext context}) {
    final watchStockProvider = Provider.of<WatchStockProvider>(context);
    return ListTile(
      leading: Text(watchStock.displaySymbol),
      title: Text(watchStock.description),
      subtitle: Text(watchStock.type),
      trailing: IconButton(
          onPressed: () {
            watchStockProvider.deleteWatchStock(watchStock);
          },
          icon: const Icon(
            Icons.saved_search,
            color: Colors.amber,
          )),
    );
  }
}
