import 'package:astrotak/model/astrologer_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AstroCard extends StatefulWidget {
  const AstroCard({
    Key? key,
    required this.astrologer,
  }) : super(key: key);

  final Astrologer astrologer;

  @override
  State<AstroCard> createState() => _AstroCardState();
}

class _AstroCardState extends State<AstroCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: widget.astrologer.isAvailable == false
          ? null
          : Theme.of(context).disabledColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isOpen ? 300 : 150,
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
                                  imageUrl: widget.astrologer.images?.values
                                          .firstWhere((element) =>
                                              element.imageUrl != null &&
                                              element.imageUrl != "")
                                          .imageUrl ??
                                      "https://via.placeholder.com/150",
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
                                    "${widget.astrologer.experience?.toInt() ?? 0} years"
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
                          Positioned(
                            top: 24,
                            right: 24,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: widget.astrologer.isAvailable == true
                                    ? Colors.lightGreenAccent
                                    : Colors.redAccent,
                                shape: BoxShape.circle,
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
                                  "${widget.astrologer.firstName} ${widget.astrologer.lastName}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.handyman,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        widget.astrologer.skills?.join(', ') ??
                                            '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .overline
                                                    ?.color
                                                    ?.withOpacity(0.7)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.translate,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        widget.astrologer.languages
                                                ?.join(', ') ??
                                            '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .overline
                                                    ?.color
                                                    ?.withOpacity(0.7)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "₹${(widget.astrologer.minimumCallDurationCharges ?? 0) ~/ (widget.astrologer.minimumCallDuration ?? 1)}/min",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
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
                height: isOpen ? 70 : 0,
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
                                widget.astrologer.availability?.slot == null
                                    ? "Slot Time:\nNot available"
                                    : "Slot Time:\n${widget.astrologer.availability?.slot.from}${widget.astrologer.availability?.slot.fromFormat} - ${widget.astrologer.availability?.slot.to}${widget.astrologer.availability?.slot.toFormat}",
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
                                  "Available:",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  widget.astrologer.availability?.days
                                          .join(', ') ??
                                      'Data not available',
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
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isOpen ? 80 : 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          color: widget.astrologer.isAvailable == true
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.error,
                          child: SizedBox(
                            height: 100 - 16 - 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  widget.astrologer.isAvailable == true
                                      ? Icons.phone
                                      : Icons.phone_disabled,
                                  color: widget.astrologer.isAvailable == true
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                      : Theme.of(context).colorScheme.onError,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  widget.astrologer.isAvailable == true
                                      ? "Talk on Call"
                                      : "Not Available",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: widget.astrologer.isAvailable ==
                                                true
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onSecondary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onError,
                                      ),
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
