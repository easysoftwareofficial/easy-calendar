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

    final NepaliDateTime first = NepaliDateTime(2075, 5);
    final NepaliDateTime last = NepaliDateTime(2090, 3);

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
                  onPressed: ____(),
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
                  onPressed: ___(),
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
      firstDate: first,
      lastDate: last,
      language: Language.nepali,
      onDaySelected: (date) {
        onDaySelected(date);
      },

      /// display the english date along with nepali date.
      dateCellBuilder: cellBuilder,
    );
  }
}


bool dayEquals(NepaliDateTime a, NepaliDateTime b) {
  return a.toIso8601String().substring(0, 10) ==
      b.toIso8601String().substring(0, 10);
}

Widget cellBuilder(isToday, isSelected, isDisabled, nepaliDate, label, text,
    calendarStyle, isWeekend) {
  // print(isSelected);
  Decoration buildCellDecoration() {
    if (isSelected && isToday) {
      return BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
        border: Border.all(color: calendarStyle.selectedColor),
      );
    }
    if (isSelected) {
      return BoxDecoration(
        // shape: BoxShape.circle,
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: calendarStyle.selectedColor));
    } else if (isToday && calendarStyle.highlightToday) {
      return BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.transparent),
        color: Colors.orangeAccent,
      );
    } else {
      return BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.transparent),
      );
    }
  }

  return Container(
    padding: const EdgeInsets.only(right: 3, bottom: 3),
    margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
    // duration: Duration(milliseconds: 200000),
    decoration: buildCellDecoration(),
    child: Center(
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: isWeekend
                    ? Colors.red
                    : isSelected || isToday
                    ? Colors.white
                    : null,
              ),
            ),
          ),
          // to show events
          // (eventList.any((event) => _dayEquals(event.date, nepaliDate)))
          //     ? Container(
          //         margin: const EdgeInsets.only(top: 2.0),
          //         alignment: Alignment.bottomCenter,
          //         child: CircleAvatar(
          //           radius: 1.5,
          //           backgroundColor:
          //               isSelected || isToday ? Colors.white : Colors.blue,
          //         ),
          //       )
          //     : const SizedBox(),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              nepaliDate.toDateTime().day.toString(),
              style: TextStyle(
                  fontSize: 8,
                  color: isWeekend
                      ? Colors.red
                      : isSelected || isToday
                      ? Colors.white
                      : null),
            ),
          ),
        ],
      ),
    ),
  );
}
