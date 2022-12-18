import 'package:flutter/material.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../extensions/theme_extension.dart';

class UPizzaDefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final double borderRadius;
  final double labelSize;
  final FontWeight? fontWeight;
  final String label;
  final Color? labelColor;
  final double padding;
  final double width;
  final double height;

  const UPizzaDefaultButton({
    Key? key,
    required this.onPressed,
    this.color,
    this.borderRadius = 10,
    this.labelSize = 20,
    this.fontWeight,
    required this.label,
    this.labelColor,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: color ?? context.primaryColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: labelSize.sp,
            color: labelColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
