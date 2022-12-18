import 'package:flutter_modular/flutter_modular.dart';

import 'menu_page.dart';

class MenuModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const MenuPage(),
    )
  ];
}
