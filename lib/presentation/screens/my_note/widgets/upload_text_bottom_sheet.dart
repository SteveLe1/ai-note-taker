import 'package:coconut_note/common/widgets/zp_text_button.dart';
import 'package:coconut_note/common/widgets/zp_textfield.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coconut_note/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';
class UploadtTextBottomSheet extends BottomSheetCommon {
  ValueChanged<int> onChanged;

  UploadtTextBottomSheet({required this.onChanged});

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
            Padding(
              padding: EdgeInsets.all(16.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ZPTextButton(text: "Cancel", textStyle: TextStyles.w500Size16Black5, onPressed: () => appRouter.pop(),),
                        Expanded(
                          child: ZPText(
                              keyText: "Upload text", style: TextStyles.w700Size22Black3, textAlign: TextAlign.center,),
                        ),
                        ZPTextButton(text: "Submit", textStyle: TextStyles.w500Size16Black5, onPressed: () => appRouter.pop(),),
                      ],
                    ),
                  ),
                  Expanded(
                      child:ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: ZPText(
                                keyText: "Text", style: TextStyles.w700Size18Black3),
                          ),
                          ZPTextField(
                            // controller: emailController,
                            borderColor: AppColors.white1,
                            fillColor: AppColors.white1,
                            // hintText: "",
                            // hintStyle: TextStyles.w500Size15Grey3,
                            textStyle: TextStyles.w500Size15Black3,
                            maxLine: 8,
                            onChanged: (text) {

                            },
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
                          )
                        ],
                      ),),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ZPButton(
                        height: 52.h,
                        width: MediaQuery.of(context).size.width * 0.4,
                        text: "Scan text",
                        textStyle: TextStyles.w600Size18Black3,
                        color: AppColors.grey1,
                        radius: 100,
                        padding: EdgeInsets.all(12.h),
                        onPressed: (){},
                      ),
                    ),
                  ),
                   SizedBox(width: 8.w,),
                  Expanded(
                    child: ZPButton(
                      height: 52.h,
                      width: MediaQuery.of(context).size.width * 0.4,
                      text: "Import PDF",
                      textStyle: TextStyles.w600Size18Black3,
                      color: AppColors.grey1,
                      radius: 100,
                      padding: EdgeInsets.all(12.h),
                      onPressed: (){},
                    ),
                  ),
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
