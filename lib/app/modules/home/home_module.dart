import 'package:flutter_modular/flutter_modular.dart';

import '../auth/product/controller/product_controller.dart';
import 'controller/home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HomeController(
        pizzaService: i(),
      ),
    ),
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
      child: (_, __) => const HomePage(),
    )
  ];
}
