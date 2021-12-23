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
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(
                title: "Sunrise:",
                value: widget.panchang?.sunrise.toString() ?? "",
              ),
              TitleWidget(
                title: "Sunset:",
                value: widget.panchang?.sunset.toString() ?? "",
              ),
              TitleWidget(
                title: "Moonrise:",
                value: widget.panchang?.moonrise.toString() ?? "",
              ),
              TitleWidget(
                title: "Moonset:",
                value: widget.panchang?.moonset.toString() ?? "",
              ),
              const Divider(),
              const TitleWidget(
                title: "Tithi:",
                value: "",
              ),
              SubTitleWidget(
                title: "Tithi Number:",
                value: widget.panchang?.tithi?.details?["tithi_number"]
                        .toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Tithi Name:",
                value:
                    widget.panchang?.tithi?.details?["tithi_name"].toString() ??
                        "",
              ),
              SubTitleWidget(
                title: "Special:",
                value: widget.panchang?.tithi?.details?["special"].toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Summary:",
                value: widget.panchang?.tithi?.details?["summary"].toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Deity:",
                value:
                    widget.panchang?.tithi?.details?["deity"].toString() ?? "",
              ),
              const Divider(),
              const TitleWidget(
                title: "Nakshatra:",
                value: "",
              ),
              SubTitleWidget(
                title: "Nakshatra Number:",
                value:
                    widget.panchang?.nakshatra?.details?["nak_number"].toString() ??
                        "",
              ),
              SubTitleWidget(
                title: "Nakshatra Name:",
                value:
                    widget.panchang?.nakshatra?.details?["nak_name"].toString() ??
                        "",
              ),
              SubTitleWidget(
                title: "Special:",
                value: widget.panchang?.nakshatra?.details?["special"].toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Ruler:",
                value:
                    widget.panchang?.nakshatra?.details?["ruler"].toString() ?? "",
              ),
              SubTitleWidget(
                title: "Summary:",
                value: widget.panchang?.nakshatra?.details?["summary"].toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Deity:",
                value:
                    widget.panchang?.nakshatra?.details?["deity"].toString() ?? "",
              ),
              const Divider(),
              const TitleWidget(
                title: "Yog:",
                value: "",
              ),
              SubTitleWidget(
                title: "Yog Number:",
                value:
                    widget.panchang?.yog?.details?["yog_number"].toString() ??
                        "",
              ),
              SubTitleWidget(
                title: "Yog Name:",
                value:
                    widget.panchang?.yog?.details?["yog_name"].toString() ??
                        "",
              ),
              SubTitleWidget(
                title: "Special:",
                value: widget.panchang?.yog?.details?["special"].toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Meaning:",
                value: widget.panchang?.yog?.details?["meaning"].toString() ??
                    "",
              ),
              const Divider(),
              const TitleWidget(
                title: "Karan:",
                value: "",
              ),
              SubTitleWidget(
                title: "Tithi Number:",
                value: widget.panchang?.karan?.details?["karan_number"]
                        .toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Tithi Name:",
                value:
                    widget.panchang?.karan?.details?["karan_name"].toString() ??
                        "",
              ),
              SubTitleWidget(
                title: "Special:",
                value: widget.panchang?.karan?.details?["special"].toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Deity:",
                value:
                    widget.panchang?.karan?.details?["deity"].toString() ?? "",
              ),
              const Divider(),
              const TitleWidget(
                title: "Hindu Maah:",
                value: "",
              ),
              SubTitleWidget(
                title: "Purnimanta:",
                value: widget.panchang?.hinduMaah?.purnimanta
                        .toString() ??
                    "",
              ),
              SubTitleWidget(
                title: "Amanta:",
                value:
                    widget.panchang?.hinduMaah?.amanta.toString() ??
                        "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      ],
    );
  }
}
