import 'package:flutter/material.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/services/logger.dart';
import 'package:astrotak/services/product_service.dart';

class ProductNotifier extends ChangeNotifier {
  final _productService = locator<ProductService>();

  ProductNotifier() {
    _productService.productStateStream.listen((event) {
      logger.v("product state updated to $event");
      notifyListeners();
    });
  }

  Stream<List<Product>> get productsStream => _productService.productsStream;
  List<Product>? get products => _productService.productsStream.valueOrNull;

  Stream<ProductState> get productStateStream =>
      _productService.productStateStream;
  ProductState? get productState =>
      _productService.productStateStream.valueOrNull;

  Future<void> fetchProducts(String query) async {
    await _productService.fetchProducts(query);
  }

  Future<void> updateProduct(Product product) async {
    await _productService.updateProduct(product);
  }

  Future<void> addProduct(Product product) async {
    await _productService.addProduct(product);
  }
}
