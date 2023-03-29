import 'package:flutter/material.dart';

class ReceiptsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const ReceiptsTile({
    required this.title,
    required this.subtitle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: double.infinity,
        child: const Icon(Icons.picture_as_pdf_rounded),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.cloud_download_rounded),
        tooltip: 'Download',
        onPressed: onPressed,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
