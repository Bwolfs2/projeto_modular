import 'package:dio/dio.dart';
import 'package:product_domain/domain/entities/product.dart';
import 'package:product_domain/infra/data_sources/product_data_source.dart';
import 'package:product_external_hasura/models/product_model.dart';

class ProductDataSource implements IProductDataSource {
  final Dio dio;

  ProductDataSource(this.dio);
  @override
  Future<List<Product>> retrieveProducts() async {
    return List.generate(
      40,
      (index) => ProductModel(
        id: index,
        description: 'Hasura Product $index',
        price: 2.2 * (index + 1),
      ),
    );
  }
}
