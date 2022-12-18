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
    final sizeDevice = MediaQuery.of(context).size;
    OnboardingPage.controller.addListener(
      () {
        setState(() {
          currentPageValue = OnboardingPage.controller.page!;
        });
      },
    );

    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(0.1.w, 0.85.h),
        child: FloatingActionButton.extended(
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
      ),
      backgroundColor: context.primaryColor,
      body: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            heightFactor: currentPageValue == 0 ? 2.h : 13.h,
            alignment: Alignment(0, currentPageValue == 0 ? 17.h : 13.h),
            child: FractionallySizedBox(
              widthFactor: 2,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: const DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/images/bg.png"),
                  ),
                  color: context.primaryColorDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sizeDevice.width),
                    topRight: Radius.circular(sizeDevice.width),
                  ),
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
            child: const LogoWidget(
              widthLogo: 136,
              heigthLogo: 135,
              logo: 'logo_white.png',
            ),
          ),
          const OnboardingPageViewWidget(),
          const SmoothPageIndicatorWidget(),
        ],
      ),
    );
  }
}
