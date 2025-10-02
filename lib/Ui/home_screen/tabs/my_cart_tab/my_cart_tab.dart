import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/cart_item.dart';
import 'package:ecommerce/core/providers/add_to_cart_provider.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/bottom_sheet_widgets/delete_bottom_sheet.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/Ui/home_screen/widget/bottom_sheet_widgets/voucher_code_bottom_sheet.dart';
import 'package:ecommerce/core/models/checkout_models.dart';
import 'package:ecommerce/Ui/checkout/checkout_screen.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final List<Map<String, String>> categories = [
  {"name": "T-shirt", "image": "assets/images/t-shrit.jpg"},
  {"name": "Shirt", "image": "assets/images/shirt.jpg"},
  {"name": "Pants", "image": "assets/images/pants.jpg"},
  {"name": "Jacket", "image": "assets/images/jacket.jpg"},
  {"name": "Outfit", "image": "assets/images/outfit.jpg"},
  {"name": "Shoes", "image": "assets/images/shoes.jpg"},
];

class CartProduct {
  final String id;
  final String title;
  final String imageAsset;
  final double price;
  int quantity;
  CartProduct({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.price,
    this.quantity = 1,
  });
}

class MyCartTab extends StatefulWidget {
  const MyCartTab({super.key});
  @override
  State<MyCartTab> createState() => _MyCartTabState();
}

class _MyCartTabState extends State<MyCartTab> {
  late List<CartProduct> products;
  static const double fixedPrice = 250.0;

  @override
  void initState() {
    super.initState();
  
    products = [];
  }

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);

    products = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: AppColors.transparentColor,
        title: Text(
          AppLocalizations.of(context)!.my_cart,
          style: AppStyles.body14MediumBlack,
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          iconSize: 30.sp,
          onPressed: () {
            context.read<HomeProvider>().changeIndex(0);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => VoucherCodeBottomSheet(),
              );
            },
            child: Text(
              AppLocalizations.of(context)!.voucher_code,
              style: AppStyles.bold18Jakarta.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: products.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.your_cart_is_empty,
                        style: AppStyles.body16black,
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      itemBuilder: (context, index) {
                        final item = products[index];
                        return CartItemCard(
                          product: item,
                          onIncrement: () => _increment(index),
                          onDecrement: () => _decrement(index),
                          onRemove: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => DeleteBottomSheet(
                                sourceName: AppLocalizations.of(context)!.cart,
                                itemCount: 1,
                                onDelete: () => _remove(index),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      itemCount: products.length,
                    ),
            ),
            Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.order_info,
                    style: AppStyles.body16black,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.subtotal,
                        style: AppStyles.body16black.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: AppStyles.body16black,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.shipping_cost,
                        style: AppStyles.medium14Praimary.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                      Text('\$0.00', style: AppStyles.body14SemiBoldBlack),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.total,
                        style: AppStyles.body14SemiBoldBlack,
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: AppStyles.body14SemiBoldBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              child: CustomElevatedButton(
                text:
                    '${AppLocalizations.of(context)!.checkout} (${products.length})',
                backGroundColor: products.isNotEmpty
                    ? AppColors.blackColor
                    : AppColors.gray300,
                textStyle: AppStyles.body14SemiBoldWhite.copyWith(
                  color: products.isNotEmpty
                      ? AppColors.whiteColor
                      : AppColors.gray500,
                ),
                onButtonClicked: products.isNotEmpty
                    ? _navigateToCheckout
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double get totalPrice =>
      products.fold(0.0, (sum, p) => sum + p.price * p.quantity);

  void _increment(int index) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.incrementAt(index);
    setState(() {});
  }

  void _decrement(int index) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.decrementAt(index);
    setState(() {});
  }

  void _remove(int index) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.removeAt(index);
    setState(() {});
  }

  void _navigateToCheckout() {
    final orderInfo = OrderInfo(
      subtotal: totalPrice,
      shippingCost: 0.0,
      total: totalPrice,
      itemCount: products.length,
      products: products,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CheckoutScreen(orderInfo: orderInfo, products: products),
      ),
    );
  }
}
