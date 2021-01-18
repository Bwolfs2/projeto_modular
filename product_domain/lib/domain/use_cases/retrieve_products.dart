import 'package:dartz/dartz.dart';
import 'package:product_domain/domain/entities/product.dart';
import 'package:product_domain/domain/errors/product_exception.dart';
import 'package:product_domain/domain/repositories/product_repository.dart';

abstract class IRetrieveProducts {
  Future<Either<ProductException, List<Product>>> call();
}

class RetrieveProducts extends IRetrieveProducts {
  final IProductRepository repository;

  RetrieveProducts(this.repository);

  @override
  Future<Either<ProductException, List<Product>>> call() async {
    return await repository.retrieveProducts();
  }
}
