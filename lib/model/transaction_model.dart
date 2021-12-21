import 'package:json_annotation/json_annotation.dart';
import 'package:astrotak/model/product_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Transaction {
  Product product;
  DateTime time;
  double stockUnits;
  QuantityType stockUnitsType;

  Transaction({
    required this.product,
    required this.time,
    required this.stockUnits,
    required this.stockUnitsType,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
