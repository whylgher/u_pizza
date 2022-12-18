part of '../onboarding_page.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.65),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SmoothPageIndicator(
            controller: OnboardingPage.controller,
            count: 2,
            effect: ExpandingDotsEffect(
                dotColor: Colors.white,
                activeDotColor: context.primaryColor,
                spacing: 12.0,
                dotWidth: 50.0.w,
                dotHeight: 8.h),
          ),
        ],
      ),
    );
  }
}
