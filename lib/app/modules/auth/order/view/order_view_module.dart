import 'package:flutter_modular/flutter_modular.dart';

import 'order_view.dart';

class OrderViewModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const OrderView())
  ];
}
