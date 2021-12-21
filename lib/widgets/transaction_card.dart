import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/model/transaction_model.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  bool isOpen = false;
  final DateFormat formatter = DateFormat('E, MMMM d, yyyy\nh:mm a');

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: !widget.transaction.product.isAvailable
          ? null
          : Theme.of(context).disabledColor,
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
                                  imageUrl: widget.transaction.product.imageUrl,
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
                                    widget.transaction.product.category
                                        .toUpperCase(),
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
                                  "${widget.transaction.product.name} (${widget.transaction.product.quantity.toInt()} ${widget.transaction.product.quantityType.short})",
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
                                  "${widget.transaction.product.description}",
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
                                      children: widget.transaction.product
                                                  .discountedPrice !=
                                              widget.transaction.product.price
                                          ? [
                                              Text(
                                                "₹${widget.transaction.product.discountedPrice} ",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              Text(
                                                widget
                                                    .transaction.product.price,
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
                                                "₹${widget.transaction.product.price}",
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Stock:",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                "${widget.transaction.stockUnits.toInt()} ${widget.transaction.stockUnitsType.short}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
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
                                Text(
                                  "Record Time:\n${formatter.format(widget.transaction.time)}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.overline,
                                ),
                              ],
                            ),
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
