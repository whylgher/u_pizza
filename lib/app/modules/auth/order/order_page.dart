import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/icons/u_pizza_icons.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../models/order_enum.dart';

part 'widget/order_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeDevide = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarDefaultWidget(
        label: 'Order History',
        action: () {
          Modular.to.navigate('/auth/menu');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderProgressWidget(
              label: 'Tuesday, 22 nov. 2022',
              sizeDevide: sizeDevide,
              progress: OrderEnum.completed,
            ),
            OrderProgressWidget(
              label: 'Tuesday, 29 dez. 2022',
              sizeDevide: sizeDevide,
              progress: OrderEnum.waiting,
            ),
            OrderProgressWidget(
              label: 'Tuesday, 31 dez. 2022',
              sizeDevide: sizeDevide,
              progress: OrderEnum.canceled,
            ),
            OrderProgressWidget(
              label: 'Tuesday, 22 nov. 2022',
              sizeDevide: sizeDevide,
              progress: OrderEnum.completed,
            ),
            OrderProgressWidget(
              label: 'Tuesday, 29 dez. 2022',
              sizeDevide: sizeDevide,
              progress: OrderEnum.waiting,
            ),
            OrderProgressWidget(
              label: 'Tuesday, 31 dez. 2022',
              sizeDevide: sizeDevide,
              progress: OrderEnum.canceled,
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
