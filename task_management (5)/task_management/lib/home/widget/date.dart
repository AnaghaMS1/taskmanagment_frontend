import 'package:flutter/material.dart';

class DateViewer extends StatefulWidget {
  @override
  _DateViewerState createState() => _DateViewerState();
}

class _DateViewerState extends State<DateViewer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(Duration(seconds: 1), (_) => DateTime.now()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(); // Placeholder or loading indicator
        }

        final currentDate = snapshot.data!;
        final formattedDate =
            "${_getWeekday(currentDate.weekday)}, ${currentDate.day} ${_getMonth(currentDate.month)} ${currentDate.year}";

        return Text(
          formattedDate,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.white,
          ),
        );
      },
    );
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }
}
