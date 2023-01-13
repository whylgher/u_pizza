import 'package:firebase_auth/firebase_auth.dart';
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
                  backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL ??
                        'https://conteudo.imguol.com.br/c/entretenimento/80/2017/04/25/a-atriz-zoe-saldana-como-neytiri-em-avatar-1493136439818_v2_4x3.jpg',
                  ),
                  backgroundColor: Colors.grey[400],
                  radius: 70,
                  //Text
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  FirebaseAuth.instance.currentUser?.displayName ?? 'Whyll',
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
