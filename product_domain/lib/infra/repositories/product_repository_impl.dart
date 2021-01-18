import 'package:dartz/dartz.dart';
import 'package:product_domain/domain/entities/product.dart';
import 'package:product_domain/domain/errors/product_exception.dart';
import 'package:product_domain/domain/repositories/product_repository.dart';
import 'package:product_domain/infra/data_sources/product_data_source.dart';

class ProductRepository extends IProductRepository {
  final IProductDataSource dataSource;

  ProductRepository(this.dataSource);

  @override
  Future<Either<ProductException, List<Product>>> retrieveProducts() async {
    try {
      var result = await dataSource.retrieveProducts();
      return Right(result);
    } catch (e) {
      return Left(ProductException(innerException: e));
    }
  }
}
