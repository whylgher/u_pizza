import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/cart/cart_repository.dart';
import '../../repositories/cart/cart_repository_impl.dart';
import '../../repositories/order/order_repository.dart';
import '../../repositories/order/order_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../service/cart/cart_service.dart';
import '../../service/cart/cart_service_impl.dart';
import '../../service/order/order_service.dart';
import '../../service/order/order_service_impl.dart';
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
        restClient: i(), // CoreModule
        localStorage: i(),
      ),
    ),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(
        log: i(), // CoreModule
        userRepository: i(), // AuthModule
        localStorage: i(), // CoreModule
      ),
    ),
    Bind.lazySingleton<CartRepository>(
      (i) => CartRepositoryImpl(
        restClient: i(),
      ),
    ),
    Bind.lazySingleton<CartService>(
      (i) => CartServiceImpl(
        cartRepository: i(),
      ),
    ),
    Bind.lazySingleton<OrderRepository>(
      (i) => OrderRepositoryImpl(
        log: i(),
        restClient: i(),
      ),
    ),
    Bind.lazySingleton<OrderService>(
      (i) => OrderServiceImpl(
        orderRepository: i(),
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
