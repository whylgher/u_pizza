import 'package:flutter_modular/flutter_modular.dart';

import 'add_new_address_page.dart';

class AddNewAddressModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => AddNewAddressPage(),
    ),
  ];
}
