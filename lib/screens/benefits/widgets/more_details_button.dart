import 'package:flutter/material.dart';

class MoreDetailsButton extends StatelessWidget {
  const MoreDetailsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Colors.white),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (states) => const TextStyle(fontSize: 14)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Mais informações'),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
