import 'package:flutter_modular/flutter_modular.dart';

import 'cart_page.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => CartPage(),
    ),
  ];
}
