import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String customIcon;
  final String labelText;
  final Function? onPressed;

  const HomeButton({
    required this.customIcon,
    required this.labelText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onPressed as void Function()?,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              customIcon,
              width: 90.0,
            ),
            Text(
              labelText,
            ),
          ],
        ),
      ),
    );
  }
}
