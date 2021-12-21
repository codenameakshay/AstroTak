// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      time: DateTime.parse(json['time'] as String),
      stockUnits: (json['stockUnits'] as num).toDouble(),
      stockUnitsType:
          $enumDecode(_$QuantityTypeEnumMap, json['stockUnitsType']),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'time': instance.time.toIso8601String(),
      'stockUnits': instance.stockUnits,
      'stockUnitsType': _$QuantityTypeEnumMap[instance.stockUnitsType],
    };

const _$QuantityTypeEnumMap = {
  QuantityType.kilograms: 'kilograms',
  QuantityType.grams: 'grams',
  QuantityType.packets: 'packets',
  QuantityType.litres: 'litres',
  QuantityType.millilitres: 'millilitres',
  QuantityType.pieces: 'pieces',
  QuantityType.boxes: 'boxes',
  QuantityType.bundles: 'bundles',
  QuantityType.bottles: 'bottles',
  QuantityType.bags: 'bags',
  QuantityType.others: 'others',
};
