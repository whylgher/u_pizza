import 'package:flutter_modular/flutter_modular.dart';

import 'controller/product_controller.dart';
import 'product_page.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => ProductController(
        productService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => ProductPage(),
    ),
  ];
}
