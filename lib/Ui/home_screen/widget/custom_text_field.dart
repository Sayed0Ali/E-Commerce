import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final Color? filledColor;
  final Color? borderColor;
  final bool isPassword;
  final String hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final int maxLines;
  final TextStyle? style;
  final TextInputType keyBoardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;
  final double? borderSize;

  const CustomTextField({
    super.key,
    this.borderSize,
    this.readOnly = false,
    this.filledColor = AppColors.whiteColor,
    this.onChanged,
    this.keyBoardType = TextInputType.text,
    this.validator,
    this.borderColor = AppColors.whiteColor,
    required this.hintText,
    this.labelText,
    this.controller,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.style,
    this.isPassword = false,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
      cursorColor: AppColors.blackColor,
      style: widget.style ?? AppStyles.semiBold14,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyBoardType,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.filledColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        hintStyle: widget.hintStyle ?? AppStyles.hint12RegularText,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color:  AppColors.gray300,
            width:  1.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color:AppColors.primaryColor,
            width:  1.sp,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:  BorderSide(color: AppColors.redColor, width: 1.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:  BorderSide(color: AppColors.redColor, width: 1.sp),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off_sharp : Icons.visibility_outlined,
          color: AppColors.blackColor,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }
    return null;
  }
}
