import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@immutable
class ZPTimePicker extends StatefulWidget {
  ZPTimePicker({
    Key? key,
    this.labelStyle,
    this.value,
    required this.onChanged,
    this.noBorder = false,
    this.isValidate,
    this.errorText,
    required this.initDateTime,
  }) : super(key: key);

  final TextStyle? labelStyle;
  String? value;
  final ValueChanged<DateTime> onChanged;
  final bool noBorder;
  final bool? isValidate;
  final String? errorText;
  final DateTime? initDateTime;

  @override
  State<ZPTimePicker> createState() => _ZPTimePickerState();
}

class _ZPTimePickerState extends State<ZPTimePicker> {
  final TextEditingController _timePicker = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.initDateTime != null) {
      if (widget.initDateTime!.hour >= 12) {
        _timePicker.text =
            "${widget.initDateTime!.hour % 12 == 0 ? "12" : widget.initDateTime!.hour - 12}:${widget.initDateTime!.minute < 10 ? "0${widget.initDateTime!.minute}" : "${widget.initDateTime!.minute}"}";
      } else {
        _timePicker.text =
            "${widget.initDateTime!.hour == 0 ? "12" : widget.initDateTime!.hour}:${widget.initDateTime!.minute < 10 ? "0${widget.initDateTime!.minute}" : "${widget.initDateTime!.minute}"}";
      }
    }
    super.initState();
  }

  Future displayTimePicker(BuildContext context) async {
    DateTime timePicker = widget.initDateTime ?? DateTime.now();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SafeArea(
            child: SizedBox(
              height: 422,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: EdgeInsets.only(top: 10.h, right: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () => appRouter.pop(),
                                child: ZPIcon(
                                  Ics.icClose,
                                  color: AppColors.black1,
                                  width: 40.w,
                                  height: 40.h,
                                ))
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 44.h, left: 25.w, right: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ZPText(
                          keyText: "시간 설정",
                          style: TextStyles.w800Size22Black3,
                        ),
                        Expanded(
                          child: CupertinoDatePicker(
                            initialDateTime: widget.initDateTime ?? timePicker,
                            onDateTimeChanged: (DateTime newDate) {
                              timePicker = newDate;
                            },
                            use24hFormat: false,
                            maximumDate: DateTime(DateTime.now().year, 12, 30),
                            minimumYear: DateTime.now().year,
                            maximumYear: 2100,
                            minuteInterval: 1,
                            mode: CupertinoDatePickerMode.time,
                          ),
                        ),
                        ZPButton(
                            text: "완료",
                            textStyle: TextStyles.w600Size16Black3,
                            onPressed: () {
                              setState(() {
                                int hour = timePicker.hour;
                                int minute = timePicker.minute;
                                if (hour > 12) {
                                  _timePicker.text =
                                      "${hour % 12 == 0 ? "12" : hour - 12}:${minute < 10 ? "0$minute" : "$minute"}";
                                } else {
                                  _timePicker.text = "${hour == 0 ? "12" : hour}:${minute < 10 ? "0$minute" : "$minute"}";
                                }
                                widget.onChanged(timePicker);
                              });
                              appRouter.pop();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () async{
          await displayTimePicker(context);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(10.w, 6.h, 10.w, 6.h),
          elevation: 0,
          backgroundColor: AppColors.white4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZPText(keyText: "09:00 PM", style: TextStyles.w500Size13Black5),
            SizedBox(
              width: 10.w,
            ),
            ZPIcon(
              Ics.icArrowDown,
              width: 18.w,
              color: AppColors.black5,
            ),
          ],
        ),
      ),
    );
  }
}
