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
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          customRouteBuilder: slideTransitionRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    PanchangRoute.name: (routeData) {
      final args = routeData.argsAs<PanchangRouteArgs>(
          orElse: () => const PanchangRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PanchangPage(key: args.key, controller: args.controller));
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
        RouteConfig(HomeRoute.name, path: '/home-page', children: [
          RouteConfig(PanchangRoute.name, path: '', parent: HomeRoute.name),
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
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [PanchangPage]
class PanchangRoute extends PageRouteInfo<PanchangRouteArgs> {
  PanchangRoute({Key? key, ScrollController? controller})
      : super(PanchangRoute.name,
            path: '',
            args: PanchangRouteArgs(key: key, controller: controller));

  static const String name = 'PanchangRoute';
}

class PanchangRouteArgs {
  const PanchangRouteArgs({this.key, this.controller});

  final Key? key;

  final ScrollController? controller;

  @override
  String toString() {
    return 'PanchangRouteArgs{key: $key, controller: $controller}';
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
