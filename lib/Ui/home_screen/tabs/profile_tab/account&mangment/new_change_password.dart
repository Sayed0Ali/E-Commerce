import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewChangePassword extends StatelessWidget {
   NewChangePassword({super.key});

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(AppLocalizations.of(context)!.change_password),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
        ),
         actions: [SizedBox(width: 10.w,),
          Text('02/02',style: TextStyle(
          fontSize: 15.sp,color: AppColors.blackColor
        ),),SizedBox(width: 10.w,),],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.new_password, style: AppStyles.headline24BoldJakarta),
              SizedBox(height: 8.h),
              Text(
                AppLocalizations.of(context)!.enter_new_password,
                style: AppStyles.body14Regulargray,
              ),
              SizedBox(height: 20.h),
              Text(AppLocalizations.of(context)!.password, style: AppStyles.body14MediumJakarta),
              SizedBox(height: 10.h),
              CustomTextField(
                keyBoardType: TextInputType.visiblePassword,
          
                hintText:AppLocalizations.of(context)!.enter_password,
                validator: AppValidators.validatePassword,
                style: AppStyles.hint12RegularJakarta,
                filledColor: AppColors.whiteColor,
                borderColor: AppColors.gray300,
               isPassword: true,
              ),
              SizedBox(height: 20.h),
              Text(AppLocalizations.of(context)!.confirm_password, style: AppStyles.body14MediumJakarta),
              SizedBox(height: 10.h),
              CustomTextField(
                keyBoardType: TextInputType.visiblePassword,
          
                hintText: AppLocalizations.of(context)!.enter_password,
                validator: AppValidators.validatePassword,
                style: AppStyles.hint12RegularJakarta,
                filledColor: AppColors.whiteColor,
                borderColor: AppColors.gray300,
                isPassword: true,
              ),
              
              SizedBox(height: 20.h),
             CustomElevatedButton(
                            text: AppLocalizations.of(context)!.save,
                            onButtonClicked: register,
                            backGroundColor: AppColors.blackColor,
                            textStyle: AppStyles.userNameWhite,
                          ),
            ],
          ),
        ),
      ),
    );
  }
   void register() {
    if (formKey.currentState?.validate() == true) {}
  }
}
