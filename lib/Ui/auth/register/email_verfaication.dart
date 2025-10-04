import 'package:ecommerce/Ui/home_screen/widget/CustomKeypad.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/Ui/home_screen/homescreen.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class EmailVerfaication extends StatefulWidget {
  @override
  State<EmailVerfaication> createState() => _EmailVerfaicationState();
}

class _EmailVerfaicationState extends State<EmailVerfaication> {
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
        fontSize: 20,
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
          AppLocalizations.of(context)!.email_verification,
          style: AppStyles.body14MediumBlack,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.email_verification,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              AppLocalizations.of(context)!.enter_verification_code_sent,
              style: TextStyle(fontSize: 14, color: Colors.grey),
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
                  );
                }
              },
              backGroundColor: AppColors.blackColor,
              textStyle: AppStyles.body14SemiBoldWhite,
            ),
            SizedBox(height: 70.h),
            Expanded(child: CustomKeypad(onKeyTap: _onKeyTap)),
          ],
        ),
      ),
    );
  }
}
