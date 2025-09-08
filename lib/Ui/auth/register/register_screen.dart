import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Text('Sign Up', style: AppStyles.headline24BoldJakarta),

                Row(
                  children: [
                    Text(
                      'Already have an account?',
                      style: AppStyles.body14Regulargray,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the login screen
                      },
                      child: Text(
                        'Login',
                        style: AppStyles.body14RegularPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text('Full Name', style: AppStyles.body14MediumJakarta),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter your Full Name',
                  controller: nameController,
                  keyBoardType: TextInputType.name,
                  style: AppStyles.body14Regulargray,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validateFullName,
                ),

                SizedBox(height: 20.h),
                Text('E-mail address', style: AppStyles.body14MediumJakarta),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: 'Enter your E-mail address',
                  style: AppStyles.hint12RegularJakarta,
                  filledColor: AppColors.whiteColor,
                  controller: mailController,
                  validator: AppValidators.validateEmail,
                  keyBoardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h),
                Text('Password', style: AppStyles.body14MediumJakarta),
                SizedBox(height: 10.h),
                CustomTextField(
                  keyBoardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  hintText: 'Enter your password',
                  validator: AppValidators.validatePassword,
                  style: AppStyles.hint12RegularJakarta,
                  filledColor: AppColors.whiteColor,
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: AppColors.grayColor,
                  ),
                ),

                SizedBox(height: 20.h),
                CustomElevatedButton(
                  text: 'Create Account',
                  textStyle: AppStyles.semiBold14Jakarta,
                  backGroundColor: AppColors.blackColor,
                  onButtonClicked: () {
                    register();
                  },
                ),
                SizedBox(height: 10.h),
                CustomElevatedButton(
                  text: 'Sign Up with Google',
                  onButtonClicked: () {},
                  textStyle: AppStyles.body14MediumJakarta,
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
