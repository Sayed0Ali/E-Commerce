import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownField({
    Key? key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      validator: validator,
      dropdownColor: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12.r),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.gray300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
      ),

      items: items.map((T item) {
        return DropdownMenuItem<T>(value: item, child: Text(item.toString()));
      }).toList(),
    );
  }
}
