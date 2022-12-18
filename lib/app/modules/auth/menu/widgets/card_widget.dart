import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final Icon iconLeading;
  final double? iconLeadingSize;

  const CardWidget({
    Key? key,
    required this.title,
    this.titleSize = 15,
    this.titleColor,
    required this.iconLeading,
    this.iconLeadingSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconLeading,
      title: Text(
        title,
        style: TextStyle(
          fontSize: titleSize,
          color: titleColor,
        ),
      ),
      onTap: () {},
    );
  }
}
