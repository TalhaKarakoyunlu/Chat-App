import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';

class ContactWidgetButton extends StatelessWidget {
  ContactWidgetButton(
      {required this.buttonIcon,
      required this.buttonName,
      required this.buttonAction});
  final String buttonName;
  final Icon buttonIcon;
  final VoidCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonAction,
      splashColor: AppColors.secondary,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          children: [buttonIcon, Text(buttonName)],
        ),
      ),
    );
  }
}
