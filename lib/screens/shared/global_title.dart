import 'package:flutter/material.dart';
import 'package:hello_app/screens/shared/global_search.dart';

class GlobalTitle extends StatelessWidget {
  final String userName;
  final String message;
  final FocusNode focusNode;
  final Function(String)? onTextChange;

  const GlobalTitle({
    required this.userName,
    required this.message,
    required this.focusNode,
    this.onTextChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
        bottom: 15.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$userName',
                  style: const TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: '\n$message',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          const Divider(thickness: 2.0, height: 30),
          GlobalSearch(
            focusNode: focusNode,
            onTextChange: onTextChange,
          ),
        ],
      ),
    );
  }
}
