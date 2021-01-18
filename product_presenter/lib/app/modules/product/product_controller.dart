import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:product_domain/domain/entities/product.dart';
import 'package:product_domain/domain/errors/product_exception.dart';
import 'package:product_domain/domain/use_cases/retrieve_products.dart';

part 'product_controller.g.dart';

@Injectable()
class ProductController extends Cubit<ProductState> {
  final IRetrieveProducts _retrieveProducts;

  ProductController(this._retrieveProducts) : super(ProductInitial()) {
    refresh();
  }

  Future error() async {
    emit(ProductError(ProductException(message: 'Erro Simulado')));
  }

  Future refresh() async {
    emit(ProductLoading());
    await Future.delayed(Duration(seconds: 2));
    var result = await _retrieveProducts.call();
    result.fold((l) => emit(ProductError(l)), (r) => emit(ProductLoaded(r)));
  }
}

@immutable
abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  const ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final ProductException exception;
  const ProductError(this.exception);
}
