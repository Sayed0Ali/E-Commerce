import 'package:ecommerce/Ui/auth/login/forget_password/new_password.dart';
import 'package:ecommerce/Ui/home_screen/widget/CustomKeypad.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class EmailVerfaicationLogin extends StatefulWidget {
  @override
  State<EmailVerfaicationLogin> createState() => _EmailVerfaicationState();
}

class _EmailVerfaicationState extends State<EmailVerfaicationLogin> {
  final TextEditingController pinController = TextEditingController();

  final int pinLength = 6;

  void _onKeyTap(String value) {
    if (value == "C") {
      pinController.clear();
    } else if (value == "<-") {
      if (pinController.text.isNotEmpty) {
        pinController.text = pinController.text.substring(
          0,
          pinController.text.length - 1,
        );
      }
    } else {
      if (pinController.text.length < pinLength) {
        pinController.text += value;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forgot_password,
          style: AppStyles.body14MediumBlack,
        ),
        actions: [
          SizedBox(width: 10.w),

          Text(
            AppLocalizations.of(context)!.step_02_03,
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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.email_verification,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              AppLocalizations.of(context)!.enter_verification_code,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            Pinput(
              controller: pinController,
              length: pinLength,
              readOnly: true,
              defaultPinTheme: defaultPinTheme,
            ),

            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.resend_code,
                style: AppStyles.medium14Praimary,
              ),
            ),

            SizedBox(height: 10.h),

            CustomElevatedButton(
              text: AppLocalizations.of(context)!.proceed,
              onButtonClicked: () {
                if (pinController.text.length == pinLength) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NewPassword()),
                  );
                }
              },
              backGroundColor: AppColors.blackColor,
              textStyle: AppStyles.body14SemiBoldWhite,
            ),

            SizedBox(height: 50.h),
            Expanded(child: CustomKeypad(onKeyTap: _onKeyTap)),
          ],
        ),
      ),
    );
  }
}
