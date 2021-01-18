import 'package:dio/dio.dart';
import 'package:product_external_firebase/product_external_firebase.dart';
import 'package:product_presenter/app/modules/product/product_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:main_project/app/app_widget.dart';
import 'package:main_project/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  AppModule() {
    ProductModule.init([Bind((i) => ProductDataSource())]);
  }

  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/product', module: ProductModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
