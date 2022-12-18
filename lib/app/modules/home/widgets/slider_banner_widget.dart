part of '../home_page.dart';

class SliderBannerWidget extends StatefulWidget {
  const SliderBannerWidget({Key? key}) : super(key: key);

  @override
  State<SliderBannerWidget> createState() => _SliderBannerWidgetState();
}

class _SliderBannerWidgetState extends State<SliderBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://quemservicos.com.br/cbjr/imgs/banner.png',
                    scale: 0.1,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://quemservicos.com.br/cbjr/imgs/banner.png',
                    scale: 0.1,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://quemservicos.com.br/cbjr/imgs/banner.png',
                    scale: 0.1,
                  ),
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 135.h,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: const Duration(
              seconds: 5,
            ),
            autoPlayAnimationDuration: const Duration(
              seconds: 1,
            ),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                HomePage.current = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: HomePage.current,
          count: 3,
          effect: JumpingDotEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            jumpScale: 1,
            verticalOffset: 10,
            activeDotColor: context.primaryColor,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
