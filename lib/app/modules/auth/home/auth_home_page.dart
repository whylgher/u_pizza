import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../models/user_model.dart';
import '../../core/auth/auth_store.dart';
import '../cart/controller/cart_controller.dart';
import '../product/controller/product_controller.dart';

class AuthHomePage extends StatefulWidget {
  final AuthStore _authStore;
  const AuthHomePage({
    Key? key,
    required AuthStore authStore,
  })  : _authStore = authStore,
        super(key: key);

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  @override
  void initState() {
    super.initState();
    reaction<UserModel?>((_) => widget._authStore.userLogged, (userLogger) {
      if (userLogger != null && userLogger.email.isNotEmpty) {
        Modular.to.navigate('/home');
      } else {
        Modular.to.navigate('/onboarding');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._authStore.loadUserLogged();
    });
  }

  final controller = Modular.get<CartController>();
  final controllerProduct = Modular.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    controller.sumTotal(controllerProduct.cardList);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 220.w,
          height: 170.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
