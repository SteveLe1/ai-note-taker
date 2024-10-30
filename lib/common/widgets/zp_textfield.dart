import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

import 'zp_text.dart';

class ZPTextField extends StatefulWidget {
  const ZPTextField(
      {this.labelText,
        this.hintText,
        this.errorText,
        this.initialText,
        this.hintStyle,
        this.suffix,
        this.suffixIcon,
        this.noBorder = false,
        this.readonly = false,
        this.showLabel = false,
        Key? key,
        this.maxLine,
        this.maxLength,
        this.controller,
        this.onChanged,
        this.onSubmitted,
        this.textInputType,
        this.textStyle,
        this.inputFormatters,
        this.focusNode,
        this.textAlign,
        this.enabled,
        this.isValidate,
        this.textInputAction,
        this.prefixIcon,
        this.onTapComplete,
        this.contentPadding,
          this.borderColor = AppColors.black4,
        this.fillColor = AppColors.black4,
        this.obscureText = false,
        this.borderRadius
      })
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? initialText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final bool? enabled;
  final bool readonly;
  final bool? isValidate;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final bool showLabel;
  final TextAlign? textAlign;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Function()? onTapComplete;
  final EdgeInsets? contentPadding;
  final Color borderColor;
  final Color fillColor;
  final bool obscureText;
  final double? borderRadius;

  @override
  State<ZPTextField> createState() => _ZPTextFieldState();
}

class _ZPTextFieldState extends State<ZPTextField> {
  late final controller = widget.controller ?? TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialText ?? controller.text;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = widget.noBorder
        ? InputBorder.none
        : OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(
        color: widget.borderColor,
      ),
    );

    final enabledBorder = widget.noBorder
        ? InputBorder.none
        : OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(
        color: widget.borderColor,
      ),
    );

    final errorBorder = widget.noBorder
        ? InputBorder.none
        : OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: const BorderSide(
        color: AppColors.red1,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showLabel
            ? Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: ZPText(
            keyText: widget.labelText ?? "",
            style: widget.isValidate ?? true
                ? TextStyles.w400White12
                : TextStyles.w600Red12,
          ),
        )
            : const SizedBox(),
        TextField(
          style: widget.textStyle ?? TextStyles.w500White15,
          controller: controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          onSubmitted: widget.onSubmitted,
          keyboardType: widget.textInputType,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readonly,
          textCapitalization: TextCapitalization.none,
          textAlign: widget.textAlign ?? TextAlign.start,
          enabled: widget.enabled,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: widget.fillColor,
            contentPadding: widget.contentPadding,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: widget.showLabel ? "" : widget.labelText,
            labelStyle: (widget.isValidate ?? true)
                ? TextStyles.w400White12
                : TextStyles.w600Red12,
            hintText: widget.hintText?.tr(),
            hintStyle: widget.hintStyle ?? TextStyles.w400White12,
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            border: border,
            focusedBorder: border,
            disabledBorder: border,
            enabledBorder: enabledBorder,
            errorBorder: widget.isValidate ?? true ? border : errorBorder,
            errorStyle: TextStyles.w600Red12,
            focusedErrorBorder:
            widget.isValidate ?? true ? border : errorBorder,
            counterText: "",
            errorText: widget.errorText,
            errorMaxLines: 10,
            prefixIcon: widget.prefixIcon,
          ),
          maxLines: widget.maxLine ?? 1,
          maxLength: widget.maxLength,
          onEditingComplete: widget.onTapComplete,
          obscureText: widget.obscureText,
          obscuringCharacter: '*',
        ),
      ],
    );
  }
}
