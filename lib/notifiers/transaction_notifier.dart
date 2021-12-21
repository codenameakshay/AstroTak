import 'package:flutter/material.dart';
import 'package:astrotak/model/filter_enum.dart';
import 'package:astrotak/model/transaction_model.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/services/logger.dart';
import 'package:astrotak/services/transaction_service.dart';

class TransactionNotifier extends ChangeNotifier {
  final _transactionService = locator<TransactionService>();

  TransactionNotifier() {
    _transactionService.transactionStateStream.listen((event) {
      logger.v("transaction state updated to $event");
      notifyListeners();
    });
  }

  Stream<List<Transaction>> get transactionsStream =>
      _transactionService.transactionsStream;
  List<Transaction>? get transactions =>
      _transactionService.transactionsStream.valueOrNull;

  Stream<TransactionState> get transactionStateStream =>
      _transactionService.transactionStateStream;
  TransactionState? get transactionState =>
      _transactionService.transactionStateStream.valueOrNull;

  Future<void> fetchTransactions(FilterRange filterRange, DateTime start,
      DateTime end, String query) async {
    await _transactionService.fetchTransactions(filterRange, start, end, query);
  }

  Future<void> addTransaction(Transaction transaction) async {
    await _transactionService.addTransaction(transaction);
  }
}
