import 'package:flutter/material.dart';

import '../../../core/ui/extensions/theme_extension.dart';
import '../../home/home_page.dart';
import 'widgets/app_bar_product_page.dart';
import 'widgets/bottom_navigation_bar_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  static final pizzaData = ListViewPizzasWidget.pizza;
  @override
  Widget build(BuildContext context) {
    final sizedDevice = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.primaryColorDark,
      appBar: AppBarProductPage(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                width: sizedDevice.width * .9,
                height: sizedDevice.height * .65,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
