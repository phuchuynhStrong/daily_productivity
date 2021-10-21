import 'package:bloc/bloc.dart';
import 'package:daily_productivity/tracker/tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kAndroidkerUrl = 'https://androidker.xyz/';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  void openTheWayToMyWorld() => canLaunch(kAndroidkerUrl).then(
        (value) {
          if (value) {
            launch(kAndroidkerUrl);
          }
        },
      );

  void onViewTasksPressed(BuildContext context) {
    Navigator.of(context)
        .push<void>(MaterialPageRoute(builder: (_) => const TrackerScreen()));
  }
}
