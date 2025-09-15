import 'package:ecommerce/Ui/auth/login/forget_password/passord_success_created.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.create_password,
          style: AppStyles.body14MediumBlack,
        ),
        actions: [
          SizedBox(width: 10.w),

          Text(
            AppLocalizations.of(context)!.step_03_03,
            style: TextStyle(fontSize: 15.sp, color: AppColors.blackColor),
          ),
          SizedBox(width: 10.w),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.new_password,
                style: AppStyles.heading24BoldBlack,
              ),
              SizedBox(height: 10.h),
              Text(
                AppLocalizations.of(context)!.enter_new_password,
                style: AppStyles.reguler14Gray,
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 10.h),
              CustomTextField(
                keyBoardType: TextInputType.visiblePassword,
                hintText: AppLocalizations.of(context)!.enter_password,
                validator: AppValidators.validatePassword,
                style: AppStyles.hint12RegularText,
                filledColor: AppColors.whiteColor,
                borderColor: AppColors.gray300,
                isPassword: true,
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.confirm_password,
                style: AppStyles.body14MediumBlack,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                keyBoardType: TextInputType.visiblePassword,
                hintText: AppLocalizations.of(context)!.enter_password,
                validator: AppValidators.validatePassword,
                style: AppStyles.hint12RegularText,
                filledColor: AppColors.whiteColor,
                borderColor: AppColors.gray300,
                isPassword: true,
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.save,
                onButtonClicked: () {
                  login();
                },

                backGroundColor: AppColors.blackColor,
                textStyle: AppStyles.userNameWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {
      Navigator.pushReplacement(
        formKey.currentContext!,
        MaterialPageRoute(builder: (context) => PassordSuccessCreated()),
      );
    }
  }
}
