import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/icons/u_pizza_icons.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../models/order_enum.dart';
import '../../../models/order_model.dart';
import 'controller/order_controller.dart';

part 'widget/order_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    final controller = Modular.get<OrderController>();
    controller.getOrders();
    final orders = controller.ordersModel;
    return Scaffold(
      appBar: AppBarDefaultWidget(
        label: 'Order History',
        action: () {
          Modular.to.navigate('/auth/menu');
        },
      ),
      body: Observer(
        builder: (_) {
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => Divider(height: 20.h),
            itemCount: orders.length,
            itemBuilder: ((_, index) {
              return OrderWidget(
                label: DateFormat.yMMMEd().format(orders[index].createdAt),
                sizeDevice: sizeDevice,
                status: progressOrder(orders[index].status),
                orderModel: orders[index],
              );
            }),
          );
        },
      ),
    );
  }
}

Map<String, Color> progressOrder(OrderEnum progress) {
  switch (progress) {
    case OrderEnum.completed:
      return {'Completed': Colors.green};
    case OrderEnum.canceled:
      return {'Canceled': Colors.red};
    case OrderEnum.waiting:
      return {'Waiting': Colors.blueAccent};
  }
}
