import 'package:auto_route/auto_route.dart';
import 'package:bukalapak_test/controller/stocks_provider.dart';
import 'package:bukalapak_test/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);

    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) {
        return AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('stocks app'),
          centerTitle: true,
        );
      },
      backgroundColor: Colors.indigo.shade100,
      routes: const [
        ProfileRoute(),
        StockRoute(),
        WatchStockRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) async {
            tabsRouter.setActiveIndex(index);

            if (index == 1) {
              await stockProvider.getStocksSymbol();
            }
          },
          items: [
            SalomonBottomBarItem(icon: Icon(Icons.person_pin_rounded), title: Text('Your Profile')),
            SalomonBottomBarItem(icon: Icon(Icons.table_view_rounded), title: Text('Stocks')),
            SalomonBottomBarItem(icon: Icon(Icons.saved_search_rounded), title: Text('Watchlist')),
          ],
        );
      },
    );
  }
}
