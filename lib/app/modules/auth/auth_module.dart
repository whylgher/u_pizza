import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../service/user/user_service.dart';
import '../../service/user/user_service_impl.dart';
import 'cart/cart_module.dart';
import 'chat/chat_module.dart';
import 'home/auth_home_page.dart';
import 'login/login_module.dart';
import 'make_pizza/make_pizza_module.dart';
import 'menu/menu_module.dart';
import 'order/order_module.dart';
import 'payment/payment_methods_module.dart';
import 'product/product_module.dart';
import 'register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>(
      (i) => UserRepositoryImpl(
          log: i(), // CoreModule
          restClient: i() // CoreModule,
          ),
    ),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(
        log: i(), // CoreModule
        userRepository: i(), // AuthModule
      ),
    ),
  ];

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
    ModuleRoute('/order_page', module: CartModule()),
    ModuleRoute('/payment', module: PaymentMethodsModule()),
    ModuleRoute('/make_pizza', module: MakePizzaModule()),
    ModuleRoute('/order', module: OrderModule()),
    ModuleRoute('/chat', module: ChatModule()),
  ];
}
