import 'package:astrotak/notifiers/astrologer_notifier.dart';
import 'package:flutter/material.dart';
import 'package:astrotak/model/filter_enum.dart';
import 'package:astrotak/notifiers/product_notifier.dart';
import 'package:astrotak/router/app_router.dart';
import 'package:astrotak/services/locator.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      locator<ProductNotifier>().fetchProducts(""),
      locator<AstrologerNotifier>().fetchAstrologers(
        "",
        FilterRange.all,
      ),
    ]).then((_) {
      locator<AppRouter>().replaceAll([const HomeRoute()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
