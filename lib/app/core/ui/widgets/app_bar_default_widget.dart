import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../icons/u_pizza_icons.dart';

class AppBarDefaultWidget extends PreferredSize {
  final int fromHeight;
  final dynamic action;

  AppBarDefaultWidget({required this.action, this.fromHeight = 100, super.key})
      : super(
          preferredSize: Size.fromHeight(fromHeight.h),
          child: Stack(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 130.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (action is String) {
                        Modular.to.navigate(action);
                      } else if (action is Function) {
                        action();
                      }
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
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50.h,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: UPizzaIcons.pizzaPizza(
                    height: 40.h,
                  ),
                ),
              ),
            ],
          ),
        );
}
