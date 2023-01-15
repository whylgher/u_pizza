import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'modules/auth/product/controller/product_controller.dart';
import 'modules/core/core_module.dart';
import 'modules/home/home_module.dart';
import 'modules/onboarding/onboarding_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton(
          (i) => ProductController(
            productService: i(),
          ),
        ),
      ];

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/onboarding', module: OnboardingModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
