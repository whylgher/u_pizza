import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/widgets/rounded_button_with_icon.dart';
import '../../../core/ui/widgets/u_pizza_default_button.dart';
import '../../../core/ui/widgets/u_pizza_text_form_field.dart';
import 'controller/login_controller.dart';

part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FractionallySizedBox(
            widthFactor: 2.3,
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/images/bg.png"),
                ),
                color: context.primaryColor,
              ),
              child: const Image(
                image: AssetImage("assets/images/bg.png"),
                opacity: AlwaysStoppedAnimation(0),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1.5,
            child: Container(
              height: sizeDevice.height * .9,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.primaryColorDark,
                    const Color.fromARGB(255, 61, 0, 0),
                  ],
                ),
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
          SizedBox(
            height: sizeDevice.height * .9,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo_white.png',
                          width: 130.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const _LoginForm(),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const _OrSerparator(),
                      SizedBox(
                        height: 20.h,
                      ),
                      const _LoginRegisterButtons(),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrSerparator extends StatelessWidget {
  const _OrSerparator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
      ],
    );
  }
}
