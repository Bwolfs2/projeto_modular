import 'package:bloc_modular/bloc_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:product_domain/domain/entities/product.dart';
import 'product_controller.dart';

class ProductPage extends StatefulWidget {
  final String title;
  const ProductPage({Key key, this.title = "Product"}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ModularState<ProductPage, ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () async {
          await controller.error();
        },
        child: Icon(Icons.bug_report),
      ),
      body: BlocConsumer(
        cubit: controller,
        listener: (context, state) {
          if (state is ProductError) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Erro :C')));
          }
        },
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ProductLoaded) {
            return ProductPageLoaded(state.products);
          }

          if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Erro page'),
                  RaisedButton(
                    onPressed: () {
                      controller.refresh();
                    },
                    child: Text('Refresh'),
                  )
                ],
              ),
            );
          }

          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}

class ProductPageLoaded extends StatelessWidget {
  final List<Product> products;

  const ProductPageLoaded(this.products, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(products[index].description),
        subtitle: Text(products[index].price.toStringAsFixed(2)),
      ),
    );
  }
}
