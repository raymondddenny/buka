import 'package:bukalapak_test/controller/stocks_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      final stocks = Provider.of<StockProvider>(context, listen: false);
      await stocks.getStocksSymbol();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);

    return Scaffold(
      floatingActionButton: Container(
        height: 56,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 0.5,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ]),
        child: const TextField(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: stockProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: stockProvider.stockSymbolList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(stockProvider.stockSymbolList[index].displaySymbol),
                  title: Text(stockProvider.stockSymbolList[index].description),
                  subtitle: Text(stockProvider.stockSymbolList[index].type),
                  trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                );
              },
            ),
    );
  }
}
