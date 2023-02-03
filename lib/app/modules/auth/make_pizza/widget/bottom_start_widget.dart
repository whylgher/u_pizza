part of '../make_pizza_page.dart';

class BottomStartWidget extends StatelessWidget {
  final double currentPageValue;
  final Size sizeDevice;

  const BottomStartWidget({
    Key? key,
    required this.currentPageValue,
    required this.sizeDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      heightFactor: currentPageValue == 0 ? 2.h : 5.1.h,
      alignment: const Alignment(0, 0),
      child: GestureDetector(
        onTap: () {
          if (currentPageValue != 5) {
            MakePizzaPage.controller.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.ease,
            );
          } else {
            Modular.to.navigate('/auth/order_page');
          }
        },
        child: Container(
          height: sizeDevice.height * 0.30,
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
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
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
                visible: currentPageValue != 0,
                child: Container(
                  width: sizeDevice.width * .35,
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: Column(
                          children: [
                            Visibility(
                              visible: currentPageValue == 1,
                              child: Text(
                                "Select U Pizza",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: currentPageValue == 2,
                              child: Text(
                                "Let's go to the sauce",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: currentPageValue == 3,
                              child: Text(
                                "And now the protein",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: currentPageValue == 4,
                              child: Text(
                                "Vegetables and others cheeses",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: currentPageValue == 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  "Make U Pizza",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt_rounded,
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
    );
  }
}
