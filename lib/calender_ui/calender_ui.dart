import 'package:easycalendar/clean_nepali_calendar.dart';
import 'package:easycalendar/date_utils.dart';
import 'package:flutter/material.dart';

import 'english_date_builder.dart';

class CalenderScreen extends StatelessWidget {
  final NepaliCalendarController nepaliCalendarController;
  final NepaliDateTime firstDate, lastDate;
  final Function(NepaliDateTime) onDaySelected;
  final HeaderGestureCallback? onHeaderLongPressed;
  final HeaderGestureCallback? onHeaderTapped;

  const CalenderScreen(
      {super.key,
      required this.nepaliCalendarController,
      required this.firstDate,
      required this.lastDate,
      required this.onDaySelected,
      this.onHeaderLongPressed,
      this.onHeaderTapped});

  @override
  Widget build(BuildContext context) {
    return CleanNepaliCalendar(
      headerDayBuilder: (_, index) {
        return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(_,
                  style: TextStyle(color: (index == 6) ? Colors.red : null)),
            ));
      },
      headerBuilder: (_, __, ___, ____, ______) {
        return Container(
          margin: const EdgeInsets.only(
              top: 0.0, left: 8.0, right: 8.0, bottom: 3.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade200, width: 1),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 4),
                    blurRadius: 8.0,
                    spreadRadius: -4)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: IconButton(
                  onPressed: () => ____,
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      "${EasyDateConverter.getNepaliMonthName(______!.month.toString())}, ${______.year.toString()}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14.0,
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${EasyDateConverter.getEnglishHalfMonthName(______.toDateTime().month.toString())} - ${EasyDateConverter.getEnglishHalfMonthName((______.toDateTime().month + 1).toString())}, ${______.toDateTime().year.toString()}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 9.0,
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () => ___,
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      headerDayType: HeaderDayType.halfName,
      controller: nepaliCalendarController,
      onHeaderLongPressed: (date) {
        onHeaderLongPressed!(date);
      },
      onHeaderTapped: (date) {
        onHeaderTapped!(date);
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.transparent,
        dayStyle: const TextStyle(fontWeight: FontWeight.bold),
        todayStyle: const TextStyle(fontSize: 20.0),
        todayColor: Colors.orange.shade400,
        renderDaysOfWeek: true,
        highlightToday: true,
        contentPadding: const EdgeInsets.all(4.0),
        highlightSelected: true,
      ),
      headerStyle: const HeaderStyle(
        enableFadeTransition: false,
        centerHeaderTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
          fontSize: 20.0,
        ),
      ),
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2075, 1),
      lastDate: NepaliDateTime(2090, 12),
      language: Language.nepali,
      onDaySelected: (date) {
        onDaySelected(date);
      },

      /// display the english date along with nepali date.
      dateCellBuilder: cellBuilder,
    );
  }
}
