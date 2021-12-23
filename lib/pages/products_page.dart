import 'package:astrotak/notifiers/panchang_notifier.dart';
import 'package:astrotak/widgets/panchang_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanchangPage extends StatelessWidget {
  const PanchangPage({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final PanchangNotifier panchangNotifier =
        Provider.of<PanchangNotifier>(context);
    return PanchangCard(
      panchang: panchangNotifier.panchang,
    );
  }
}
