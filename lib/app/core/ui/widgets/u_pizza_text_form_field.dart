import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

class UPizzaTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  final String? label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVn;
  final bool? focused;
  final bool? isNumber;

  UPizzaTextFormField({
    Key? key,
    this.label,
    this.obscureText = false,
    this.isNumber = false,
    this.controller,
    this.focused = false,
    this.validator,
  })  : _obscureTextVn = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVn,
      builder: (_, obscureTextVnValue, child) {
        return TextFormField(
          keyboardType: isNumber! ? TextInputType.number : null,
          autofocus: focused!,
          controller: controller,
          obscureText: obscureTextVnValue,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: label,
            labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              gapPadding: 20,
              borderSide: BorderSide(
                color: Colors.grey.shade900,
              ),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVn.value = !obscureTextVnValue;
                    },
                    icon:
                        Icon(obscureTextVnValue ? Icons.lock : Icons.lock_open),
                    color: context.primaryColor,
                  )
                : null,
          ),
        );
      },
    );
  }
}
