import 'package:intl/intl.dart';
import 'package:astrotak/constants/demo_products.dart';
import 'package:astrotak/model/filter_enum.dart';
import 'package:astrotak/model/transaction_model.dart';
import 'package:astrotak/services/logger.dart';
import 'package:rxdart/rxdart.dart';

enum TransactionState {
  loading,
  error,
  ready,
}

class TransactionService {
  final DateFormat formatter = DateFormat('E, MMMM d, yyyy\nh:mm a');

  final _transactionStateSubject =
      BehaviorSubject<TransactionState>.seeded(TransactionState.ready);

  ValueStream<TransactionState> get transactionStateStream =>
      _transactionStateSubject.stream;

  set transactionState(TransactionState v) => _transactionStateSubject.add(v);

  final _transactionsSubject = BehaviorSubject<List<Transaction>>();

  ValueStream<List<Transaction>> get transactionsStream =>
      _transactionsSubject.stream;

  set transactions(List<Transaction> v) => _transactionsSubject.add(v);

  List<Transaction> demoTransactions = [
    transaction1,
    transaction2,
    transaction3
  ];

  void dispose() {
    _transactionsSubject.close();
    _transactionStateSubject.close();
  }

  Future<void> fetchTransactions(FilterRange filterRange, DateTime start,
      DateTime end, String query) async {
    transactionState = TransactionState.loading;
    List<Transaction> tempTransactions = [];
    try {
      switch (filterRange) {
        case FilterRange.all:
          tempTransactions = demoTransactions;
          break;
        case FilterRange.pastWeek:
          tempTransactions = demoTransactions
              .where(
                (element) => element.time.isAfter(
                  DateTime.now().subtract(
                    const Duration(days: 7),
                  ),
                ),
              )
              .toList();
          break;
        case FilterRange.pastMonth:
          tempTransactions = demoTransactions
              .where(
                (element) => element.time.isAfter(
                  DateTime.now().subtract(
                    const Duration(days: 30),
                  ),
                ),
              )
              .toList();
          break;
        case FilterRange.pastYear:
          tempTransactions = demoTransactions
              .where(
                (element) => element.time.isAfter(
                  DateTime.now().subtract(
                    const Duration(days: 365),
                  ),
                ),
              )
              .toList();
          break;
        case FilterRange.custom:
          logger.w(
              "Start: ${formatter.format(start)}, End: ${formatter.format(end)}");
          tempTransactions = demoTransactions
              .where(
                (element) =>
                    element.time.isAfter(start) && element.time.isBefore(end),
              )
              .toList();
          break;
        default:
          tempTransactions = demoTransactions;
          break;
      }

      if (query == "") {
        _transactionsSubject.add(tempTransactions);
      } else {
        logger.w("Query: $query");
        logger.w(tempTransactions.toString());
        logger.w(tempTransactions
            .where((element) => element.product.name
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList());

        _transactionsSubject.add(tempTransactions
            .where((element) => element.product.name
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList());
      }

      transactionState = TransactionState.ready;
    } catch (e, s) {
      logger.e(e, e, s);
      transactionState = TransactionState.error;
    }
  }

  Future<void> addTransaction(Transaction transaction) async {
    transactionState = TransactionState.loading;
    try {
      demoTransactions.add(transaction);
      transactions = demoTransactions;
      transactionState = TransactionState.ready;
    } catch (e, s) {
      logger.e(e, e, s);
      transactionState = TransactionState.error;
    }
  }
}
