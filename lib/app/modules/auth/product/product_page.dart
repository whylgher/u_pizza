import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_pizzas/app/modules/auth/product/controller/product_controller.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../cart/controller/cart_controller.dart';

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
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 250.h,
                              child: Image.network(
                                controllerPizza.pizzaModel.image.toString(),
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
                                controllerPizza.pizzaModel.name,
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
                                controllerPizza.pizzaModel.description,
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
                                    controllerPizza.pizzaModel.regular!;
                                controllerPizza.set();
                              },
                              child: PizzaAddedItens(
                                label: '12" (Regular)',
                                selected: controllerPizza.regular,
                                price:
                                    '\$ ${controllerPizza.pizzaModel.regular}',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controllerPizza.sizePizzaLarge();
                                controllerPizza.price =
                                    controllerPizza.pizzaModel.large!;
                                controllerPizza.set();
                              },
                              child: PizzaAddedItens(
                                label: '16" (Large)',
                                selected: controllerPizza.large,
                                price: '\$ ${controllerPizza.pizzaModel.large}',
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
                              itemCount: controllerPizza.additionalList.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 0),
                              itemBuilder: (context, index) {
                                return PizzaAddedItens(
                                  index: index,
                                  label: controllerPizza
                                      .additionalList[index].name,
                                  item: false,
                                  price: controllerPizza
                                              .additionalList[index].price ==
                                          0
                                      ? ''
                                      : "\$ ${controllerPizza.additionalList[index].price}",
                                );
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            // const TitleAddItems(
                            //     title: 'Border', required: true),
                            // ListView.separated(
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   shrinkWrap: true,
                            //   itemCount: controllerPizza.bordersList.length,
                            //   separatorBuilder: (_, __) =>
                            //       const Divider(height: 0),
                            //   itemBuilder: (context, index) {
                            //     return GestureDetector(
                            //       onTap: () {
                            //         controllerPizza.selectBorder(index);
                            //       },
                            //       child: PizzaAddedItens(
                            //         selected: controllerPizza
                            //             .bordersList[index].select,
                            //         label:
                            //             controllerPizza.bordersList[index].name,
                            //         price: controllerPizza
                            //                     .bordersList[index].price ==
                            //                 0.0
                            //             ? ''
                            //             : "\$ ${controllerPizza.bordersList[index].price}",
                            //       ),
                            //     );
                            //   },
                            // ),

                            SizedBox(
                              height: 20.h,
                            ),
                          ],
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
