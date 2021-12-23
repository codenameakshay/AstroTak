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
    AstroRoute.name: (routeData) {
      final args = routeData.argsAs<AstroRouteArgs>(
          orElse: () => const AstroRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: AstroPage(key: args.key, controller: args.controller));
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
          RouteConfig(AstroRoute.name,
              path: 'astro-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '/');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [NewProductPage]
class NewProductRoute extends PageRouteInfo<NewProductRouteArgs> {
  NewProductRoute({Key? key, Product? product, bool edit = false})
      : super(NewProductRoute.name,
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

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProductsPage]
class ProductsRoute extends PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({Key? key, ScrollController? controller})
      : super(ProductsRoute.name,
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

/// generated route for
/// [AstroPage]
class AstroRoute extends PageRouteInfo<AstroRouteArgs> {
  AstroRoute({Key? key, ScrollController? controller})
      : super(AstroRoute.name,
            path: 'astro-page',
            args: AstroRouteArgs(key: key, controller: controller));

  static const String name = 'AstroRoute';
}

class AstroRouteArgs {
  const AstroRouteArgs({this.key, this.controller});

  final Key? key;

  final ScrollController? controller;

  @override
  String toString() {
    return 'AstroRouteArgs{key: $key, controller: $controller}';
  }
}
