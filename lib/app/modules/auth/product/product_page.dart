import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_pizzas/app/modules/auth/product/controller/product_controller.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../models/additional_model.dart';

part 'widgets/bottom_navigation_bar_widget.dart';
part 'widgets/pizza_added_itens.dart';
part 'widgets/title_add_items.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerPizza = Modular.get<ProductController>();
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
                    Map dataPizza = controllerPizza.pizza[0]['pizza'];

                    List<dynamic> additional =
                        controllerPizza.pizza[0]['additionals'];
                    List<dynamic> borders = controllerPizza.pizza[0]['borders'];

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
                                  controllerPizza.cutInHalf();
                                },
                                child: PizzaAddedItens(
                                  label: 'CUT IN HALF',
                                  selected: controllerPizza.cutPizza,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controllerPizza.notCutPizza();
                                },
                                child: PizzaAddedItens(
                                  label: 'DO NOT CUT',
                                  selected: !controllerPizza.cutPizza,
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
                                  controllerPizza.sizePizzaRegular();
                                  controllerPizza.price =
                                      dataPizza['prices'][0]['regular'];
                                  controllerPizza.set();
                                },
                                child: PizzaAddedItens(
                                  label: '12" (Regular)',
                                  selected: controllerPizza.regular,
                                  price:
                                      'U\$ ${dataPizza['prices'][0]['regular']}',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controllerPizza.sizePizzaLarge();
                                  controllerPizza.price =
                                      dataPizza['prices'][0]['large'];
                                  controllerPizza.set();
                                },
                                child: PizzaAddedItens(
                                  label: '15" (Large)',
                                  selected: controllerPizza.large,
                                  price:
                                      'U\$ ${dataPizza['prices'][0]['large']}',
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const TitleAddItems(
                                  title: 'Additional', required: false),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: additional.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 0),
                                itemBuilder: (context, index) {
                                  AdditionalModel additionalModel =
                                      AdditionalModel.fromMap(
                                          additional[index]);
                                  return PizzaAddedItens(
                                    label: additionalModel.name,
                                    item: false,
                                    labelAdditional: additionalModel.count,
                                    actionAdd: () {
                                      if (additionalModel.count < 5) {
                                        additionalModel.count++;
                                        controllerPizza.incrementAdditional(
                                            additionalModel.price);
                                      }
                                    },
                                    actionRemove: () {
                                      if (additionalModel.count > 0) {
                                        additionalModel.count--;
                                        controllerPizza.decrementAdditional(
                                            additionalModel.price);
                                      }
                                    },
                                    price: additionalModel.price == 0
                                        ? ''
                                        : "U\$ ${additionalModel.price}",
                                  );
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const TitleAddItems(
                                  title: 'Border', required: true),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: borders.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 0),
                                itemBuilder: (context, index) {
                                  return PizzaAddedItens(
                                    label: borders[index]['name'],
                                    price: borders[index]['price'] == 0
                                        ? ''
                                        : "U\$ ${borders[index]['price']}",
                                  );
                                },
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
