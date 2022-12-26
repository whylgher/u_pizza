part of '../make_pizza_page.dart';

class MakePizzaAppBar extends PreferredSize {
  final dynamic appBar;
  MakePizzaAppBar({required this.appBar, super.key})
      : super(
          preferredSize: Size.fromHeight(appBar ? 200.h : 100.h),
          child: Stack(
            children: [
              Visibility(
                visible: !appBar,
                child: AppBarDefaultWidget(
                  label: 'U Pizza',
                  action: () {
                    MakePizzaPage.controller.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
              Visibility(
                visible: appBar,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50.h,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Modular.to.navigate('/home');
                              },
                              child: SafeArea(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.transparent,
                                          width: 18.w,
                                        ),
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: Colors.black,
                                        size: 15.h,
                                      ),
                                    ),
                                    Text(
                                      'U Pizza',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.h),
                              child: Text(
                                '''Are u hungry? 
                          \nHere at U Pizza, you can create your own pizza, with ingredients selected by you!
                          \nFollow the step by step and end your hunger now!''',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonMakePizza(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
}
