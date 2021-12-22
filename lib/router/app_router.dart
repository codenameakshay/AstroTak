import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/pages/home_page.dart';
import 'package:astrotak/pages/inventory_page.dart';
import 'package:astrotak/pages/loading_page.dart';
import 'package:astrotak/pages/new_product_page.dart';
import 'package:astrotak/pages/products_page.dart';
import 'package:astrotak/router/transition_route_builders.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: '/home-page', redirectTo: '/'),
    CustomRoute(
      page: LoadingPage,
      initial: true,
      customRouteBuilder: slideTransitionRouteBuilder,
    ),
    CustomRoute(
      page: NewProductPage,
      initial: true,
      customRouteBuilder: slideTransitionRouteBuilder,
    ),
    CustomRoute(
      page: HomePage,
      customRouteBuilder: slideTransitionRouteBuilder,
      children: [
        MaterialRoute(
          page: ProductsPage,
          initial: true,
        ),
        MaterialRoute(
          page: InventoryPage,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}