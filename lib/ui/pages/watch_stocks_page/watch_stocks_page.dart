import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:bukalapak_test/controller/watch_stock_provider.dart';
import 'package:bukalapak_test/model/watch_stock_model.dart';
import 'package:bukalapak_test/routes/routes.gr.dart';
import 'package:bukalapak_test/shared/boxes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class WatchStockPage extends StatefulWidget {
  const WatchStockPage({Key? key}) : super(key: key);

  @override
  State<WatchStockPage> createState() => _WatchStockPageState();
}

class _WatchStockPageState extends State<WatchStockPage> {
  @override
  Widget build(BuildContext context) {
    final watchStockProvider = Provider.of<WatchStockProvider>(context);
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<QuerySnapshot>(
          future:
              watchStockProvider.watchstockRef.where('uid', isEqualTo: watchStockProvider.auth.currentUser!.uid).get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData) {
              List<WatchStocks> watchStocksFirestore = [];

              for (var item in snapshot.data!.docs) {
                final watchStock = WatchStocks(
                  currency: item['currency'],
                  description: item['description'],
                  displaySymbol: item['displaySymbol'],
                  figi: item['figi'],
                  mic: item['mic'],
                  type: item['type'],
                  symbol: item['symbol'],
                );
                watchStocksFirestore.add(watchStock);
              }
              return watchStocksFirestore.isEmpty
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
                      itemCount: watchStocksFirestore.length,
                      itemBuilder: (context, index) {
                        return watchListContent(
                            context: context, watchStock: watchStocksFirestore[index], index: index);
                      },
                    );
            }

            return Text("loading");
          }),
    );
  }

  Widget watchListContent({required WatchStocks watchStock, required BuildContext context, required int index}) {
    final watchStockProvider = Provider.of<WatchStockProvider>(context);
    return ListTile(
      leading: Text(watchStock.displaySymbol),
      title: Text(watchStock.description),
      subtitle: Text(watchStock.type),
      trailing: IconButton(
          onPressed: () async {
            await watchStockProvider.deleteWatchStockFirestore(context: context, watchStocks: watchStock, index: index);
            setState(() {});
          },
          icon: const Icon(
            Icons.saved_search,
            color: Colors.amber,
          )),
    );
  }
}

//  ValueListenableBuilder<Box<WatchStocks>>(
//                 valueListenable: Boxes.getWatchStocks().listenable(),
//                 builder: (context, box, _) {
//                   final watchStocks = box.values.toList().cast<WatchStocks>();
//                   return watchStocks.isEmpty
//                       ? Center(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               context.router.navigate(const StockRoute());
//                             },
//                             child: const Text(
//                               'No stocks watched!, \nplease go to stocks page to add your watched stock',
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         )
//                       : ListView.builder(
//                           itemCount: watchStocks.length,
//                           itemBuilder: (context, index) {
//                             return watchListContent(context: context, watchStock: watchStocks[index]);
//                           },
//                         );
//                 });
