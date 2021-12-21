import 'package:flutter/material.dart';
import 'package:astrotak/notifiers/transaction_notifier.dart';
import 'package:astrotak/widgets/transaction_card.dart';
import 'package:provider/provider.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    final TransactionNotifier transactionNotifier =
        Provider.of<TransactionNotifier>(context);
    return ListView.builder(
      controller: controller,
      itemCount: transactionNotifier.transactions?.length ?? 0,
      itemBuilder: (context, index) => TransactionCard(
        key: ValueKey(
            "${transactionNotifier.transactions?.elementAt(index).product.id}${transactionNotifier.transactions?.elementAt(index).product.name}"),
        transaction: transactionNotifier.transactions![
            (transactionNotifier.transactions?.length ?? 1000) - index - 1],
      ),
    );
  }
}
