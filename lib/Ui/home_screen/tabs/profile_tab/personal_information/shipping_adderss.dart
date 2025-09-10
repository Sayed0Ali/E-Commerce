import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingAdderss extends StatelessWidget {
  ShippingAdderss({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(AppLocalizations.of(context)!.shipping_address),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, size: 30.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.full_name,
                  style: AppStyles.body14MediumJakarta,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_full_name,
                  controller: nameController,
                  borderColor: AppColors.gray300,
                  keyBoardType: TextInputType.name,
                  style: AppStyles.body14Regulargray,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validateFullName,
                ),

                SizedBox(height: 20.h),
                Text(
                  AppLocalizations.of(context)!.phone_number,
                  style: AppStyles.body14MediumJakarta,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_phone_number,
                  controller: phoneController,
                  borderColor: AppColors.gray300,
                  keyBoardType: TextInputType.phone,
                  style: AppStyles.body14Regulargray,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validatePhoneNumber,
                ),
                SizedBox(height: 20.h),
                buildInfoContainer(
                  AppLocalizations.of(context)!.select_province,
                ),
                buildInfoContainer(AppLocalizations.of(context)!.select_city),

                Text(
                  AppLocalizations.of(context)!.street_address,
                  style: AppStyles.body14MediumJakarta,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_address,
                  style: AppStyles.hint12RegularJakarta,
                  borderColor: AppColors.gray300,
                  filledColor: AppColors.whiteColor,
                  controller: messageController,

                  validator: AppValidators.validateAddress,
                  keyBoardType: TextInputType.text,
                ),
                SizedBox(height: 20.h),
                Text(
                  AppLocalizations.of(context)!.postal_code,
                  style: AppStyles.body14MediumJakarta,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_postal_code,
                  style: AppStyles.hint12RegularJakarta,
                  borderColor: AppColors.gray300,
                  filledColor: AppColors.whiteColor,
                  controller: messageController,

                  validator: AppValidators.validatePostalCode,
                  keyBoardType: TextInputType.text,
                ),
                SizedBox(height: 20.h),

                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.send,
                  onButtonClicked: register,
                  backGroundColor: AppColors.blackColor,
                  textStyle: AppStyles.userNameWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {}
  }

  Widget buildInfoContainer(String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(value, style: AppStyles.body14MediumJakarta)),
            Icon(
              Icons.arrow_drop_down_rounded,
              color: AppColors.gray400,
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
