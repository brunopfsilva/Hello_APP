import 'package:flutter/material.dart';

class CheckInButton extends StatelessWidget {
  final String? labelText;
  final Function? onPressed;

  const CheckInButton({
    required this.labelText,
    required this.onPressed,
    Key? key,
  })  : assert(labelText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: MaterialButton(
        height: 60.0,
        minWidth: double.infinity,
        textColor: Colors.cyan,
        disabledTextColor: Colors.cyan[900],
        color: const Color(0xff313640),
        disabledColor: const Color(0xff313640).withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onPressed as void Function()?,
        child: Container(
          width: double.infinity,
          child: Text(labelText!),
        ),
      ),
    );
  }
}
