import 'package:bukalapak_test/controller/stocks_provider.dart';
import 'package:bukalapak_test/controller/watch_stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  void initState() {
    super.initState();

    // ! Ref : https://stackoverflow.com/questions/60343605/how-to-use-data-from-provider-during-initstate-in-flutter-application
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      final stocks = Provider.of<StockProvider>(context, listen: false);
      await stocks.getStocksSymbol();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);
    final watchStockProvider = Provider.of<WatchStockProvider>(context);

    return stockProvider.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : stockProvider.stockSymbolList.isEmpty
            ? Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await stockProvider.getStocksSymbol();
                  },
                  child: const Text(
                    "Something's wrong, reload again",
                  ),
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    child: TextField(
                      onChanged: (value) {
                        stockProvider.setSearchSymbol(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search stock symbol',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Consumer<StockProvider>(
                      builder: (context, stockProvider, _) => stockProvider.filteredList.isEmpty
                          ? const Center(
                              child: Text('Not found stocks'),
                            )
                          : ListView.builder(
                              itemCount: stockProvider.filteredList.length,
                              itemBuilder: (context, index) {
                                if (stockProvider.searchSymbol.isEmpty) {
                                  return ListTile(
                                    leading: Text(stockProvider.filteredList[index].displaySymbol),
                                    title: Text(stockProvider.filteredList[index].description),
                                    subtitle: Text(stockProvider.filteredList[index].type),
                                    trailing: IconButton(
                                        onPressed: () {
                                          watchStockProvider.addToWatchList(
                                              stockData: stockProvider.filteredList[index],
                                              index: index,
                                              context: context);
                                        },
                                        icon: const Icon(Icons.saved_search_rounded)),
                                  );
                                } else {
                                  return ListTile(
                                    leading: Text(stockProvider.filteredList[index].displaySymbol),
                                    title: Text(stockProvider.filteredList[index].description),
                                    subtitle: Text(stockProvider.filteredList[index].type),
                                    trailing: IconButton(
                                        onPressed: () {
                                          watchStockProvider.addToWatchList(
                                              stockData: stockProvider.filteredList[index],
                                              index: index,
                                              context: context);
                                        },
                                        icon: const Icon(Icons.saved_search_rounded)),
                                  );
                                }
                              },
                            ),
                    ),
                  ),
                ],
              );
  }
}
