import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});
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
        title: Text('Contact Us.'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
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
                Text('Full Name', style: AppStyles.body14MediumJakarta),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Full Name',
                  controller: nameController,
                  borderColor: AppColors.gray300,
                  keyBoardType: TextInputType.name,
                  style: AppStyles.body14Regulargray,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validateFullName,
                ),
                SizedBox(height: 20.h),
                Text('Phone Number ', style: AppStyles.body14MediumJakarta),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter Your Phone Number.',
                  controller: phoneController,
                  borderColor: AppColors.gray300,
                  keyBoardType: TextInputType.phone,
                  style: AppStyles.body14Regulargray,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validatePhoneNumber,
                ),
                SizedBox(height: 20.h),
                Text('E-mail address', style: AppStyles.body14MediumJakarta),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter your E-mail address',
                  style: AppStyles.hint12RegularJakarta,
                  borderColor: AppColors.gray300,
                  filledColor: AppColors.whiteColor,
                  controller: mailController,
                  validator: AppValidators.validateEmail,
                  keyBoardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h),
                Text('Message', style: AppStyles.body14MediumJakarta),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter Your Message',
                  style: AppStyles.hint12RegularJakarta,
                  borderColor: AppColors.gray300,
                  filledColor: AppColors.whiteColor,
                  controller: messageController,
                  maxLines: 8,
                  validator: AppValidators.validateFullName,
                  keyBoardType: TextInputType.text,
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  text: 'Send',
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
}
