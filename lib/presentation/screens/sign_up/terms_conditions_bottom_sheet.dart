import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/bottom_sheet/bottom_sheet_common.dart';
import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_check_box.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class TermsConditionsBottomSheet extends BottomSheetCommon {
  @override
  Widget create(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => hideBottomSheet(context),
                          child: ZPIcon(
                            Ics.icClose,
                            color: AppColors.black1,
                            width: 30.w,
                            height: 30.h,
                          ))
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ZPText(
                    keyText: 'terms_conditions'.tr(),
                    style: const TextStyle(
                      color: AppColors.black1,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TermsConditionsCheckbox(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class TermsConditionsCheckbox extends StatefulWidget {
  const TermsConditionsCheckbox({super.key});

  @override
  State<StatefulWidget> createState() => _TermsConditionsCheckboxState();
}

class _TermsConditionsCheckboxState extends State<TermsConditionsCheckbox> {
  Map<String, bool> hsStatusOptions = {
    'terms_of_service': false,
    'personal_information': false,
    'receive_marketing_infor': false
  };

  bool isSelectedAll = false;

  selectAll() {
    setState(() {
      isSelectedAll = !isSelectedAll;
      hsStatusOptions.updateAll((key, value) => value = isSelectedAll);
    });
  }

  bool enableVerifyEmailButton() {
    return hsStatusOptions['terms_of_service'] == false || hsStatusOptions['personal_information'] == false;
  }

  Widget _renderOption(String description, bool status, {String? rightButton, Color? rbColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11.h),
      child: Row(
        children: [
          ZPCheckBox(
            value: status,
            checkColor: AppColors.white1,
            activeColor: AppColors.mint1,
            onChanged: (value) {
              setState(() {
                hsStatusOptions[description] = !status;
              });
            },
          ),
          Expanded(
            child: ZPText(
                keyText: description.tr(),
                style: const TextStyle(
                  color: AppColors.black5,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
          ),
          rightButton != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: InkWell(
                    onTap: () {},
                    child: ZPText(
                        keyText: rightButton.tr(),
                        style: TextStyle(
                          color: rbColor ?? AppColors.red1,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        )),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ZPCheckBox(
              value: !hsStatusOptions.containsValue(false),
              checkColor: AppColors.white1,
              activeColor: AppColors.mint1,
              onChanged: (value) {
                selectAll();
              },
            ),
            ZPText(
                keyText: 'totally_agree'.tr(),
                style: const TextStyle(
                  color: AppColors.black5,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
          ],
        ),
        Divider(height: 1.h, color: AppColors.grey5),
        ...hsStatusOptions.entries.map((e) {
          String rightButton = '';
          Color? rbColor;
          if (['terms_of_service', 'personal_information'].contains(e.key)) {
            rightButton = 'essential'.tr();
          } else {
            rightButton = 'select'.tr();
            rbColor = AppColors.black5;
          }
          return _renderOption(e.key, e.value, rightButton: rightButton, rbColor: rbColor);
        }).toList(),
        SizedBox(
          height: 25.h,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ZPButton(
            disabled: enableVerifyEmailButton(),
            disableColor: AppColors.white4,
            text: 'verify_email'.tr(),
            onPressed: () {
              appRouter.push(const VerifyEmailRoute());
            },
          ),
        )
      ],
    );
  }
}
