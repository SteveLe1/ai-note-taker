import 'package:coconut_note/common/widgets/nt_list_tile.dart';
import 'package:coconut_note/domain/entities/new_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class FoldersBottomSheet extends BottomSheetCommon {
  ValueChanged<int> onChanged;

  FoldersBottomSheet({required this.onChanged});

  @override
  Widget create(BuildContext context) {
    final List<NewNote> noteFolders = [
      const NewNote(name: "All Notes", pathIcon: Images.allNote),
      const NewNote(name: "New folder", pathIcon: Images.folders),
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
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
                  ZPText(keyText: "Folders", style: TextStyles.w700Size25Black3,),
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
                      itemCount: noteFolders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NTListTile(
                          isBorderShow : true,
                          isSelected: index == 0 ? true : false,
                          color: index == 0 ? AppColors.purpleBorder.withOpacity(0.15) : AppColors.white1,
                          margin: EdgeInsets.only(bottom: 12.0.h),
                          padding:  EdgeInsets.fromLTRB(0, 16.h, 16.w, 16.h),
                          leading: Container(
                            width: 44.w,
                            height: 44.h,
                            padding: EdgeInsets.all(8.0.w),
                            margin: EdgeInsets.only(left: 16.0.h),
                            decoration: BoxDecoration( color: index == 0 ? AppColors.white1 : AppColors.lightPurple, shape: BoxShape.circle),
                            child: ZPIcon(noteFolders[index].pathIcon,
                              width: 36.w,
                              height: 36.h,
                            ),
                          ),
                          text: noteFolders[index].name,
                          subText: index == noteFolders.length -1 ? '0 notes' : '1 note',
                          onPressed: () => appRouter.push(const FriendDetailRoute()),
                          onPressedLeading: () {},
                          trailing: index == 0
                              ? const SizedBox()
                              : InkWell(
                                onTap: () {},
                                child: const Icon(CupertinoIcons.ellipsis, color: AppColors.greySearch),
                          ),
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
