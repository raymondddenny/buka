// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../ui/pages/home_page.dart' as _i2;
import '../ui/pages/login_page/login_page.dart' as _i1;
import '../ui/pages/profile_page/profile_page.dart' as _i3;
import '../ui/pages/stocks_page.dart/stock_page.dart' as _i4;
import '../ui/pages/watch_stocks_page/watch_stocks_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ProfilePage());
    },
    StockRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.StockPage());
    },
    WatchStockRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WatchStockPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginRoute.name, path: '/'),
        _i6.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i6.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: HomeRoute.name),
          _i6.RouteConfig(StockRoute.name,
              path: 'stock-page', parent: HomeRoute.name),
          _i6.RouteConfig(WatchStockRoute.name,
              path: 'watch-stock-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i4.StockPage]
class StockRoute extends _i6.PageRouteInfo<void> {
  const StockRoute() : super(StockRoute.name, path: 'stock-page');

  static const String name = 'StockRoute';
}

/// generated route for
/// [_i5.WatchStockPage]
class WatchStockRoute extends _i6.PageRouteInfo<void> {
  const WatchStockRoute()
      : super(WatchStockRoute.name, path: 'watch-stock-page');

  static const String name = 'WatchStockRoute';
}
