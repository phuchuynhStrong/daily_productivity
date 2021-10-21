import 'dart:math';

import 'package:daily_productivity/calendar/view/task_chip_widget.dart';
import 'package:daily_productivity/l10n/l10n.dart';
import 'package:daily_productivity/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

const kSampleChips = ['Shot Dribble', 'Meeting', 'Fitness', 'Mabar', 'Course'];

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final random = Random();
  List<String> chips = [];

  void loadChips() {
    final newChips = <String>[];
    final size = random.nextInt(kSampleChips.length);
    for (var i = 0; i < size; i++) {
      final index = random.nextInt(size);
      final chip = kSampleChips[index];
      if (!newChips.contains(chip)) {
        newChips.add(chip);
      }
    }

    setState(() {
      chips = [...newChips];
    });
  }

  DateTime? selected;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Text(
              l10n.androidker,
              style: textTheme.headline6,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.angleLeft),
                iconSize: IconSizes.sm,
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.angleRight),
                iconSize: IconSizes.sm,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: Insets.lg),
          TableCalendar<DateTime>(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            headerVisible: false,
            selectedDayPredicate: (day) => day == selected,
            onDaySelected: (selectedDay, focusedDay) => setState(() {
              selected = selectedDay;
              loadChips();
            }),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              defaultTextStyle: textTheme.button!,
              selectedDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange,
                ),
                color: Colors.transparent,
              ),
              todayTextStyle: textTheme.button!,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: textTheme.button!,
              weekendStyle: textTheme.button!,
            ),
          ),
          SizedBox(height: Insets.lg),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: Insets.lg,
            ),
            child: AnimatedSwitcher(
              duration: Times.medium,
              child: Wrap(
                key: ValueKey(selected),
                spacing: Insets.lg,
                children: chips
                    .map((chip) => TaskChipWidget(
                          title: chip,
                        ))
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: Insets.xl),
          Flexible(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Corners.radiusVal * 4),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.4),
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: Insets.lg),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Insets.lg,
                  right: Insets.lg,
                  top: Insets.lg * 1.5,
                  bottom: Insets.med,
                ),
                child: BarChart(
                  BarChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(
                        getTextStyles: (context, pos) {
                          return textTheme.caption;
                        },
                        getTitles: (date) {
                          switch (date.toInt()) {
                            case DateTime.monday:
                              return 'Mon';
                            case DateTime.tuesday:
                              return 'Tue';
                            case DateTime.wednesday:
                              return 'Wed';
                            case DateTime.thursday:
                              return 'Thu';
                            case DateTime.friday:
                              return 'Fri';
                            case DateTime.saturday:
                              return 'Sat';
                            default:
                              return 'Sun';
                          }
                        },
                        showTitles: true,
                      ),
                      topTitles: SideTitles(
                        showTitles: false,
                      ),
                      leftTitles: SideTitles(
                        showTitles: false,
                      ),
                      rightTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    barGroups: [
                      DateTime.monday,
                      DateTime.tuesday,
                      DateTime.wednesday,
                      DateTime.thursday,
                      DateTime.friday,
                      DateTime.saturday,
                      DateTime.sunday,
                    ]
                        .map(
                          (date) => BarChartGroupData(
                            x: date,
                            barRods: [
                              BarChartRodData(
                                y: random.nextInt(18).toDouble(),
                                borderRadius:
                                    BorderRadius.circular(Corners.radiusSmVal),
                                width: Insets.lg * 1.5,
                                colors: [
                                  Colors.orange[100]!,
                                ],
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Insets.lg * 2),
        ],
      ),
    );
  }
}
