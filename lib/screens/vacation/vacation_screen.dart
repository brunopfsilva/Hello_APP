import 'package:flutter/material.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';
import 'package:hello_app/screens/vacation/widgets/vacation_tile.dart';

class VacationScreen extends StatelessWidget {
  final ScrollController _scrollCtrl = ScrollController();
  final List<VacationTile> vacationDetails = [
    VacationTile(
      periodText: '01/05/2021 à 26/05/2021',
      joyText: 'Sem programação',
    ),
    VacationTile(
      periodText: '01/05/2021 à 26/05/2021',
      joyText: 'Sem programação',
    ),
    VacationTile(
      periodText: '01/05/2021 à 26/05/2021',
      joyText: 'Sem programação',
    ),
  ];

  VacationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Férias'),
      body: GlobalScrollbar(
        controller: _scrollCtrl,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          controller: _scrollCtrl,
          itemCount: vacationDetails.length,
          separatorBuilder: (_, __) => Divider(
            height: 0.0,
            color: Colors.grey[300]!.withOpacity(0.15),
          ),
          itemBuilder: (_, index) => vacationDetails[index],
        ),
      ),
    );
  }
}
