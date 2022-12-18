part of '../onboarding_page.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  const OnboardingPageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: OnboardingPage.controller,
      children: [
        Column(
          children: [
            SizedBox(
              height: 280.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Are',
                  style: TextStyle(
                    fontSize: 48.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                const LogoWidget(
                  logo: 'logo_u_black.png',
                ),
              ],
            ),
            Text(
              'hungry?',
              style: TextStyle(
                fontSize: 48.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 280.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get',
                  style: TextStyle(
                    fontSize: 48.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                const LogoWidget(
                  logo: 'logo_u_black.png',
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  'pizza',
                  style: TextStyle(
                    fontSize: 48.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'fire’d in 90 seconds',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
