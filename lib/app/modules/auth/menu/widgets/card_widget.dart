import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final Icon iconLeading;
  final double? iconLeadingSize;
  final dynamic action;

  const CardWidget({
    Key? key,
    required this.title,
    required this.iconLeading,
    this.action,
    this.titleSize = 15,
    this.titleColor,
    this.iconLeadingSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconLeading,
      onTap: action,
      title: Text(
        title,
        style: TextStyle(
          fontSize: titleSize,
          color: titleColor,
        ),
      ),
    );
  }
}
