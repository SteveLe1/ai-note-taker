import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/nt_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final String name;

  const CustomCard({super.key, required this.index, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey1),
      ),
      padding: EdgeInsets.all(20.0.h),
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.sa,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZPText(
            keyText: "$index",
            style: TextStyles.w500Size16Grey2,
            textAlign: TextAlign.left,
          ),
          ZPText(
            keyText: name,
            style: TextStyles.w700Size18Black3,
            // textAlign: TextAlign.left,
          ),
           SizedBox(height: 12.h,),
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> contents = ["Iphone and Ipod only", "Gameboy Advanced", "Iphone, Ipad, Android (web), and desktop (web)", "Only desktop"];
                    return NTListTile(
                      color: AppColors.lightPurple,
                      margin: EdgeInsets.only(bottom: 16.0.h),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      leading: const SizedBox(),
                      text: contents[index],
                      subText: '',
                      onPressed: () {
                      },
                      trailing: const SizedBox(),
                    );
                  })),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}