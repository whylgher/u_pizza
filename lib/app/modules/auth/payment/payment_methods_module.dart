import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_pizzas/app/modules/auth/payment/payment_methods_page.dart';

class PaymentMethodsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const PaymentMethodsPage(),
    ),
  ];
}
