import 'package:flutter/material.dart';
import 'package:hello_app/screens/benefits/widgets/deposit_tile.dart';
import 'package:hello_app/screens/benefits/widgets/more_details_button.dart';
import 'package:hello_app/screens/benefits/widgets/users_data_table.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';

class HealthBenefitDetails extends StatelessWidget {
  final ScrollController _scrollCtrl = ScrollController();

  HealthBenefitDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MoreDetailsButton(),
        Expanded(
          child: GlobalScrollbar(
            controller: _scrollCtrl,
            child: ListView(
              controller: _scrollCtrl,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: [
                UsersDataTable(
                  columnsTitles: const ['Usuário', 'Tipo', 'Data'],
                  rows: [
                    DataTableRowData(
                      name: 'Evio',
                      type: 'Titular',
                      date: '19/05/2021',
                    ),
                    DataTableRowData(
                      name: 'André Luiz',
                      type: 'Dependente',
                      date: '21/05/2021',
                    ),
                    DataTableRowData(
                      name: 'Some body',
                      type: 'Dependente',
                      date: '21/05/2021',
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.cyan,
                  height: 30.0,
                  indent: 25.0,
                  endIndent: 25.0,
                  thickness: 2.0,
                ),
                ...ListTile.divideTiles(
                  color: Colors.grey.withOpacity(0.4),
                  tiles: const [
                    DepositTile(),
                    DepositTile(),
                    DepositTile(),
                    DepositTile(),
                    DepositTile(),
                  ],
                ).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
