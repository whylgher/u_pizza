import 'package:flutter_modular/flutter_modular.dart';

import 'address_page.dart';
import 'controller/address_controller.dart';

class AddressModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => AddressController(
        addressService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const AddressPage(),
    ),
  ];
}
