import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Widget/TextStyle.dart';

class CustomTextInputField extends StatelessWidget {
  final String? title;
  final String hintText;
  final bool? readOnly;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool mandatoryField;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;

  const CustomTextInputField({
    Key? key,
    this.title,
    this.suffixIcon,
    required this.hintText,
    this.onTap,
    required this.controller,
    this.readOnly,
    required this.obscureText,
    this.minLines,
    this.maxLines,
    this.prefix,
    this.suffix,
    this.validator,
    this.focusNode,
    this.autovalidateMode,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    required this.mandatoryField,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          obscureText: obscureText,
          maxLines: maxLines,
          focusNode: focusNode,
          minLines: minLines,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            suffixIconColor: Colors.grey,
            suffix: suffix,
            filled: true,
            fillColor: const Color(0xffFFFFFF),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD1D5DB)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            hintText: hintText,
            hintStyle: CustomTextStyle.bodyNormal.copyWith(
              color: const Color(0xff6B7280),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD1D5DB)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xffD1D5DB)),
            ),
          ),
          cursorColor: AppConstant.buttonColor,
          cursorHeight: 20.h,
          autocorrect: true,
          enableSuggestions: true,
          validator: validator,
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },
          style: CustomTextStyle.bodyNormal.copyWith(
            color: Colors.black.withOpacity(0.6),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
