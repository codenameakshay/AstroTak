// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const LoadingPage(),
          customRouteBuilder: slideTransitionRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    NewProductRoute.name: (routeData) {
      final args = routeData.argsAs<NewProductRouteArgs>(
          orElse: () => const NewProductRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: NewProductPage(
              key: args.key, product: args.product, edit: args.edit),
          customRouteBuilder: slideTransitionRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          customRouteBuilder: slideTransitionRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProductsPage(key: args.key, controller: args.controller));
    },
    InventoryRoute.name: (routeData) {
      final args = routeData.argsAs<InventoryRouteArgs>(
          orElse: () => const InventoryRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: InventoryPage(key: args.key, controller: args.controller));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/home-page#redirect',
            path: '/home-page', redirectTo: '/', fullMatch: true),
        RouteConfig(LoadingRoute.name, path: '/'),
        RouteConfig(NewProductRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-page', children: [
          RouteConfig(ProductsRoute.name, path: '', parent: HomeRoute.name),
          RouteConfig(InventoryRoute.name,
              path: 'inventory-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute() : super(name, path: '/');

  static const String name = 'LoadingRoute';
}

/// generated route for [NewProductPage]
class NewProductRoute extends PageRouteInfo<NewProductRouteArgs> {
  NewProductRoute({Key? key, Product? product, bool edit = false})
      : super(name,
            path: '/',
            args: NewProductRouteArgs(key: key, product: product, edit: edit));

  static const String name = 'NewProductRoute';
}

class NewProductRouteArgs {
  const NewProductRouteArgs({this.key, this.product, this.edit = false});

  final Key? key;

  final Product? product;

  final bool edit;

  @override
  String toString() {
    return 'NewProductRouteArgs{key: $key, product: $product, edit: $edit}';
  }
}

/// generated route for [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for [ProductsPage]
class ProductsRoute extends PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({Key? key, ScrollController? controller})
      : super(name,
            path: '',
            args: ProductsRouteArgs(key: key, controller: controller));

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key, this.controller});

  final Key? key;

  final ScrollController? controller;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for [InventoryPage]
class InventoryRoute extends PageRouteInfo<InventoryRouteArgs> {
  InventoryRoute({Key? key, ScrollController? controller})
      : super(name,
            path: 'inventory-page',
            args: InventoryRouteArgs(key: key, controller: controller));

  static const String name = 'InventoryRoute';
}

class InventoryRouteArgs {
  const InventoryRouteArgs({this.key, this.controller});

  final Key? key;

  final ScrollController? controller;

  @override
  String toString() {
    return 'InventoryRouteArgs{key: $key, controller: $controller}';
  }
}
