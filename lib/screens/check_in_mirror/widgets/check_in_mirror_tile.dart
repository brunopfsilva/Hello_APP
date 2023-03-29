import 'package:flutter/material.dart';

class CheckInMirrorTile extends StatelessWidget {
  final String? title;

  const CheckInMirrorTile({
    required this.title,
    Key? key,
  })  : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.library_books_rounded),
            tooltip: 'Botão 1',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cloud_download_rounded),
            tooltip: 'Download',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
            tooltip: 'Editar',
          ),
        ],
      ),
    );
  }
}
