import 'package:daily_productivity/calendar/cubit/calendar_cubit.dart';
import 'package:daily_productivity/calendar/view/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarCubit(),
      child: const CalendarView(),
    );
  }
}
