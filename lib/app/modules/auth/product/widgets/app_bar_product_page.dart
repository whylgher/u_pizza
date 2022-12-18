import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/extensions/size_screen_extension.dart';

class AppBarProductPage extends PreferredSize {
  AppBarProductPage({super.key})
      : super(
          preferredSize: Size.fromHeight(250.h),
          child: Stack(
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
                          size: 18.h,
                        ),
                      ),
                      Text(
                        'U Pizza',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
}
