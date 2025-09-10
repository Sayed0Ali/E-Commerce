import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class RegisterVerification extends StatefulWidget {
  const RegisterVerification({super.key});

  @override
  State<RegisterVerification> createState() => _RegisterVerificationState();
}

class _RegisterVerificationState extends State<RegisterVerification> {
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
        title: Text(AppLocalizations.of(context)!.verification_code),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);
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
              style: AppStyles.headline24BoldJakarta,
            ),
            SizedBox(height: 10.h),
            Text(
              AppLocalizations.of(context)!.enter_verification_code,
              style: AppStyles.body14Regulargray,
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
                style: AppStyles.semiBold14,
              ),
            ),

            SizedBox(height: 10.h),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.proceed,
              onButtonClicked: () {},
              backGroundColor: AppColors.blackColor,
              textStyle: AppStyles.semiBold14Jakarta,
            ),

            /// Keypad
            SizedBox(height: 50.h),
            Expanded(
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  String value;
                  if (index < 9) {
                    value = "${index + 1}";
                  } else if (index == 9) {
                    value = "<-"; // Backspace
                  } else if (index == 10) {
                    value = "0";
                  } else {
                    value = "C"; // Clear
                  }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () => _onKeyTap(value),
                    child: Text(value, style: TextStyle(fontSize: 20.sp)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
