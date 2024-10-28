import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class TimePickerBottomSheet extends BottomSheetCommon {
  FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  Widget create(BuildContext context) {
    return Container(
      color: AppColors.white1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 35,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 2,
                builder: (context, index) {
                  if (index == 0) {
                    return AmPm(
                      isItAm: true,
                    );
                  } else {
                    return AmPm(
                      isItAm: false,
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            width: 49.w,
          ),
          Container(
            width: 35,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 13,
                builder: (context, index) {
                  return MyHours(
                    hours: index,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 47.w,
          ),
          Container(
            width: 35,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 60,
                builder: (context, index) {
                  return MyMinutes(
                    mins: index,
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class MyHours extends StatelessWidget {
  int hours;

  MyHours({required this.hours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: ZPText(
            style: TextStyles.w600Size18Black3,
            keyText: hours.toString(),
          ),
        ),
      ),
    );
  }
}

class MyMinutes extends StatelessWidget {
  int mins;

  MyMinutes({required this.mins});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: ZPText(
            style: TextStyles.w600Size18Black3,
            keyText: mins < 10 ? '0' + mins.toString() : mins.toString(),
          ),
        ),
      ),
    );
  }
}

class AmPm extends StatelessWidget {
  final bool isItAm;

  AmPm({required this.isItAm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: ZPText(
            style: TextStyles.w600Size18Black3,
            keyText: isItAm == true ? LocaleKeys.notification_settings_am : LocaleKeys.notification_settings_pm,
          ),
        ),
      ),
    );
  }
}
