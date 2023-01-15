import 'package:flutter_modular/flutter_modular.dart';

import '../../core/local_storage/flutter_secure_storage/flutter_secure_storage_local_storage_imp.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import '../../core/logger/app_logger.dart';
import '../../core/logger/app_logger_impl.dart';
import '../../core/rest_client/dio/dio_rest_client.dart';
import '../../core/rest_client/rest_client.dart';
import '../../repositories/drink/drink_repository.dart';
import '../../repositories/drink/drink_repository_impl.dart';
import '../../repositories/pizza/pizza_repository.dart';
import '../../repositories/pizza/pizza_repository_impl.dart';
import '../../repositories/product/product_repository.dart';
import '../../repositories/product/product_repository_impl.dart';
import '../../service/drink/drink_service.dart';
import '../../service/drink/drink_service_impl.dart';
import '../../service/pizza/pizza_service.dart';
import '../../service/pizza/pizza_service_impl.dart';
import '../../service/product/product_service.dart';
import '../../service/product/product_service_impl.dart';
import '../auth/cart/controller/cart_controller.dart';
import 'auth/auth_store.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppLogger>((i) => AppLoggerImpl(), export: true),
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorageImpl(),
        export: true),
    Bind.lazySingleton<LocalSecureStorage>(
        (i) => FlutterSecureStorageLocalStorageImp(),
        export: true),
    Bind.lazySingleton(
        (i) => AuthStore(
              localStorage: i(),
            ),
        export: true),
    Bind.lazySingleton<RestClient>(
      (i) => DioRestClient(
        localStorage: i(),
        log: i(),
        authStore: i(),
        localSecureStorage: i(),
      ),
      export: true,
    ),
    Bind.lazySingleton<PizzaRepository>(
      (i) => PizzaRepositoryImpl(
        restClient: i(),
      ),
      export: true,
    ),
    Bind.lazySingleton<PizzaService>(
      (i) => PizzaServiceImpl(
        pizzaRepository: i(),
      ),
      export: true,
    ),
    Bind.lazySingleton<ProductRepository>(
      (i) => ProductRepositoryImpl(
        restClient: i(),
        log: i(),
      ),
      export: true,
    ),
    Bind.lazySingleton<ProductService>(
      (i) => ProductServiceImpl(
        productRespository: i(),
      ),
      export: true,
    ),
    Bind.lazySingleton<DrinkRepository>(
      (i) => DrinkRepositoryImpl(
        restClient: i(),
      ),
      export: true,
    ),
    Bind.lazySingleton<DrinkService>(
      (i) => DrinkServiceImpl(
        drinkRepository: i(),
      ),
      export: true,
    ),
    Bind.lazySingleton(
      (i) => CartController(
        drinkService: i(),
        localStorage: i(),
        log: i(),
      ),
      export: true,
    ),
  ];
}
