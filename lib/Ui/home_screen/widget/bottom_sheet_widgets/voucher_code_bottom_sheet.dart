import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/core/utils/app_colors.dart';

class VoucherCodeBottomSheet extends StatelessWidget {
  const VoucherCodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Voucher Code',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          CustomTextField(hintText: 'Voucher Code'),
          SizedBox(height: 24.h),
          CustomElevatedButton(
            text: 'Apply',
            onButtonClicked: () {},
            backGroundColor: AppColors.blackColor,
            textStyle: AppStyles.body14SemiBoldWhite,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
