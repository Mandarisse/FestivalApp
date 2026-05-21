import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class Countdown extends StatelessWidget {
  const Countdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimerCountdown(
          format: CountDownTimerFormat.daysHoursMinutesSeconds,
          endTime: DateTime.parse('2026-07-08'),
        ),
      ],
    );
  }
}
