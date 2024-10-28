import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:coconut_note/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UploadAudioBottomSheet extends BottomSheetCommon {
  ValueChanged<int> onChanged;

  UploadAudioBottomSheet({required this.onChanged});

  @override
  Widget create(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.white3,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SafeArea(
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
                          onTap: () => hideBottomSheet(context),
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
              padding: EdgeInsets.all(16.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: ZPText(
                        keyText: "Upload Audio", style: TextStyles.w700Size22Black3),
                  ),
                  Expanded(
                      child:ListView(
                        children: [
                          ZPButton(
                              text: "How to import from Voice Memos",
                              textStyle: TextStyles.w600Size15White1,
                              color: AppColors.black1,
                              onPressed: (){},
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: ZPText(
                                keyText: "Audio File", style: TextStyles.w700Size18Black3),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white1,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: ZPListTile(
                              text: "Select a file",
                              textStyle: TextStyles.w700Size18Black3,
                              leading: const SizedBox(),
                              trailing: const Icon(CupertinoIcons.chevron_up_chevron_down, size: 28,),
                              onPressed: (){},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: ZPText(
                                keyText: "Audio language", style: TextStyles.w700Size18Black3),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white1,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: ZPListTile(
                              text: "English",
                              textStyle: TextStyles.w700Size18Black3,
                              leading: const SizedBox(),
                              trailing: const Icon(CupertinoIcons.chevron_up_chevron_down, size: 28,),
                              onPressed: (){},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
                            child: ZPText(
                                keyText: "Folder", style: TextStyles.w700Size18Black3),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white1,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: ZPListTile(
                              text: "All notes",
                              textStyle: TextStyles.w700Size18Black3,
                              iconLeading: Ics.icEdit,
                              iconLeadingColor: AppColors.red1,
                              trailing: const Icon(CupertinoIcons.chevron_up_chevron_down, size: 28,),
                              onPressed: (){},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: "How to ",
                                      style: TextStyles.w700Size16Grey1),
                                  TextSpan(
                                    text: "import from Voice Memos",
                                    style: TextStyles.w700Size16Grey1.copyWith(decoration: TextDecoration.underline,),

                                    recognizer: TapGestureRecognizer()..onTap = () {

                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCycle {
  const ContactCycle({required this.imageIcon, required this.title});

  final String imageIcon;
  final String title;
}
