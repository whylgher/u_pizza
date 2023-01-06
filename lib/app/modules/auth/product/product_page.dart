import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_pizzas/app/modules/auth/product/controller/product_controller.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../home/home_page.dart';

part 'widgets/bottom_navigation_bar_widget.dart';
part 'widgets/pizza_added_itens.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ProductController>();
    final sizeDevice = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.primaryColorDark,
      appBar: AppBarDefaultWidget(
        label: 'U Pizza',
        visibleIcon: true,
        action: '/home',
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
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
                  child: Observer(builder: (_) {
                    var data = ListViewPizzasWidget.controllerPizza;
                    data.set();
                    var dataPizza = data.pizza[0]['pizza'];

                    return Stack(
                      children: [
                        Visibility(
                          visible: dataPizza.isNotEmpty,
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
                              GestureDetector(
                                onTap: () {
                                  controller.cutInHalf();
                                },
                                child: PizzaAddedItens(
                                  label: 'CUT IN HALF',
                                  selected: controller.cutPizza,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.notCutPizza();
                                },
                                child: PizzaAddedItens(
                                  label: 'DO NOT CUT',
                                  selected: !controller.cutPizza,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const TitleAddItems(
                                title: 'Choose your size',
                                required: true,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.sizePizzaRegular();
                                  controller.price =
                                      dataPizza['prices'][0]['regular'];
                                  ListViewPizzasWidget.controllerPizza.price =
                                      dataPizza['prices'][0]['regular'];
                                },
                                child: PizzaAddedItens(
                                  label: '12" (Regular)',
                                  selected: controller.regular,
                                  price:
                                      'U\$ ${dataPizza['prices'][0]['regular']}',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.sizePizzaLarge();
                                  controller.price =
                                      dataPizza['prices'][0]['large'];
                                  ListViewPizzasWidget.controllerPizza.price =
                                      dataPizza['prices'][0]['large'];
                                },
                                child: PizzaAddedItens(
                                  label: '15" (Large)',
                                  selected: controller.large,
                                  price:
                                      'U\$ ${dataPizza['prices'][0]['large']}',
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const TitleAddItems(
                                  title: 'Additional', required: false),
                              PizzaAddedItens(
                                label: 'Olive',
                                price: 'U\$ 2,00',
                                item: false,
                              ),
                              PizzaAddedItens(
                                label: 'Mozzarela',
                                price: 'U\$ 2,00',
                                item: false,
                              ),
                              PizzaAddedItens(
                                label: 'Pepperoni',
                                price: 'U\$ 2,00',
                                item: false,
                              ),
                              PizzaAddedItens(
                                label: 'Bacon',
                                price: 'U\$ 2,00',
                                item: false,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const TitleAddItems(
                                  title: 'Border', required: true),
                              PizzaAddedItens(
                                label: 'Simple',
                              ),
                              PizzaAddedItens(
                                label: 'Cheese',
                                price: 'U\$ 5,00',
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
