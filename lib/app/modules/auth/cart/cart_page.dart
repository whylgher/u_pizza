import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/icons/u_pizza_icons.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../home/home_page.dart';

part 'widget/add_drinks.dart';
part 'widget/address_paymen_coupon_widget.dart';
part 'widget/bottom_navigation_bar_widget.dart';
part 'widget/cart_app_bar.dart';
part 'widget/itens_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBarDefaultWidget(
        label: 'Cart',
        action: () {
          Modular.to.navigate('/auth/product_page');
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AddressPaymenCouponWidget(),
              const ItensWidget(),
              SizedBox(
                height: 15.h,
              ),
              const AddDrinks(),
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
