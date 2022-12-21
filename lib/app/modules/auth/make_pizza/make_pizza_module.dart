import 'package:flutter_modular/flutter_modular.dart';

import 'make_pizza_page.dart';

class MakePizzaModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const MakePizzaPage(),
    )
  ];
}
