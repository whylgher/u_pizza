import 'package:flutter_modular/flutter_modular.dart';

import 'home/auth_home_page.dart';
import 'login/login_module.dart';
import 'menu/menu_module.dart';
import 'order/order_module.dart';
import 'payment/payment_methods_module.dart';
import 'product/product_module.dart';
import 'register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => AuthHomePage(
        authStore: Modular.get(),
      ),
    ),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/menu', module: MenuModule()),
    ModuleRoute('/product_page', module: ProductModule()),
    ModuleRoute('/order_page', module: OrderModule()),
    ModuleRoute('/payment', module: PaymentMethodsModule()),
  ];
}
