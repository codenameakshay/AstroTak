import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/notifiers/product_notifier.dart';
import 'package:astrotak/router/app_router.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/services/logger.dart';
import 'package:astrotak/widgets/update_stock_sheet.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color:
          !widget.product.isAvailable ? null : Theme.of(context).disabledColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isOpen ? 250 : 150,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => setState(() => isOpen = !isOpen),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: CachedNetworkImage(
                                  imageUrl: widget.product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    widget.product.category.toUpperCase(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context).textTheme.overline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${widget.product.name} (${widget.product.quantity.toInt()} ${widget.product.quantityType.short})",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 0,
                                ),
                                child: Text(
                                  "${widget.product.description}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.overline,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: widget
                                                  .product.discountedPrice !=
                                              widget.product.price
                                          ? [
                                              Text(
                                                "₹${widget.product.discountedPrice} ",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              Text(
                                                widget.product.price,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                            ]
                                          : [
                                              Text(
                                                "₹${widget.product.price}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                    ),
                                    const Spacer(),
                                    AnimatedRotation(
                                      child: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      turns: isOpen ? -0.5 : 0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isOpen ? 100 : 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: SizedBox(
                          width: 150 - 16 - 8,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Stock:",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      "${widget.product.stockUnits.toInt()} ${widget.product.stockUnitType.short}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    logger.d('Update Stock');
                                    await Future.delayed(
                                            const Duration(seconds: 0))
                                        .then(
                                      (value) => showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Colors.transparent,
                                        elevation: 0,
                                        enableDrag: true,
                                        routeSettings: const RouteSettings(
                                            name: '/update-stock'),
                                        builder: (_) => UpdateStockSheet(
                                          product: widget.product,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.edit))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          color: Theme.of(context).backgroundColor,
                          child: SizedBox(
                            height: 100 - 16 - 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      locator<AppRouter>()
                                          .navigate(NewProductRoute(
                                        product: widget.product,
                                        edit: true,
                                      ));
                                    },
                                    icon: const Icon(Icons.edit)),
                                Text(
                                  "Edit Product",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.overline,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        color: Theme.of(context).backgroundColor,
                        child: SizedBox(
                          width: 100 - 16 - 8,
                          height: 100 - 16 - 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Switch(
                                value: widget.product.isAvailable,
                                onChanged: (value) {
                                  Provider.of<ProductNotifier>(context,
                                          listen: false)
                                      .updateProduct(Product(
                                    id: widget.product.id,
                                    name: widget.product.name,
                                    description: widget.product.description,
                                    imageUrl: widget.product.imageUrl,
                                    category: widget.product.category,
                                    price: widget.product.price,
                                    discountedPrice:
                                        widget.product.discountedPrice,
                                    quantity: widget.product.quantity,
                                    quantityType: widget.product.quantityType,
                                    stockUnits: widget.product.stockUnits,
                                    stockUnitType: widget.product.stockUnitType,
                                    isAvailable: value,
                                  ));
                                },
                              ),
                              Text(
                                "Is in Stock",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: Theme.of(context).textTheme.overline,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
