import 'package:flutter/material.dart';
import 'package:hello_app/Common/routes.dart';
import 'package:hello_app/screens/check_in_mirror/widgets/check_in_mirror_tile.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';

class CheckInMirrorScreen extends StatelessWidget {
  final ScrollController _scrollCtrl = ScrollController();

  CheckInMirrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Espelho de ponto'),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 25.0,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: globalUser.userName,
                      style: const TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text:
                          '\naqui estão seus espelhos de ponto dos últimos 6 períodos.',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GlobalScrollbar(
                controller: _scrollCtrl,
                child: ListView(
                  controller: _scrollCtrl,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  children: ListTile.divideTiles(
                    color: Colors.grey.withOpacity(0.4),
                    tiles: const [
                      CheckInMirrorTile(title: 'Título'),
                      CheckInMirrorTile(title: 'Título'),
                      CheckInMirrorTile(title: 'Título'),
                      CheckInMirrorTile(title: 'Título'),
                      CheckInMirrorTile(title: 'Título'),
                    ],
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
