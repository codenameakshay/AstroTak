// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      description: json['description'] as String?,
      id: json['id'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      discountedPrice: json['discountedPrice'] as String?,
      price: json['price'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      quantityType: $enumDecode(_$QuantityTypeEnumMap, json['quantityType']),
      stockUnits: (json['stockUnits'] as num).toDouble(),
      stockUnitType: $enumDecode(_$QuantityTypeEnumMap, json['stockUnitType']),
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'id': instance.id,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
      'quantityType': _$QuantityTypeEnumMap[instance.quantityType],
      'category': instance.category,
      'stockUnits': instance.stockUnits,
      'stockUnitType': _$QuantityTypeEnumMap[instance.stockUnitType],
      'isAvailable': instance.isAvailable,
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
