import 'package:coconut_note/common/widgets/nt_list_tile.dart';
import 'package:coconut_note/domain/entities/new_note.dart';
import 'package:coconut_note/presentation/screens/my_note/widgets/record_bottom_sheet.dart';
import 'package:coconut_note/presentation/screens/my_note/widgets/upload_audio_bottom_sheet.dart';
import 'package:coconut_note/presentation/screens/my_note/widgets/upload_text_bottom_sheet.dart';
import 'package:coconut_note/presentation/screens/my_note/widgets/web_link_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class NewNoteBottomSheet extends BottomSheetCommon {
  ValueChanged<int> onChanged;

  NewNoteBottomSheet({required this.onChanged});

  @override
  Widget create(BuildContext context) {
    final List<NewNote> noteFunction = [
      const NewNote(name: "Record audio", pathIcon: Images.recordAudio),
      const NewNote(name: "Upload audio", pathIcon: Images.uploadAudio),
      const NewNote(name: "Scan text", pathIcon: Ics.scanText),
      const NewNote(name: "Upload text", pathIcon: Ics.uploadText),
      const NewNote(name: "Use a web link", pathIcon: Images.uploadLink),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZPText(keyText: "New Note", style: TextStyles.w700Size25Black3,),
                  InkWell(
                      onTap: () => hideBottomSheet(context),
                      child: Container(
                          width: 32.w,
                          height: 32.h,
                          padding: EdgeInsets.all(4.0.w),
                          // margin: EdgeInsets.only(left: 16.0.h),
                          decoration: const BoxDecoration(color: AppColors.greyTextField, shape: BoxShape.circle),
                          child:  const Icon(Icons.close, color: AppColors.greySearch,)
                      ))
                ],
              ),
              SizedBox(height: 12.h,),
              Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: noteFunction.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NTListTile(
                          color: AppColors.lightPurple,
                          margin: EdgeInsets.only(bottom: 16.0.h),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          leading: Container(
                            width: 44.w,
                            height: 44.h,
                            padding: EdgeInsets.all(8.0.w),
                            margin: EdgeInsets.only(left: 16.0.h),
                            decoration:  BoxDecoration(
                                border: Border.all(width: 1, color:  AppColors.grey1),
                                color: AppColors.white1, shape: BoxShape.circle),
                            child: ZPIcon(noteFunction[index].pathIcon,
                              width: 36.w,
                              height: 36.h,
                            ),
                          ),
                          text: noteFunction[index].name,
                          subText: index == noteFunction.length -1 ? 'Youtube, website, Google Drive' : '',
                          onPressed: () {
                            if(index == 0){
                              RecordBottomSheet(onChanged: (int value) {  }).showBottomSheet(context);
                            }
                            if(index == 1){
                              UploadAudioBottomSheet(onChanged: (int value) {  }).showBottomSheet(context);
                            }
                            if(index == 2){
                              UploadTextBottomSheet(onChanged: (int value) {  }).showBottomSheet(context);
                            }
                            if(index == 3){
                              UploadTextBottomSheet(onChanged: (int value) {  }).showBottomSheet(context);
                            }
                            if(index == 4){
                              WeblinkBottomSheet(onChanged: (int value) {  }).showBottomSheet(context);
                            }
                          },
                          onPressedLeading: () {},
                          trailing: const SizedBox(),
                        );
                      })),
            ],
          ),
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
