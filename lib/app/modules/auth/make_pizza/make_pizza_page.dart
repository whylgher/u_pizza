import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../core/ui/widgets/button_make_pizza.dart';
import '../product/product_page.dart';

part 'view/cheese_pizza_view.dart';
part 'view/size_pizza_view.dart';
part 'widget/bottom_start_widget.dart';
part 'widget/drop_down_sauce_widget.dart';
part 'widget/make_pizza_app_bar.dart';

class MakePizzaPage extends StatefulWidget {
  const MakePizzaPage({Key? key}) : super(key: key);

  static final PageController controller = PageController();

  @override
  State<MakePizzaPage> createState() => _MakePizzaPageState();
}

class _MakePizzaPageState extends State<MakePizzaPage> {
  var currentPageValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;

    MakePizzaPage.controller.addListener(
      () {
        if (mounted) {
          setState(() {
            currentPageValue = MakePizzaPage.controller.page!;
          });
        }
      },
    );

    return Scaffold(
      backgroundColor: context.primaryColorDark,
      appBar: MakePizzaAppBar(appBar: currentPageValue == 0.0),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: sizeDevice.height * .65,
              decoration: BoxDecoration(
                color:
                    currentPageValue == 0.0 ? Colors.transparent : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: MakePizzaPage.controller,
                children: [
                  Container(),
                  SizePizzaView(
                    sizeDevice: sizeDevice,
                  ),
                  CheesePizzaView(
                    sizeDevice: sizeDevice,
                  ),
                ],
              ),
            ),
            BottomStartWidget(
              currentPageValue: currentPageValue,
              sizeDevice: sizeDevice,
            ),
          ],
        ),
      ),
    );
  }
}
