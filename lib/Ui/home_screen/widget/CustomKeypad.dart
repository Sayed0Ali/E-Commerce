import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomKeypad extends StatelessWidget {
  final void Function(String) onKeyTap;

  const CustomKeypad({super.key, required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        String value;
        if (index < 9) {
          value = "${index + 1}";
        } else if (index == 9) {
          value = "<-";
        } else if (index == 10) {
          value = "0";
        } else {
          value = "C";
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gray50,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => onKeyTap(value),
          child: Text(value, style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
