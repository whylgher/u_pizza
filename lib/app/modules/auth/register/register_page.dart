import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/u_pizza_text_form_field.dart';

part 'widgets/register_form.dart';
part 'widgets/smooth_page_register_indicator_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static final PageController controller = PageController();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var currentPageValue = 0.0;
  String labelBotton = 'Next';

  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    Widget bigCircle = Container(
      width: 250.0.w,
      height: 250.0.h,
      decoration: BoxDecoration(
        color: context.primaryColor,
        shape: BoxShape.circle,
      ),
    );

    Widget smallCircle = Container(
      width: 150.0.w,
      height: 150.0.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.primaryColor,
            const Color.fromARGB(255, 255, 106, 0),
          ],
        ),
        shape: BoxShape.circle,
      ),
    );

    RegisterPage.controller.addListener(
      () {
        if (mounted) {
          setState(() {
            currentPageValue = RegisterPage.controller.page!;
          });
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 17),
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Register',
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 1.h,
              child: FractionallySizedBox(
                widthFactor: 2,
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/images/bg.png"),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          context.primaryColorDark,
                          const Color.fromARGB(255, 47, 0, 0),
                        ],
                      ),
                    ),
                    child: const Image(
                      image: AssetImage("assets/images/bg.png"),
                      opacity: AlwaysStoppedAnimation(0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 3.4.h,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        turns = 0.0;
                        currentPageValue = 0.0;
                        labelBotton = 'Next';
                      });
                      Modular.to.navigate('/auth/login');
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            heightFactor: 1.1.h,
                            widthFactor: 4.w,
                            child: smallCircle,
                          ),
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            heightFactor: 4.h,
                            widthFactor: 6.5.w,
                            child: Text(
                              'Sing-in',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            heightFactor: 3.2.h,
                            widthFactor: 10.5.w,
                            child: const Icon(
                              Icons.login,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      RegisterPage.controller.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease,
                      );
                      if (RegisterPage.controller.page != 0) {
                        setState(() {
                          turns -= 1.0 / 8.0;
                          labelBotton = 'Next';
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            heightFactor: 1.1.h,
                            widthFactor: 4.w,
                            child: smallCircle,
                          ),
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            heightFactor: 4.h,
                            widthFactor: 5.6.w,
                            child: Text(
                              'Previous',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            heightFactor: 3.2.h,
                            widthFactor: 10.5.w,
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      RegisterPage.controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease,
                      );
                      if (RegisterPage.controller.page! < 3.0) {
                        setState(() => turns += 1.0 / 8.0);
                      }
                      if (RegisterPage.controller.page! >= 2) {
                        setState(() => labelBotton = 'Confirm');
                      }
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: bigCircle,
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            heightFactor: 1.3.h,
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                Text(
                                  labelBotton,
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo_u_vermelha.png',
                    width: 50.w,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  heightFactor: 4.h,
                  child: const SmoothPageRegisterIndicatorWidget(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 230),
            width: double.infinity.w,
            height: double.infinity.h,
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              controller: RegisterPage.controller,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: sizeDevice.width * .7,
                      height: sizeDevice.width * .15,
                      child: const Text(
                        'Your name is important, we need it so that we can identify you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    UPizzaTextFormField(
                      label: 'name',
                      focused: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: sizeDevice.width * .7,
                      height: sizeDevice.width * .15,
                      child: const Text(
                        'And your phone, we will let you know about your order and also for our motoboys to communicate with you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    UPizzaTextFormField(
                      label: 'phone',
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: sizeDevice.width * .7,
                      height: sizeDevice.width * .15,
                      child: const Text(
                        "For you to access, we need your email, don't worry, we won't send you spam.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    UPizzaTextFormField(
                      label: 'email',
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: sizeDevice.width * .7,
                      height: sizeDevice.width * .15,
                      child: const Text(
                        'Now the most important thing, enter a strong and secure password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    UPizzaTextFormField(
                      label: 'Senha',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    UPizzaTextFormField(
                      label: 'Confirmar Senha',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
