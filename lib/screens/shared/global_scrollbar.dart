import 'package:flutter/material.dart';

class GlobalScrollbar extends StatelessWidget {
  final ScrollController? controller;
  final Widget? child;

  const GlobalScrollbar({
    required this.controller,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 3.0,
      radius: const Radius.circular(45.0),
      controller: controller,
      child: child!,
    );
  }
}
