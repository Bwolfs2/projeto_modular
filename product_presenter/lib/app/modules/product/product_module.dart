import 'package:flutter_modular/flutter_modular.dart';
import 'package:product_domain/domain/use_cases/retrieve_products.dart';
import 'package:product_domain/infra/repositories/product_repository_impl.dart';
import 'package:product_domain/product_domain.dart';

import 'product_controller.dart';
import 'product_page.dart';

class ProductModule extends ChildModule {
  static init(List<Bind> _binds) {
    data.addAll(_binds);
  }

  static List<Bind> data = [
    $ProductController,
    //use_cases
    Bind((i) => RetrieveProducts(i())),
    Bind((i) => ProductRepository(i())),
  ];

  @override
  List<Bind> get binds => data;

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ProductPage()),
      ];
}
