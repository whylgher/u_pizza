import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/extensions/size_screen_extension.dart';
import '../../../../core/ui/icons/u_pizza_icons.dart';
import '../../../../core/ui/widgets/app_bar_default_widget.dart';

part 'widget/bottom_navigation_bar_widget.dart';
part 'widget/itens_widget.dart';
part 'widget/order_widget.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeDevide = MediaQuery.of(context).size;
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
              color: Colors.green.shade100,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade50,
          ),
          child: Text(
            'Completed Order',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.green.shade700,
            ),
          ),
        ),
        action: () {
          Modular.to.navigate('/auth/order');
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const OrderWidget(),
              const ItensWidget(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
