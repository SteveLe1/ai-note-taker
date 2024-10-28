import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zippy_flutter/common/widgets/zp_icon.dart';
import 'package:zippy_flutter/common/widgets/zp_text.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';
import 'package:zippy_flutter/utils/style/app_colors.dart';
import 'package:zippy_flutter/utils/style/text_styles.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> listIconFilter = [Images.vipFilter, Images.sFilter, Images.aFilter, Images.bFilter, Images.minusFilter, Images.closeFilter, ];
  int indexFilter = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 109.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => indexFilter = 0),
            child: Container(
              width: 52.w,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: indexFilter == 0 ? AppColors.black3 : AppColors.white2,
                border: Border.all(
                    color: indexFilter == 0 ? AppColors.black3 : AppColors.grey5
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(5.0)),
              ),
              child: ZPText(
                keyText: "ALL",
                style: indexFilter == 0 ? TextStyles.w700Size14White1 : TextStyles.w500Size14Black3,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5.0.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () => setState(() => indexFilter = 1),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: indexFilter == 1 ? AppColors.black3 : AppColors.white2,
                                        border: Border.all(
                                            color: indexFilter == 1 ? AppColors.black3 : AppColors.grey5
                                        ),
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0.w),
                                          child: ZPIcon(Ics.icCallHurry, width: 20.w, height: 20.h, color: indexFilter == 1 ? AppColors.white1 : AppColors.black3,),
                                        ),
                                        ZPText(
                                          keyText: "연락해요!",
                                          style: indexFilter == 1 ? TextStyles.w700Size14White1 : TextStyles.w500Size14Black3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0.w,),
                              Expanded(
                                child: InkWell(
                                  onTap: () => setState(() => indexFilter = 2),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: indexFilter == 2 ? AppColors.black3 : AppColors.white2,
                                        border: Border.all(
                                            color: indexFilter == 2 ? AppColors.black3 : AppColors.grey5
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0.w),
                                          child: ZPIcon(Ics.icLate, width: 20.w, height: 20.h, color: indexFilter == 2 ? AppColors.white1 : AppColors.black3,),
                                        ),
                                        ZPText(
                                          keyText: "이제라도!",
                                          style: indexFilter == 2 ? TextStyles.w700Size14White1 : TextStyles.w500Size14Black3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0.h),
                            child: Container(
                              height: 52.h,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                  color: AppColors.white2,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(15.0)),
                                  border: Border.all(
                                      color: AppColors.grey5
                                  )
                              ),
                              child:  ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: listIconFilter.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    int indexIcon = index + 3;
                                    return InkWell(
                                      onTap: () => setState(() => indexFilter = indexIcon),
                                      child: Container(
                                        width: 44.w,
                                        height: 44.h,
                                        padding: EdgeInsets.all(indexFilter != indexIcon ? 0 : 4.0.w),
                                        decoration: BoxDecoration(
                                            color: indexFilter != indexIcon ? AppColors.white1 : AppColors.black3,
                                            shape: BoxShape.circle
                                        ),
                                        child: ZPIcon(listIconFilter[index], width: 36.w, height: 36.h,),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
