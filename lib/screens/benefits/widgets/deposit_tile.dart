import 'package:flutter/material.dart';

class DepositTile extends StatelessWidget {
  const DepositTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Título'),
      subtitle: const Text('Subtítulo'),
      trailing: IconButton(
        icon: const Icon(Icons.visibility_rounded),
        onPressed: () {},
      ),
    );
  }
}
