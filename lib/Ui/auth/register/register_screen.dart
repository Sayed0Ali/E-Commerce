import 'package:ecommerce/Ui/auth/register/email_verfaication.dart';
import 'package:ecommerce/Ui/auth/login/login_screen.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_label.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      resizeToAvoidBottomInset: false,

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
                    AppLocalizations.of(context)!.sign_up,
                    style: AppStyles.heading24BoldBlack,
                  ),

                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_account,
                        style: AppStyles.reguler14Gray,
                      ),
                      SizedBox(width: 0.w),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: AppStyles.medium14Praimary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomLabel(
                    text: AppLocalizations.of(context)!.full_name,
                    isRequired: true,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    borderColor: AppColors.primaryColor,
                    hintText: AppLocalizations.of(context)!.enter_full_name,
                    controller: nameController,
                    keyBoardType: TextInputType.name,
                    style: AppStyles.reguler14Gray,
                    filledColor: AppColors.whiteColor,
                    validator: AppValidators.validateFullName,
                  ),

                  SizedBox(height: 20.h),
                  CustomLabel(
                    text: AppLocalizations.of(context)!.email_address,
                    isRequired: true,
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
                  CustomLabel(
                    text: AppLocalizations.of(context)!.password,
                    isRequired: true,
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
                  CustomElevatedButton(
                    text: AppLocalizations.of(context)!.create_account,
                    textStyle: AppStyles.body14SemiBoldWhite,
                    backGroundColor: AppColors.blackColor,
                    onButtonClicked: register,
                  ),
                  SizedBox(height: 10.h),
                  CustomElevatedButton(
                    backGroundColor: AppColors.whiteColor,
                    text: AppLocalizations.of(context)!.sign_up_with_google,
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

  void register() {
    if (formKey.currentState?.validate() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailVerfaication()),
      );
    }
  }
}
