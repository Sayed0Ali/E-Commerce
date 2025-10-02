import 'package:ecommerce/Ui/auth/login/forget_password/email_verfaication_login.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmationEmail extends StatelessWidget {
  ConfirmationEmail({super.key});
  final TextEditingController mailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          AppLocalizations.of(context)!.forgot_password,
          style: AppStyles.body14MediumBlack,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
        ),
        actions: [
          SizedBox(width: 10.w),
          Text(
            AppLocalizations.of(context)!.step_01_03,
            style: TextStyle(fontSize: 15.sp, color: AppColors.blackColor),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.confirmation_email,
                style: AppStyles.heading24BoldBlack,
              ),
              SizedBox(height: 10.h),
              Text(
                AppLocalizations.of(context)!.enter_verification_code,
                style: AppStyles.reguler14Gray,
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.email_address,
                style: AppStyles.body14MediumBlack,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                borderColor: AppColors.primaryColor,
                hintText: AppLocalizations.of(context)!.enter_email_address,
                style: AppStyles.hint12RegularText,
                filledColor: AppColors.whiteColor,
                controller: mailController,
                validator: AppValidators.validateEmail,
                keyBoardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.send,
                onButtonClicked: () {
                  register();
                },
                backGroundColor: AppColors.blackColor,
                textStyle: AppStyles.body14SemiBoldWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      Navigator.push(
        formKey.currentContext!,
        MaterialPageRoute(builder: (context) => EmailVerfaicationLogin()),
      );
    }
  }
}
