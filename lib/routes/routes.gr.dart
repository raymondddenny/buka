// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../ui/pages/home_page.dart' as _i1;
import '../ui/pages/profile_page/profile_page.dart' as _i2;
import '../ui/pages/stocks_page.dart/stock_page.dart' as _i3;
import '../ui/pages/watch_stocks_page/watch_stocks_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ProfileRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ProfilePage());
    },
    StockRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.StockPage());
    },
    WatchStockRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.WatchStockPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/', children: [
          _i5.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: HomeRoute.name),
          _i5.RouteConfig(StockRoute.name,
              path: 'stock-page', parent: HomeRoute.name),
          _i5.RouteConfig(WatchStockRoute.name,
              path: 'watch-stock-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.StockPage]
class StockRoute extends _i5.PageRouteInfo<void> {
  const StockRoute() : super(StockRoute.name, path: 'stock-page');

  static const String name = 'StockRoute';
}

/// generated route for
/// [_i4.WatchStockPage]
class WatchStockRoute extends _i5.PageRouteInfo<void> {
  const WatchStockRoute()
      : super(WatchStockRoute.name, path: 'watch-stock-page');

  static const String name = 'WatchStockRoute';
}
