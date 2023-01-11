import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/ui/extensions/size_screen_extension.dart';
import '../../core/ui/extensions/theme_extension.dart';
import '../../core/ui/icons/u_pizza_icons.dart';
import '../../core/ui/widgets/logo_widget.dart';

part 'widgets/onboarding_page_view_widget.dart';
part 'widgets/smooth_page_indicator_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  static final PageController controller = PageController();

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var currentPageValue = 0.0;

  @override
  Widget build(BuildContext context) {
    double valueInitial = 0;
    double valueFinal = 0;
    final sizeDevice = MediaQuery.of(context).size;
    if (sizeDevice.height < 800) {
      setState(() {
        valueInitial = 1.85;
        valueFinal = 1.7;
      });
    } else if (sizeDevice.height < 950) {
      setState(() {
        valueInitial = 1.5;
        valueFinal = 1.4;
      });
    }

    OnboardingPage.controller.addListener(
      () {
        setState(() {
          currentPageValue = OnboardingPage.controller.page!;
        });
      },
    );

    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              heightFactor:
                  currentPageValue == 0 ? valueInitial.h : valueFinal.h,
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: sizeDevice.width * .005.w,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/images/bg.png"),
                    ),
                    color: context.primaryColorDark,
                  ),
                  child: const Image(
                    image: AssetImage("assets/images/bg.png"),
                    opacity: AlwaysStoppedAnimation(0),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 100),
              alignment: Alignment.topCenter,
              child: Column(
                children: const [
                  LogoWidget(
                    widthLogo: 136,
                    heigthLogo: 135,
                    logo: 'logo_white.png',
                  ),
                  OnboardingPageViewWidget(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(55.h),
              alignment: Alignment.bottomCenter,
              height: sizeDevice.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SmoothPageIndicatorWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  FloatingActionButton.extended(
                    extendedIconLabelSpacing: 20,
                    icon: const Icon(
                      UPizzaIcons.right_circle,
                      color: Color(0xFFED4631),
                      size: 30,
                    ),
                    onPressed: () {
                      Modular.to.navigate('/home');
                    },
                    backgroundColor: context.primaryColor,
                    label: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
