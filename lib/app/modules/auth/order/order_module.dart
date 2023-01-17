import 'package:flutter_modular/flutter_modular.dart';

import 'controller/order_controller.dart';
import 'order_page.dart';
import 'view/order_view_module.dart';

class OrderModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => OrderController(
        localStorage: i(),
        orderService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const OrderPage(),
    ),
    ModuleRoute('/order-view', module: OrderViewModule()),
  ];
}
