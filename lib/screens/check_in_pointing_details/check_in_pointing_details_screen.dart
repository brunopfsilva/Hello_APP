import 'package:flutter/material.dart';
import 'package:hello_app/screens/check_in_pointing_details/widgets/pointing_card.dart';
import 'package:hello_app/screens/shared/date_view.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:intl/intl.dart';

class CheckInPointingDetailsScreen extends StatefulWidget {
  final DateDetails dateDetails;

  const CheckInPointingDetailsScreen({
    required this.dateDetails,
    Key? key,
  }) : super(key: key);

  @override
  _CheckInPointingDetailsScreenState createState() =>
      _CheckInPointingDetailsScreenState();
}

class _CheckInPointingDetailsScreenState
    extends State<CheckInPointingDetailsScreen> {
  late final PageController _pageCtrl;
  late int initialIndex;
  List<DateDetails> _dates = [];

  void dateGenerator() {
    DateTime date = widget.dateDetails.date!;
    DateTime now = DateTime.now();
    int count = 0;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    if (formatter.format(date) == formatter.format(now)) {
      // _dates.add(DateDetails(date: date.subtract(Duration(days: 1))));
      _dates.add(widget.dateDetails);
    } else {
      // _dates.add(DateDetails(date: date.subtract(Duration(days: 1))));
      while (formatter.format(date.add(Duration(days: count))) !=
          formatter.format(now)) {
        _dates.add(DateDetails(date: date.add(Duration(days: count))));
        count++;
      }
      _dates.add(DateDetails(date: now));
    }
    initialIndex = count;
    _dates = _dates.reversed.toList();
  }

  void addDay(int index) {
    setState(() {
      _dates.add(
          DateDetails(date: _dates[index].date!.subtract(Duration(days: 1))));
    });
  }

  @override
  void initState() {
    dateGenerator();
    _pageCtrl = PageController(
      viewportFraction: 0.75,
      initialPage: initialIndex,
      keepPage: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Apontamento'),
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        controller: _pageCtrl,
        reverse: true,
        itemCount: _dates.length,
        itemBuilder: (_, index) {
          if (_dates.last == _dates[index]) {
            WidgetsBinding.instance!.addPostFrameCallback((_) => addDay(index));
          }
          return PointingCard(
            dateDetails: _dates[index],
          );
        },
      ),
    );
  }
}
