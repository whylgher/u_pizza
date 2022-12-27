import 'package:flutter_modular/flutter_modular.dart';

import 'chat_page.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const ChatPage(),
    )
  ];
}
