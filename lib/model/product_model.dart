import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

enum QuantityType {
  @JsonValue("kilograms")
  kilograms,
  @JsonValue("grams")
  grams,
  @JsonValue("packets")
  packets,
  @JsonValue("litres")
  litres,
  @JsonValue("millilitres")
  millilitres,
  @JsonValue("pieces")
  pieces,
  @JsonValue("boxes")
  boxes,
  @JsonValue("bundles")
  bundles,
  @JsonValue("bottles")
  bottles,
  @JsonValue("bags")
  bags,
  @JsonValue("others")
  others
}

extension QuantityTypeSmall on QuantityType {
  String get short {
    switch (this) {
      case QuantityType.bags:
        return 'bags';
      case QuantityType.bottles:
        return 'bottles';
      case QuantityType.boxes:
        return 'boxes';
      case QuantityType.bundles:
        return 'bundles';
      case QuantityType.grams:
        return 'g';
      case QuantityType.kilograms:
        return 'kg';
      case QuantityType.litres:
        return 'l';
      case QuantityType.millilitres:
        return 'ml';
      case QuantityType.packets:
        return 'pckts';
      case QuantityType.pieces:
        return 'pcs';
      case QuantityType.others:
        return 'others';
      default:
        return 'kg';
    }
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class Product {
  String name;
  String? description;
  String id;
  String price;
  String? discountedPrice;
  String imageUrl;
  double quantity;
  QuantityType quantityType;
  String category;
  double stockUnits;
  QuantityType stockUnitType;
  bool isAvailable;

  Product({
    required this.name,
    this.description,
    required this.id,
    required this.category,
    required this.imageUrl,
    this.discountedPrice,
    required this.price,
    required this.quantity,
    required this.quantityType,
    required this.stockUnits,
    required this.stockUnitType,
    required this.isAvailable,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
