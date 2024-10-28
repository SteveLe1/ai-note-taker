import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class CountdownTimerWidget extends StatefulWidget {
  final bool isCountdown;

  const CountdownTimerWidget({super.key, required this.isCountdown});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimerWidget> {
  late Timer _timer;
  int _remainingSeconds = 180;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant CountdownTimerWidget oldWidget) {
    if(widget.isCountdown){
      _timer.cancel();
      setState(() {
        _remainingSeconds = 180;
      });
      _startTimer();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
        print("Time up!");
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return ZPText(
      keyText: _formatDuration(Duration(seconds: _remainingSeconds)),
      style: TextStyles.w400Size13White4,
    );
  }
}
