import 'package:flutter/material.dart';

class PaycheckTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressedView;

  const PaycheckTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressedView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: double.infinity,
        child: const Icon(Icons.picture_as_pdf_rounded),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.remove_red_eye_sharp),
        tooltip: 'Visualizar',
        onPressed: onPressedView,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
