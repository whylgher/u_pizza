import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/make_pizza/make_pizza_repository.dart';
import '../../../repositories/make_pizza/make_pizza_repository_impl.dart';
import '../../../service/make_pizza/make_pizza_service.dart';
import '../../../service/make_pizza/make_pizza_service_impl.dart';
import 'controller/make_pizza_controller.dart';
import 'make_pizza_page.dart';

class MakePizzaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<MakePizzaRepository>(
      (i) => MakePizzaRepositoryImpl(
        log: i(),
        restClient: i(),
      ),
    ),
    Bind.lazySingleton<MakePizzaService>(
      (i) => MakePizzaServiceImpl(
        makePizzaRepository: i(),
      ),
    ),
    Bind.lazySingleton(
      (i) => MakePizzaController(
        makePizzaService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const MakePizzaPage(),
    )
  ];
}
