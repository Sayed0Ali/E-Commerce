import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/cart_item.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutItemsScreen extends StatelessWidget {
  final List<CartProduct> cartItems;
  final int itemCount;

  const CheckoutItemsScreen({
    super.key,
    required this.cartItems,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30.w,
            color: AppColors.blackColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.items,
          style: AppStyles.body14MediumBlack,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Items list
            Expanded(
              child: cartItems.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.items,
                        style: AppStyles.body14MediumBlack.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return CartItemCard(
                          product: item,
                          showQuantityControls:
                              true, 
                          onRemove: null, 
                          
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemCount: cartItems.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
