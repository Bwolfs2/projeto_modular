import 'package:dartz/dartz.dart';
import 'package:product_domain/domain/entities/product.dart';
import 'package:product_domain/domain/errors/product_exception.dart';

abstract class IProductRepository {
  Future<Either<ProductException, List<Product>>> retrieveProducts();
}
