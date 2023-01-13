import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../icons/u_pizza_icons.dart';

class ButtonMakePizza extends StatelessWidget {
  final String? navigate;

  const ButtonMakePizza({
    Key? key,
    this.navigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ElevatedButton(
        onPressed: () {
          if (navigate != null) {
            Modular.to.navigate(navigate!);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        child: SizedBox(
          height: 55.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Transform.rotate(
                  angle: 180 * math.pi / 180, child: UPizzaIcons.pizzaPizza()),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'CREATE ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'U PIZZA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' NOW',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UPizzaIcons.pizzaPizza(),
            ],
          ),
        ),
      ),
    );
  }
}
