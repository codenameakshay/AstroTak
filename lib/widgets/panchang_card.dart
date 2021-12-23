import 'package:astrotak/model/panchang_model.dart';
import 'package:astrotak/services/logger.dart';
import 'package:flutter/material.dart';

class PanchangCard extends StatefulWidget {
  const PanchangCard({
    Key? key,
    required this.panchang,
  }) : super(key: key);

  final Panchang? panchang;

  @override
  State<PanchangCard> createState() => _PanchangCardState();
}

class _PanchangCardState extends State<PanchangCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    logger.d(widget.panchang.toString());
    return Card(
      margin: const EdgeInsets.all(16),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${widget.panchang?.sunrise} (${widget.panchang?.day} ${widget.panchang?.day})",
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
                                  "${widget.panchang?.day}",
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
                                    Text(
                                      "₹${widget.panchang?.day}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
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
                                      "${widget.panchang?.day} ${widget.panchang?.day}",
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
                                    // logger.d('Update Stock');
                                    // await Future.delayed(
                                    //         const Duration(seconds: 0))
                                    //     .then(
                                    //   (value) => showModalBottomSheet(
                                    //     context: context,
                                    //     isScrollControlled: true,
                                    //     backgroundColor: Colors.transparent,
                                    //     barrierColor: Colors.transparent,
                                    //     elevation: 0,
                                    //     enableDrag: true,
                                    //     routeSettings: const RouteSettings(
                                    //         name: '/update-stock'),
                                    //     builder: (_) => UpdateStockSheet(
                                    //       panchang: widget.panchang,
                                    //     ),
                                    //   ),
                                    // );
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
                                    onPressed: () {},
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
