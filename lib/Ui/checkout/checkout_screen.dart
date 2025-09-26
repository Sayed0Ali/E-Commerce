import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';
import 'package:ecommerce/core/models/checkout_models.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'shipping_info_screen.dart';
import 'payment_method_screen.dart';
import 'review_order_screen.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final OrderInfo orderInfo;

  const CheckoutScreen({super.key, required this.orderInfo, required List<CartProduct> products});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CheckoutData? checkoutData;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    checkoutData = CheckoutData(orderInfo: widget.orderInfo);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentStep > 0) {
          setState(() {
            currentStep--;
          });
          return false; // Prevent default back behavior
        }
        return true; // Allow default back behavior when on first step
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildCurrentStep()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (currentStep > 0) {
                    setState(() {
                      currentStep--;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.arrow_back_rounded, size: 30.w),
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.checkout,
                  style: AppStyles.body14MediumBlack,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: 16.h),
          _buildProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final steps = [
      {
        'title': AppLocalizations.of(context)!.shipping,
        'icon': Icons.local_shipping,
      },
      {'title': AppLocalizations.of(context)!.payment, 'icon': Icons.payment},
      {'title': AppLocalizations.of(context)!.review, 'icon': Icons.reviews},
    ];

    // We generate a list like: [step0, divider, step1, divider, step2]
    final widgets = List<Widget>.generate(steps.length * 2 - 1, (i) {
      if (i.isEven) {
        final index = i ~/ 2;
        final step = steps[index];
        final isActive = index <= currentStep;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              step['icon'] as IconData,
              color: isActive ? AppColors.primaryColor : AppColors.gray300,
              size: 30.sp,
            ),

            SizedBox(height: 8.h),
            SizedBox(
              width: 70.w,
              child: Text(
                step['title'] as String,
                style: AppStyles.body14MediumBlack.copyWith(
                  color: isActive ? AppColors.primaryColor : AppColors.gray500,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      } else {
        final leftIndex = (i - 1) ~/ 2;
        final isCompleted = leftIndex < currentStep;
        return Container(
          width: 40.w,
          height: 2.h,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          color: isCompleted ? AppColors.primaryColor : AppColors.gray300,
        );
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return ShippingInfoScreen(
          onNext: (shippingInfo) {
            setState(() {
              checkoutData = checkoutData!.copyWith(shippingInfo: shippingInfo);
              currentStep = 1;
            });
          },
        );
      case 1:
        return PaymentMethodScreen(
          onNext: (paymentMethod) {
            setState(() {
              checkoutData = checkoutData!.copyWith(
                paymentMethod: paymentMethod,
              );
              currentStep = 2;
            });
          },
        );
      case 2:
        return ReviewOrderScreen(
          checkoutData: checkoutData!,
          onPlaceOrder: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderSuccessScreen(),
              ),
            );
          },
        );
      default:
        return const SizedBox();
    }
  }
}
