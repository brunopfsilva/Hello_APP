import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hello_app/core/string_extension.dart';

class DateView extends StatelessWidget {
  final DateDetails? dateDetails;

  const DateView({
    required this.dateDetails,
    Key? key,
  })  : assert(dateDetails != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(dateDetails!.weekDay),
        const SizedBox(height: 10),
        Text(
          dateDetails!.month,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          dateDetails!.day,
          style: const TextStyle(fontSize: 40),
        ),
        const SizedBox(height: 10),
        Text(dateDetails!.year),
      ],
    );
  }
}

class DateDetails {
  final DateTime? date;
  late String _weekDay;
  late String _day;
  late String _month;
  late String _year;

  DateDetails({required this.date}) : assert(date != null) {
    _weekDay =
        DateFormat('EEEEE', 'pt_BR').format(date!).split('-')[0].capitalize();
    _day = DateFormat('d', 'pt_BR').format(date!);
    _month =
        DateFormat('MMMM', 'pt_BR').format(date!).substring(0, 3).toUpperCase();
    _year = DateFormat('y', 'pt_BR').format(date!);
  }

  String get year => _year;

  String get month => _month;

  String get day => _day;

  String get weekDay => _weekDay;
}
