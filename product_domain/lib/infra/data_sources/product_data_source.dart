import 'package:product_domain/domain/entities/product.dart';

abstract class IProductDataSource {
  Future<List<Product>> retrieveProducts();
}
