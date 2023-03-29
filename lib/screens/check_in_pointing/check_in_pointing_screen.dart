import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_app/screens/check_in_pointing_details/check_in_pointing_details_screen.dart';
import 'package:hello_app/screens/shared/date_view.dart';
import 'package:hello_app/screens/shared/custom_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class CheckInPointingScreen extends StatefulWidget {
  const CheckInPointingScreen({Key? key}) : super(key: key);

  @override
  _CheckInPointingScreenState createState() => _CheckInPointingScreenState();
}

class _CheckInPointingScreenState extends State<CheckInPointingScreen> {
  late DateTime _date;
  late DateTime _lastDate;

  void _nextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckInPointingDetailsScreen(
          dateDetails: DateDetails(date: _date),
        ),
      ),
    );
  }

  @override
  void initState() {
    _date = DateTime.now();
    _lastDate = _date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Apontamento',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextScreen,
        child: const Icon(Icons.navigate_next_rounded),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateView(
            dateDetails: DateDetails(date: _date),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TableCalendar(
              focusedDay: _date,
              firstDay: DateTime.utc(2018, 01, 01),
              lastDay: _lastDate,
              locale: 'pt_BR',
              onFormatChanged: null,
              headerVisible: false,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              selectedDayPredicate: (day) => isSameDay(_date, day),
              onDaySelected: (selectedDay, _) {
                setState(() {
                  _date = selectedDay;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
