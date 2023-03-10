import 'package:flutter_modular/flutter_modular.dart';

import 'product_page.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const ProductPage(),
    ),
  ];
}
