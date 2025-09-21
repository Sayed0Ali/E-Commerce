import 'package:ecommerce/core/models/checkout_models.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodScreen extends StatefulWidget {
  final Function(PaymentMethod) onNext;

  const PaymentMethodScreen({super.key, required this.onNext});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethod? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),

          Expanded(
            child: Column(
              children: [
                _buildPaymentOption(
                  paymentMethod: PaymentMethod.cashOnDelivery,
                  title: AppLocalizations.of(context)!.cash_on_delivery,
                ),
                SizedBox(height: 16.h),

                _buildPaymentOption(
                  paymentMethod: PaymentMethod.electronicWallet,
                  title: AppLocalizations.of(context)!.electronic_wallet,
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required PaymentMethod paymentMethod,
    required String title,
  }) {
    final isSelected = _selectedPaymentMethod == paymentMethod;

    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = paymentMethod),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray200, width: 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.body16black.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.blackColor : AppColors.gray300,
                  width: 2,
                ),
                color: isSelected ? AppColors.blackColor : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: AppColors.whiteColor, size: 16.sp)
                  : null,
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return CustomElevatedButton(
      text: AppLocalizations.of(context)!.continue_text,
      backGroundColor: _selectedPaymentMethod != null
          ? AppColors.blackColor
          : AppColors.gray300,
      textStyle: AppStyles.body14SemiBoldWhite.copyWith(
        color: _selectedPaymentMethod != null
            ? Colors.white
            : AppColors.gray500,
      ),
      onButtonClicked: _selectedPaymentMethod != null ? _continue : null,
    );
  }

  void _continue() {
    if (_selectedPaymentMethod != null) {
      widget.onNext(_selectedPaymentMethod!);
    }
  }
}
