// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardScreen(
          args.fullName,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailScreen(
          args.id,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    required String? fullName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            fullName: fullName,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<DashboardRouteArgs> page =
      PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    required this.fullName,
    this.key,
  });

  final String? fullName;

  final Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{fullName: $fullName, key: $key}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProductDetailScreen]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
