import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    required this.title,
    this.bottom,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return Size.fromHeight(
        bottom == null ? kToolbarHeight : kToolbarHeight * 2 + 18);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: Text(title),
        trailing: Text(
          'H!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          splashRadius: 25.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(title),
        actions: const [
          Center(
            child: Text(
              'H!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
        bottom: bottom,
      );
    }
  }
}
