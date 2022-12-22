import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../core/ui/widgets/button_make_pizza.dart';
import '../product/product_page.dart';

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
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'In the first step, choose the desired size.',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: sizeDevice.width * .65,
                          child: const Image(
                            image: NetworkImage(
                                'https://quemservicos.com.br/u_pizzas/make_pizza/raw_pizza.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const TitleAddItems(
                          title: 'Choose your size',
                          subTitle: 'Choose one',
                          required: true,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        PizzaAddedItens(label: '9" Regular', price: 'FREE'),
                        SizedBox(
                          height: 10.h,
                        ),
                        PizzaAddedItens(
                            label: '12" Regular', price: 'U\$ 25,00'),
                        SizedBox(
                          height: 10.h,
                        ),
                        PizzaAddedItens(
                            label: '15" Regular', price: 'U\$ 28,00'),
                        SizedBox(
                          height: 10.h,
                        ),
                        PizzaAddedItens(
                            label: '18" Regular', price: 'U\$ 32,00'),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text('teste2'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              heightFactor: currentPageValue == 0 ? 2.h : 5.5.h,
              alignment: const Alignment(0, 0),
              child: GestureDetector(
                onTap: () {
                  MakePizzaPage.controller.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  height: sizeDevice.height * 0.27,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      opacity: 0.4,
                      image: AssetImage("assets/images/bg.png"),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: context.primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: currentPageValue == 0
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: currentPageValue == 0,
                        child: Column(
                          children: [
                            Text(
                              'START',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_outlined,
                              size: 40.h,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: currentPageValue == 1,
                        child: Container(
                          width: sizeDevice.width * .35,
                          padding: EdgeInsets.only(top: 20.h),
                          child: Column(
                            children: [
                              Text(
                                "let's go to the sauce",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_outlined,
                                size: 40.h,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
