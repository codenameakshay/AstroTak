import 'package:astrotak/notifiers/astrologer_notifier.dart';
import 'package:astrotak/widgets/astrologer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AstroPage extends StatelessWidget {
  const AstroPage({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    final AstrologerNotifier astrologerNotifier =
        Provider.of<AstrologerNotifier>(context);
    return ListView.builder(
      controller: controller,
      itemCount: astrologerNotifier.astrologers?.length ?? 0,
      itemBuilder: (context, index) => AstroCard(
        key: ValueKey(
            "${astrologerNotifier.astrologers?.elementAt(index).id}${astrologerNotifier.astrologers?.elementAt(index).firstName}"),
        astrologer: astrologerNotifier.astrologers![
            (astrologerNotifier.astrologers?.length ?? 1000) - index - 1],
      ),
    );
  }
}
