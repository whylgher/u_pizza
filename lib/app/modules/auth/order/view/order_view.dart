// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/extensions/size_screen_extension.dart';
import '../../../../core/ui/icons/u_pizza_icons.dart';
import '../../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../../core/ui/widgets/drinks.dart';
import '../../../../core/ui/widgets/itens_widget.dart';
import '../../../../models/order_enum.dart';
import '../../../../models/order_model.dart';
import '../../../../models/pizza_model.dart';
import '../controller/order_controller.dart';

part 'widget/bottom_navigation_bar_widget.dart';
part 'widget/order_widget.dart';

class OrderView extends StatelessWidget {
  final OrderModel _args;

  const OrderView({
    Key? key,
    required args,
  })  : _args = args,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final sizeDevide = MediaQuery.of(context).size;
    final controller = Modular.get<OrderController>();
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBarDefaultWidget(
        fromHeight: 75,
        widgetBar: Container(
          alignment: Alignment.center,
          width: sizeDevide.width * 0.7,
          height: 45.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: progressOrder()['2']!,
            ),
            borderRadius: BorderRadius.circular(10),
            color: progressOrder()['1'],
          ),
          child: Text(
            '${(progressOrder().keys.first).toString().replaceAll('(', '').replaceAll(')', '')} Order',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: progressOrder()[progressOrder().keys.first],
            ),
          ),
        ),
        action: () {
          Modular.to.navigate('/auth/order');
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        total: _args.total,
        tax: _args.tax,
        subTotal: _args.amount,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const OrderWidget(),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _args.order.length,
                separatorBuilder: (_, __) => Divider(height: 20.h),
                itemBuilder: (context, index) {
                  PizzaModel item = _args.order[index];
                  return ItensWidget(
                    name: item.name,
                    description: item.description,
                    item: (index + 1).toString(),
                    image: item.image,
                    total: item.amount!,
                    unitys: item.countPizza!,
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Visibility(
                visible: true,
                child: Column(
                  children: [
                    Text(
                      'Drinks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Drinks(
                      addDrink: false,
                      drinks: _args.drink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, Color> progressOrder() {
    switch (_args.status) {
      case OrderEnum.completed:
        return {
          'Completed': Colors.green,
          '1': Colors.green.shade50,
          '2': Colors.green.shade200,
        };
      case OrderEnum.canceled:
        return {
          'Canceled': Colors.red,
          '1': Colors.red.shade50,
          '2': Colors.red.shade200,
        };
      case OrderEnum.waiting:
        return {
          'Waiting': Colors.blueAccent,
          '1': Colors.blue.shade50,
          '2': Colors.blue.shade200,
        };
    }
  }
}
