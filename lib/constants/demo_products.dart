import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/model/transaction_model.dart';

final Product apple = Product(
  id: 'p1',
  name: 'Apple',
  description: 'A fruit',
  isAvailable: true,
  price: "120",
  category: "Fruits",
  quantity: 2,
  quantityType: QuantityType.kilograms,
  stockUnits: 50,
  stockUnitType: QuantityType.kilograms,
  discountedPrice: "100",
  imageUrl:
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/apples-at-farmers-market-royalty-free-image-1627321463.jpg',
);
final Product orange = Product(
  id: 'p2',
  name: 'Orange',
  description: 'Yet another fruit',
  isAvailable: true,
  price: "60",
  category: "Fruits",
  quantity: 1,
  quantityType: QuantityType.kilograms,
  stockUnits: 70,
  stockUnitType: QuantityType.kilograms,
  discountedPrice: "45",
  imageUrl:
      'https://images2.minutemediacdn.com/image/upload/c_crop,h_2450,w_4368,x_0,y_165/v1562080363/shape/mentalfloss/29942-gettyimages-155302141.jpg',
);
final Product lays = Product(
  id: 'p3',
  name: 'Lays',
  description: 'A bag of air with some chips',
  isAvailable: true,
  price: "55",
  category: "Snacks",
  quantity: 52,
  quantityType: QuantityType.grams,
  stockUnits: 100,
  stockUnitType: QuantityType.packets,
  discountedPrice: "45",
  imageUrl: 'https://www.lays.com/sites/lays.com/files/2019-09/CheddarSC_0.png',
);

final Transaction transaction1 = Transaction(
  product: apple,
  time: DateTime(2021, 6, 18, 17, 49),
  stockUnits: 75,
  stockUnitsType: QuantityType.kilograms,
);

final Transaction transaction2 = Transaction(
  product: apple,
  time: DateTime(2021, 8, 14, 16, 40),
  stockUnits: 85,
  stockUnitsType: QuantityType.kilograms,
);
final Transaction transaction3 = Transaction(
  product: apple,
  time: DateTime(2021, 11, 15, 14, 20),
  stockUnits: 80,
  stockUnitsType: QuantityType.kilograms,
);
