import 'package:flutter/material.dart';

import '../extensions/size_screen_extension.dart';

class LogoWidget extends StatelessWidget {
  final int? widthLogo;
  final int? heigthLogo;
  final double? scaleLogo;
  final String? logo;

  const LogoWidget({
    Key? key,
    this.widthLogo,
    this.heigthLogo,
    this.scaleLogo,
    this.logo = 'logo.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String logoString = 'assets/images/$logo';
    return Image.asset(
      logoString,
      width: widthLogo?.w,
      height: heigthLogo?.h,
      scale: scaleLogo,
    );
  }
}
