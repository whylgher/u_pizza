import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/extensions/size_screen_extension.dart';

class AppBarMenuWidget extends PreferredSize {
  AppBarMenuWidget({
    super.key,
  }) : super(
          preferredSize: const Size.fromHeight(250),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Align(
                      heightFactor: 0.2.h,
                      alignment: Alignment.center,
                      child: FractionallySizedBox(
                        widthFactor: 1.2.w,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage("assets/images/bg.png"),
                            ),
                            color: Color(0xFFCF3C29),
                          ),
                          child: const Image(
                            image: AssetImage("assets/images/bg.png"),
                            opacity: AlwaysStoppedAnimation(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.navigate('/home');
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          heightFactor: 1.7.h,
                          widthFactor: 9.5.w,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                                width: 18,
                              ),
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 75,
                child: CircleAvatar(
                  backgroundImage: const NetworkImage(
                    "https://scontent.fopo4-1.fna.fbcdn.net/v/t1.6435-9/75472695_2628515587229815_8525484424425373696_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=84a396&_nc_eui2=AeEKrO1q6zwsGN9-5r7AifcoNcNVzVspcQg1w1XNWylxCAM9oKwexA3HUtMcwQPPbbJ4XQCJfvyeRzCKzUlQ0nOI&_nc_ohc=i_aMZWb1YqsAX_Xcpce&_nc_ht=scontent.fopo4-1.fna&oh=00_AfAcTSrYWUD-KtfuIAZSwjnIC8aMpnpEYhVH_K7N75FZVg&oe=63C17EA9",
                  ),
                  backgroundColor: Colors.grey[400],
                  radius: 70,
                  //Text
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Whylgher F. Lima',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
}
