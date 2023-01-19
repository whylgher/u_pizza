import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/icons/u_pizza_icons.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../core/ui/widgets/drinks.dart';
import '../../../core/ui/widgets/itens_widget.dart';
import '../product/controller/product_controller.dart';
import 'controller/cart_controller.dart';

part 'widget/address_paymen_coupon_widget.dart';
part 'widget/bottom_navigation_bar_widget.dart';
part 'widget/cart_app_bar.dart';
part 'widget/item_modal.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final controller = Modular.get<CartController>();

  final controllerProduct = Modular.get<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBarDefaultWidget(
        label: 'Cart',
        action: () {
          Modular.to.navigate('/home');
        },
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) {
              return Column(
                children: [
                  const AddressPaymenCouponWidget(),
                  Visibility(
                    visible: controllerProduct.cartList.isNotEmpty,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controllerProduct.cartList.length,
                      separatorBuilder: (_, __) => Divider(height: 20.h),
                      itemBuilder: (context, index) {
                        final item = controllerProduct.cartList[index];
                        return Dismissible(
                          key: Key((item.name + item.id.toString())),
                          onDismissed: (_) {
                            controller.total = controller.total - item.amount;
                            controllerProduct.removeItenCart(item.id);
                          },
                          child: ItensWidget(
                            name: item.name,
                            description: item.description,
                            item: (index + 1).toString(),
                            unitys: item.amountPizzas,
                            image: item.img,
                            total: item.amount,
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: !controllerProduct.cartList.isNotEmpty,
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove_shopping_cart_outlined,
                          size: 80.w,
                          color: Colors.grey.shade700,
                        ),
                        Text(
                          'EMPTY CART',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Want to add some drink?',
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
                    drinks: controller.drinks,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
