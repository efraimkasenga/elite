import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration:
                const BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(
                      top: Radius.circular(
                          20)),
              color: Color(
                  0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(
                      0x12000000),
                  offset:
                      Offset(
                          0,
                          7),
                  blurRadius:
                      24,
                ),
              ],
            ),
            child:
                TableCalendar(
              focusedDay:
                  selectedDate,
              firstDay:
                  DateTime
                      .now(),
              lastDay: DateTime
                      .now()
                  .add(const Duration(
                      days:
                          30)),
              currentDay:
                  selectedDate,
              onDaySelected:
                  (selectedDay,
                      focusedDay) {
                // selectDate(
                //     selectedDay);
              },
    
              calendarFormat:
                  CalendarFormat
                      .month,
              calendarStyle:
                  const CalendarStyle(
                weekendTextStyle:
                    TextStyle(
                  fontFamily:
                      'Montserrat',
                  fontWeight:
                      FontWeight
                          .w600,
                  fontSize:
                      12,
                  color: Color(
                      0xff000000),
                  height:
                      1.3333333333333333,
                ),
                markerSize:
                    20,
                todayTextStyle:
                    TextStyle(
                  fontFamily:
                      'Montserrat',
                  fontWeight:
                      FontWeight
                          .w600,
                  fontSize:
                      12,
                  color: Color(
                      0xff000000),
                ),
                outsideTextStyle:
                    TextStyle(
                  fontFamily:
                      'Montserrat',
                  fontWeight:
                      FontWeight
                          .w600,
                  fontSize:
                      12,
                  color: Color(
                      0xfff0efcd),
                  height:
                      1.3333333333333333,
                ),
              ),
              daysOfWeekStyle:
                  const DaysOfWeekStyle(
                weekdayStyle:
                    TextStyle(
                  fontFamily:
                      'Montserrat',
                  fontWeight:
                      FontWeight
                          .w600,
                  fontSize:
                      12,
                  color: Color(
                      0xffe6e4ae),
                  height:
                      1.3333333333333333,
                ),
                weekendStyle:
                    TextStyle(
                  fontFamily:
                      'Montserrat',
                  fontWeight:
                      FontWeight
                          .w600,
                  fontSize:
                      12,
                  color: Color(
                      0xffe6e4ae),
                  height:
                      1.3333333333333333,
                ),
              ),
              headerStyle:
                  const HeaderStyle(
                titleTextStyle:
                    TextStyle(
                  fontFamily:
                      'Montserrat',
                  fontWeight:
                      FontWeight
                          .w500,
                  fontSize:
                      15,
                  color: Color(
                      0xff000000),
                  height:
                      1.3333333333333333,
                ),
                leftChevronIcon:
                    Icon(
                  Icons
                      .keyboard_arrow_left,
                  size: 20,
                  color: Colors
                      .black,
                ),
                formatButtonTextStyle:
                    TextStyle(
                        color:
                            Colors.blue),
                rightChevronIcon:
                    Icon(
                  Icons
                      .keyboard_arrow_right,
                  size: 20,
                  color: Colors
                      .black,
                ),
                formatButtonVisible:
                    false,
                titleCentered:
                    true,
              ),
    
              calendarBuilders:
                  CalendarBuilders(
                defaultBuilder: (context,
                        day,
                        focusedDay) =>
                    Container(
                  margin: const EdgeInsets
                      .all(
                      10.0),
                  alignment:
                      Alignment
                          .center,
                  child:
                      Text(
                    day.day
                        .toString(),
                    style:
                        const TextStyle(
                      fontFamily:
                          'Montserrat',
                      fontWeight:
                          FontWeight.w600,
                      fontSize:
                          12,
                      color:
                          Color(0xff000000),
                      height:
                          1.3333333333333333,
                    ),
                  ),
                ),
                selectedBuilder: (context,
                        date,
                        events) =>
                    Container(
                  margin: const EdgeInsets
                      .all(
                      10.0),
                  alignment:
                      Alignment
                          .center,
                  decoration:
                      BoxDecoration(
                    color: const Color(
                        0xffE5E3AD),
                    borderRadius:
                        BorderRadius.circular(30.0),
                  ),
                  child:
                      Text(
                    date.day
                        .toString(),
                    style:
                        const TextStyle(
                      fontFamily:
                          'Montserrat',
                      fontWeight:
                          FontWeight.w600,
                      fontSize:
                          12,
                      color:
                          Color(0xff000000),
                    ),
                  ),
                ),
                todayBuilder: (context,
                        date,
                        events) =>
                    Container(
                  margin: const EdgeInsets
                      .all(
                      10.0),
                  alignment:
                      Alignment
                          .center,
                  decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center:
                            Alignment(-0.54, -1.0),
                        radius:
                            1.137,
                        colors: [
                          Color(0xffebef76),
                          Color(0xffd2d580),
                          Color(0xffd6d098)
                        ],
                        stops: [
                          0.0,
                          0.485,
                          1.0
                        ],
                      ),
                      shape: BoxShape.circle),
                  child:
                      Text(
                    date.day
                        .toString(),
                    style:
                        const TextStyle(
                      fontFamily:
                          'Montserrat',
                      fontWeight:
                          FontWeight.w600,
                      fontSize:
                          12,
                      color:
                          Color(0xff000000),
                      height:
                          1.3333333333333333,
                    ),
                  ),
                ),
              ),
              // calendarController: _controller,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment:
                          Alignment.center,
                      decoration:
                          const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                        color: Color.fromARGB(
                            255,
                            75,
                            77,
                            41),
                      ),
                      padding: const EdgeInsets
                          .all(
                          20.0),
                      child:
                          const Text('Book now'),
                    )),
              ),
            ],
          )
        ],
      );
  }
}
