import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          AppLocalizations.of(context)!.payment_method,
          style: AppStyles.body14MediumBlack,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
                infoContainerRow(
                  value: AppLocalizations.of(context)!.cash_on_delivery,
                  index: 0,
                ),
                infoContainerRow(
                  value: AppLocalizations.of(context)!.electronic_wallet,
                  index: 1,
                ),
                SizedBox(height: 10.h),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.s_continue,
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
    if (formKey.currentState?.validate() == true) {
      // your logic
    }
  }

  Widget infoContainerRow({required String value, required int index}) {
    final bool isActive = selectedIndex == index;

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Expanded(child: Text(value, style: AppStyles.body14MediumBlack)),
            InkWell(
              onTap: () => setState(() => selectedIndex = index),
              borderRadius: BorderRadius.circular(20.r),
              child: _buildRadioCircle(isActive),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioCircle(bool isActive) {
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: AppColors.gray400, width: 2.w),
      ),
      child: Container(
        width: 14.w,
        height: 14.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.blackColor : Colors.white,
        ),
      ),
    );
  }
}
