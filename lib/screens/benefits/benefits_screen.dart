import 'package:flutter/material.dart';
import 'package:hello_app/screens/benefits/widgets/food_benefit_details.dart';
import 'package:hello_app/screens/benefits/widgets/health_benefit_details.dart';
import 'package:hello_app/screens/benefits/widgets/transport_benefit_details.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({Key? key}) : super(key: key);

  @override
  _BenefitsScreenState createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen>
    with TickerProviderStateMixin {
  late final TabController _tabCtrl;
  final List<Tab> _tabs = const [
    Tab(
      icon: Icon(Icons.medical_services_rounded),
      text: 'Saúde',
    ),
    Tab(
      icon: Icon(Icons.restaurant_rounded),
      text: 'Alimentação',
    ),
    Tab(
      icon: Icon(Icons.directions_bus_rounded),
      text: 'Transporte',
    ),
  ];

  @override
  void initState() {
    _tabCtrl = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Benefícios',
        bottom: TabBar(
          controller: _tabCtrl,
          tabs: _tabs,
          labelColor: Colors.white,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        ),
      ),
      body: TabBarView(
        controller: _tabCtrl,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HealthBenefitDetails(),
          FoodBenefitDetails(),
          TransportBenefitDetails(),
        ],
      ),
    );
  }
}
