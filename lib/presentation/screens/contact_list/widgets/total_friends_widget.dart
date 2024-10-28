import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/bottom_sheet/contact_sorting_sequence_bottom_sheet.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/generated/locale_keys.g.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class TotalFriendsWidget extends StatefulWidget {
  const TotalFriendsWidget({super.key, required this.valueChangedRefresh, required this.bottomNavigationContext});
  final BuildContext bottomNavigationContext;
  final ValueChanged<bool> valueChangedRefresh;

  @override
  State<TotalFriendsWidget> createState() => _TotalFriendsWidgetState();
}

class _TotalFriendsWidgetState extends State<TotalFriendsWidget> with TickerProviderStateMixin{
  late Timer _timer;
  int _start = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }
  
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            widget.valueChangedRefresh(true);
            timer.cancel();
            _controller.stop();
          });
        } else {
          setState(() {
            widget.valueChangedRefresh(false);
            _start--;
            _controller.forward();
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: ZPText(keyText: LocaleKeys.contact_list_total_friends, namedArgs: const {'total': "1200"}, style: TextStyles.w600Size17Black3, overflow: TextOverflow.ellipsis, maxLines: 2,)),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        onTap: () {
                          widget.valueChangedRefresh(false);
                          setState(() {
                            _start = 3;
                          });
                          startTimer();
                          switch (_controller.status) {
                            case AnimationStatus.completed:
                              _controller.reverse();
                              break;
                            case AnimationStatus.dismissed:
                              _controller.forward();
                              break;
                            default:
                          }
                        },
                        child: RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                            child: ZPIcon(Ics.icRefresh, width: 20.w, height: 20.h, color: _start == 0 ? AppColors.black3 : AppColors.mint1, ))),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      ContactSortingSequenceBottomSheet(
                          onChanged: (value) {
                            debugPrint("value $value");
                          }
                      ).showBottomSheet(widget.bottomNavigationContext);
                    },
                    child: ZPIcon(Ics.icAlign, width: 25.w, height: 25.h, color: AppColors.black8,)),
                SizedBox(width: 3.w),
                ZPText(keyText: "연락일 임박순", style: TextStyles.w600Size12Black8,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
