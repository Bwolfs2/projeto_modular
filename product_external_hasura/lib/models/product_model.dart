import 'package:product_domain/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({int id, String description, double price})
      : super(id, description, price);
}
