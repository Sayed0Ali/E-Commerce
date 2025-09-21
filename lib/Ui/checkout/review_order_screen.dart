import 'package:ecommerce/core/models/checkout_models.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewOrderScreen extends StatelessWidget {
  final CheckoutData checkoutData;
  final VoidCallback onPlaceOrder;

  const ReviewOrderScreen({
    super.key,
    required this.checkoutData,
    required this.onPlaceOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemsSection(context),
                  SizedBox(height: 24.h),

                  _buildShippingAddressSection(context),
                  SizedBox(height: 24.h),

                  _buildOrderInfoSection(context),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),
          _buildPlaceOrderButton(context),
        ],
      ),
    );
  }

  Widget _buildItemsSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${AppLocalizations.of(context)!.items} (${checkoutData.orderInfo.itemCount})',
          style: AppStyles.body16black,
        ),
        Icon(Icons.arrow_forward_ios, size: 25.sp, color: AppColors.blackColor),
      ],
    );
  }

  Widget _buildShippingAddressSection(BuildContext context) {
    final shipping = checkoutData.shippingInfo!;
    final paymentMethod = checkoutData.paymentMethod!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.shipping_address,
          style: AppStyles.body16black,
        ),
        SizedBox(height: 16.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(
              AppLocalizations.of(context)!.full_name,
              shipping.fullName,
            ),
            SizedBox(height: 8.h),

            _buildInfoRow(
              AppLocalizations.of(context)!.mobile_number,
              '${shipping.countryCode}${shipping.phoneNumber}',
            ),
            SizedBox(height: 8.h),

            _buildInfoRow(
              AppLocalizations.of(context)!.payment_method,
              paymentMethod == PaymentMethod.cashOnDelivery
                  ? AppLocalizations.of(context)!.cash_on_delivery
                  : AppLocalizations.of(context)!.electronic_wallet,
            ),
            SizedBox(height: 8.h),

            _buildInfoRow(AppLocalizations.of(context)!.city, shipping.city),
            SizedBox(height: 8.h),

            _buildInfoRow(
              AppLocalizations.of(context)!.street_address,
              shipping.streetAddress,
            ),
            SizedBox(height: 8.h),

            _buildInfoRow(
              AppLocalizations.of(context)!.postal_code,
              shipping.postalCode,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        SizedBox(
          width: 125.w,
          child: Text(
            '$label:',
            style: AppStyles.body14MediumBlack.copyWith(
              color: AppColors.gray500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppStyles.body14MediumBlack.copyWith(
              color: AppColors.gray500,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          AppLocalizations.of(context)!.order_info,
          style: AppStyles.body16black,
        ),
        SizedBox(height: 16.h),

        Column(
          children: [
            _buildOrderInfoRow(
              AppLocalizations.of(context)!.subtotal,
              '\$${checkoutData.orderInfo.subtotal.toStringAsFixed(2)}',
            ),
            SizedBox(height: 8.h),

            _buildOrderInfoRow(
              AppLocalizations.of(context)!.shipping_cost,
              '\$${checkoutData.orderInfo.shippingCost.toStringAsFixed(2)}',
            ),

            SizedBox(height: 16.h),

            _buildOrderInfoRow(
              AppLocalizations.of(context)!.total,
              '\$${checkoutData.orderInfo.total.toStringAsFixed(2)}',
              isTotal: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderInfoRow(
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppStyles.body14SemiBoldBlack
              : AppStyles.body14MediumBlack.copyWith(color: AppColors.gray500),
        ),
        Text(
          value,
          style: isTotal
              ? AppStyles.body14SemiBoldBlack
              : AppStyles.body14MediumBlack.copyWith(color: AppColors.gray500),
        ),
      ],
    );
  }

  Widget _buildPlaceOrderButton(BuildContext context) {
    return CustomElevatedButton(
      text: AppLocalizations.of(context)!.place_order,
      backGroundColor: AppColors.blackColor,
      textStyle: AppStyles.body14SemiBoldWhite,
      onButtonClicked: onPlaceOrder,
    );
  }
}
