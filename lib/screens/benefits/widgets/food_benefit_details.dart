import 'package:flutter/material.dart';
import 'package:hello_app/screens/benefits/widgets/deposit_tile.dart';
import 'package:hello_app/screens/benefits/widgets/more_details_button.dart';
import 'package:hello_app/screens/shared/global_scrollbar.dart';

class FoodBenefitDetails extends StatelessWidget {
  final ScrollController _scrollCtrl = ScrollController();

  FoodBenefitDetails({Key? key}) : super(key: key);

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
                ...ListTile.divideTiles(
                  color: Colors.grey.withOpacity(0.4),
                  tiles: const [
                    DepositTile(),
                    DepositTile(),
                    DepositTile(),
                    DepositTile(),
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
