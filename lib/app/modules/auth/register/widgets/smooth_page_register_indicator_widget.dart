part of '../register_page.dart';

class SmoothPageRegisterIndicatorWidget extends StatelessWidget {
  const SmoothPageRegisterIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: RegisterPage.controller,
      count: 4,
      effect: WormEffect(
        dotColor: Colors.white,
        activeDotColor: context.primaryColor,
        spacing: 31.0,
        dotWidth: 31.0.w,
        dotHeight: 31.h,
        radius: 50,
      ),
    );
  }
}
