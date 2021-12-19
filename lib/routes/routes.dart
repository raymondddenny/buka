import 'package:auto_route/auto_route.dart';
import 'package:bukalapak_test/ui/pages/home_page.dart';
import 'package:bukalapak_test/ui/pages/login_page/login_page.dart';
import 'package:bukalapak_test/ui/pages/profile_page/profile_page.dart';
import 'package:bukalapak_test/ui/pages/stocks_page.dart/stock_page.dart';
import 'package:bukalapak_test/ui/pages/watch_stocks_page/watch_stocks_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: LoginPage, initial: true),
  AutoRoute(
    page: HomePage,
    children: [
      AutoRoute(page: ProfilePage),
      AutoRoute(page: StockPage),
      AutoRoute(page: WatchStockPage),
    ],
    // guards: [AuthGuard],
  ),
])
class $AppRouter {}
