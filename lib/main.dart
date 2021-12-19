import 'package:bukalapak_test/controller/stocks_provider.dart';
import 'package:bukalapak_test/routes/routes.gr.dart';
import 'package:bukalapak_test/ui/pages/home_page1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controller/watch_stock_provider.dart';
import 'model/watch_stock_model.dart';

Future main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WatchStocksAdapter());

  await Hive.openBox<WatchStocks>('watch_stocks');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StockProvider>(
          create: (context) => StockProvider(),
        ),
        ChangeNotifierProvider<WatchStockProvider>(
          create: (context) => WatchStockProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
