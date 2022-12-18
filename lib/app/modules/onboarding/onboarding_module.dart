import 'package:flutter_modular/flutter_modular.dart';

import 'onboarding_page.dart';

class OnboardingModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const OnboardingPage(),
    ),
  ];
}
