import 'package:ecommerce/Ui/auth/login/forget_password/confirmation_email.dart';
import 'package:ecommerce/Ui/auth/register/email_verfaication.dart';
import 'package:ecommerce/Ui/home_screen/homescreen.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController(
    text: 'sayed',
  );
  final TextEditingController mailController = TextEditingController(
    text: 'hend@gmail.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: '1233333333ndkhbh3',
  );
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Text(
                    AppLocalizations.of(context)!.login,
                    style: AppStyles.heading24BoldBlack,
                  ),

                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dont_have_account,
                        style: AppStyles.reguler14Gray,
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.registerRoute,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.sign_up,
                          style: AppStyles.medium14Praimary,
                        ),
                      ),
                    ],
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
                  Text(
                    AppLocalizations.of(context)!.password,
                    style: AppStyles.body14MediumBlack,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    borderColor: AppColors.primaryColor,
                    keyBoardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    hintText: AppLocalizations.of(context)!.enter_password,
                    validator: AppValidators.validatePassword,
                    style: AppStyles.hint12RegularText,
                    filledColor: AppColors.whiteColor,
                    isPassword: true,
                    suffixIcon: Icon(
                      Icons.visibility_outlined,
                      color: AppColors.grayColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmationEmail()),
                      );
                      }, child:  Text(
                        AppLocalizations.of(context)!.forgot_password,
                        style: AppStyles.medium14Praimary,
                      ),)                     
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    text: AppLocalizations.of(context)!.login,
                    textStyle: AppStyles.body14SemiBoldWhite,
                    backGroundColor: AppColors.blackColor,
                    onButtonClicked: () {
                      if (formKey.currentState?.validate() == true) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false, // Remove all previous routes
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  CustomElevatedButton(
                    backGroundColor: AppColors.whiteColor,
                    text: AppLocalizations.of(context)!.login_with_google,
                    onButtonClicked: () {},
                    textStyle: AppStyles.body14SemiBoldBlack,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {}
  }
}
