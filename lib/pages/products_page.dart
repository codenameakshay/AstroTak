import 'package:flutter/material.dart';
import 'package:astrotak/notifiers/product_notifier.dart';
import 'package:astrotak/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final ProductNotifier productNotifier =
        Provider.of<ProductNotifier>(context);
    return ListView.builder(
      controller: controller,
      itemCount: productNotifier.products?.length ?? 0,
      itemBuilder: (context, index) => ProductCard(
        key: ValueKey(
            "${productNotifier.products?.elementAt(index).id}${productNotifier.products?.elementAt(index).name}"),
        product: productNotifier.products![index],
      ),
    );
  }
}
