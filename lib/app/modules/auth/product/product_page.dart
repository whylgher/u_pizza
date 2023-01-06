import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../home/home_page.dart';
import 'controller/product_controller.dart';

part 'widgets/bottom_navigation_bar_widget.dart';
part 'widgets/pizza_added_itens.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  static var dataPizza = ListViewPizzasWidget.controllerPizza.pizza[0];
  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.primaryColorDark,
      appBar: AppBarDefaultWidget(
        label: 'U Pizza',
        visibleIcon: true,
        action: '/home',
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: sizeDevice.width * .9,
                height: sizeDevice.height * .65,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250.h,
                        child: Image.network(
                          dataPizza['image'][0]['image'].toString(),
                          filterQuality: FilterQuality.high,
                          scale: .6,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${dataPizza['name']}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${dataPizza['description']}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      const TitleAddItems(
                          title: 'Do you want to cut the pizza?',
                          required: true),
                      SizedBox(
                        height: 10.h,
                      ),
                      const PizzaAddedItens(
                        label: 'CUT IN HALF',
                        selected: true,
                      ),
                      const PizzaAddedItens(
                        label: 'DO NOT CUT',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const TitleAddItems(
                          title: 'Choose your size', required: true),
                      PizzaAddedItens(
                        label: '9" (Regular)',
                        price: 'U\$ ${dataPizza['prices'][0]['regular']}',
                        selected: true,
                      ),
                      PizzaAddedItens(
                        label: '15" (Large)',
                        price: 'U\$ ${dataPizza['prices'][0]['large']}',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const TitleAddItems(title: 'Additional', required: false),
                      const PizzaAddedItens(
                        label: 'Olive',
                        price: 'U\$ 2,00',
                        item: false,
                      ),
                      const PizzaAddedItens(
                        label: 'Mozzarela',
                        price: 'U\$ 2,00',
                        item: false,
                      ),
                      const PizzaAddedItens(
                        label: 'Pepperoni',
                        price: 'U\$ 2,00',
                        item: false,
                      ),
                      const PizzaAddedItens(
                        label: 'Bacon',
                        price: 'U\$ 2,00',
                        item: false,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const TitleAddItems(title: 'Border', required: true),
                      const PizzaAddedItens(
                        label: 'Simple',
                        selected: true,
                      ),
                      const PizzaAddedItens(
                        label: 'Cheese',
                        price: 'U\$ 5,00',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
