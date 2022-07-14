import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_fonts.dart';
import '../../common/utils/extensions.dart';

class CustomField extends StatefulWidget {
  const CustomField({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.suffixTapped,
    this.onTap,
    this.isVisible = false,
    this.hintText,
    this.maxLines = 1,
    this.readOnly = false,
    this.fillColor = AppColor.grey50,
    this.maxPrefixWidth,
    this.keyboardType = TextInputType.name,
    this.hasBorder = false,
    this.horizontalPadding,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final String? prefixIcon;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? suffixTapped;
  final VoidCallback? onTap;
  final bool? isVisible;
  final int maxLines;
  final bool readOnly;
  final Color? fillColor;
  final double? maxPrefixWidth;
  final TextInputType keyboardType;
  final bool hasBorder;
  final double? horizontalPadding;
  final TextAlign textAlign;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool validateError = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isVisible!,
      minLines: 1,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      textAlign: widget.textAlign,
      style: TextStyle(
        fontSize: AppFont.font14,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.headline3!.color,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GestureDetector(
            onTap: widget.suffixTapped,
            child: widget.suffixIcon != null
                ? SvgPicture.asset(
                    widget.suffixIcon!,
                    color: getFieldIconColor(
                      text: widget.controller?.text,
                      validatorError: validateError,
                    ),
                    height: 20.h,
                  )
                : const SizedBox(width: 0),
          ),
        ),
        prefixIcon: widget.prefixWidget ??
            (widget.prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                      color: getFieldIconColor(
                        text: widget.controller?.text,
                        validatorError: validateError,
                      ),
                      height: 20.h,
                    ),
                  )
                : const SizedBox(width: 0)),
        suffixIconConstraints: BoxConstraints(minWidth: 20.w),
        prefixIconConstraints: BoxConstraints(minWidth: 20.w),
        filled: widget.hasBorder ? false : true,
        fillColor: _getFillColor(
          hasError: validateError,
          fillColor: widget.fillColor!,
        ),
        hintStyle: TextStyle(
          fontSize: AppFont.font14,
          color: AppColor.grey500,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18.h),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.transparent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.red),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChanged ??
          (String? val) {
            if (widget.validator?.call(val) != null) {
              validateError = true;
            } else {
              validateError = false;
            }
            setState(() {});
          },
      validator: widget.validator,
      onTap: widget.onTap,
    );
  }

  Color _getFillColor({bool? hasError, Color? fillColor}) {
    if (hasError!) {
      return AppColor.red.withOpacity(.08);
    } else {
      return fillColor!;
    }
  }

  Color getFieldIconColor({String? text, bool? validatorError}) {
    if (text!.isEmpty) {
      return AppColor.grey500;
    } else if (!validatorError!) {
      return AppColor.grey900;
    } else {
      return AppColor.red;
    }
  }
}
