import 'dart:convert';

import 'package:bukalapak_test/model/stocks_symbol_model.dart';
import 'package:bukalapak_test/model/watch_stock_model.dart';
import 'package:bukalapak_test/shared/boxes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WatchStockProvider extends ChangeNotifier {
  CollectionReference watchstockRef = FirebaseFirestore.instance.collection('watchStock');
  FirebaseAuth auth = FirebaseAuth.instance;

  final boxStock = Boxes.getWatchStocks();

  Future<void> addToWatch(
      {required StockSymbolModel watchStocks, required BuildContext context, required int index}) async {
    final currentUser = auth.currentUser;

    // print(currentWatchStockList.data());

    final WatchStocks watchStock = WatchStocks.fromJson(watchStocks.toJson());

    final existedWatch =
        await FirebaseFirestore.instance.collection('watchStock').where('uid', isEqualTo: currentUser!.uid).get();

    if (existedWatch.docs.isEmpty) {
      watchstockRef.doc(currentUser.uid + index.toString()).set({
        'currency': watchStock.currency,
        'description': watchStock.description,
        'displaySymbol': watchStock.displaySymbol,
        'figi': watchStock.figi,
        'mic': watchStock.mic,
        'symbol': watchStock.symbol,
        'type': watchStock.type,
        'docId': currentUser.uid + index.toString(),
        'uid': currentUser.uid,
      }).then((value) {
        print('add watchstock');
        final text = 'Stock ${watchStocks.displaySymbol} added to watchlist!';
        final snackBar = SnackBar(
          content: Text(text),
          duration: const Duration(milliseconds: 500),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // addToWatchList(
        //   context: context,
        //   index: index,
        //   watchStocks: watchStock,
        // );
      }).catchError((error) => print('failed to add watch stock : $error'));
    } else {
      final isDocExisted = await checkIfDocExists(currentUser.uid + index.toString());

      if (isDocExisted) {
        final text = 'Stock ${watchStocks.displaySymbol} existed on watchlist!';
        final snackBar = SnackBar(
          content: Text(text),
          duration: const Duration(milliseconds: 500),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        watchstockRef.doc(currentUser.uid + index.toString()).set({
          'currency': watchStock.currency,
          'description': watchStock.description,
          'displaySymbol': watchStock.displaySymbol,
          'figi': watchStock.figi,
          'mic': watchStock.mic,
          'symbol': watchStock.symbol,
          'type': watchStock.type,
          'docId': currentUser.uid + index.toString(),
          'uid': currentUser.uid,
        }).then((value) {
          print('add watchstock');
          final text = 'Stock ${watchStocks.displaySymbol} added to watchlist!';
          final snackBar = SnackBar(
            content: Text(text),
            duration: const Duration(milliseconds: 500),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // addToWatchList(
          //   context: context,
          //   index: index,
          //   watchStocks: watchStock,
          // );
        }).catchError((error) => print('failed to add watch stock : $error'));
      }
    }

    // void addToWatchList({required WatchStocks watchStocks, required int index, required BuildContext context}) {
    //   if (boxStock.containsKey(index)) {
    //     print('data existed');
    //     final text = 'Stock ${watchStocks.displaySymbol} already exist in watchlist!';
    //     final snackBar = SnackBar(
    //       content: Text(text),
    //       duration: const Duration(milliseconds: 200),
    //     );

    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   } else {
    //     boxStock.put(index, watchStocks);
    //     final text = 'Stock ${watchStocks.displaySymbol} added to watchlist!';
    //     final snackBar = SnackBar(
    //       content: Text(text),
    //       duration: const Duration(milliseconds: 200),
    //     );

    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   }
    // }

    // void deleteWatchStock({required WatchStocks watchStocks, required BuildContext context}) {
    //   watchStocks.delete();
    // final text = 'Stock ${watchStocks.displaySymbol} deleted from watchlist!';
    // final snackBar = SnackBar(
    //   content: Text(text),
    //   duration: const Duration(milliseconds: 200),
    // );

    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
  }

  Future<void> deleteWatchStockFirestore(
      {required WatchStocks watchStocks, required BuildContext context, required int index}) async {
    final currentUser = auth.currentUser;

    await watchstockRef.doc(currentUser!.uid + index.toString()).delete();
    final text = 'Stock ${watchStocks.displaySymbol} deleted from watchlist!';
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // deleteWatchStock(watchStocks: watchStocks, context: context);
  }

  /// Check If Document Exists
  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection

      var doc = await watchstockRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }
}
