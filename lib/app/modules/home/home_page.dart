import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../core/ui/extensions/size_screen_extension.dart';
import '../../core/ui/extensions/theme_extension.dart';
import '../../core/ui/icons/u_pizza_icons.dart';
import '../../core/ui/widgets/button_make_pizza.dart';
import '../auth/product/controller/product_controller.dart';
import 'controller/home_controller.dart';

part 'widgets/app_bar/app_bar_tab_widget.dart';
part 'widgets/app_bar/app_bar_widget.dart';
part 'widgets/list_view_pizzas_widget.dart';
part 'widgets/slider_banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static final PageController controller = PageController();

  static int current = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPageValue = 0.0;

  final _controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.getPizzas();
      Future.delayed(const Duration(seconds: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    HomePage.controller.addListener(() {
      setState(() {
        currentPageValue = HomePage.controller.page!;
      });
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(218, 232, 232, 232),
      appBar: AppBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              const SliderBannerWidget(),
              SizedBox(
                height: 30.h,
              ),
              const ButtonMakePizza(
                navigate: '/auth/make_pizza',
              ),
              Divider(
                height: 40.h,
                color: Colors.grey,
                thickness: .7,
                endIndent: 60,
                indent: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Our products:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              AppBarTabWidget(),
              ListViewPizzasWidget(),
              SizedBox(
                width: 50.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
