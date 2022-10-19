import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';

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
