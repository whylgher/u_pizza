import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_pizzas/app/core/ui/extensions/size_screen_extension.dart';

part 'widget/payment_app_bar.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaymentAppBar(),
      body: Container(),
    );
  }
}
