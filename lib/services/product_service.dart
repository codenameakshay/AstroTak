import 'package:astrotak/constants/demo_products.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/services/logger.dart';
import 'package:rxdart/rxdart.dart';

enum ProductState {
  loading,
  error,
  ready,
}

class ProductService {
  final _productStateSubject =
      BehaviorSubject<ProductState>.seeded(ProductState.ready);

  ValueStream<ProductState> get productStateStream =>
      _productStateSubject.stream;

  set productState(ProductState v) => _productStateSubject.add(v);

  final _productsSubject = BehaviorSubject<List<Product>>();

  ValueStream<List<Product>> get productsStream => _productsSubject.stream;

  set products(List<Product> v) => _productsSubject.add(v);

  List<Product> demoProducts = [apple, orange, lays];

  void dispose() {
    _productsSubject.close();
    _productStateSubject.close();
  }

  Future<void> fetchProducts(String query) async {
    productState = ProductState.loading;
    try {
      if (query == "") {
        _productsSubject.add(demoProducts);
      } else {
        _productsSubject.add(demoProducts
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList());
      }
      productState = ProductState.ready;
    } catch (e, s) {
      logger.e(e, e, s);
      productState = ProductState.error;
    }
  }

  Future<void> updateProduct(Product product) async {
    productState = ProductState.loading;
    try {
      demoProducts =
          demoProducts.map((p) => p.id == product.id ? product : p).toList();
      products = demoProducts;
      productState = ProductState.ready;
    } catch (e, s) {
      logger.e(e, e, s);
      productState = ProductState.error;
    }
  }

  Future<void> addProduct(Product product) async {
    productState = ProductState.loading;
    try {
      demoProducts.add(product);
      products = demoProducts;
      productState = ProductState.ready;
    } catch (e, s) {
      logger.e(e, e, s);
      productState = ProductState.error;
    }
  }
}
