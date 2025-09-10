import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/cart_item.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/languge_bottom_sheet/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
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
    final takeCount = 5;
    products = List.generate(categories.take(takeCount).length, (index) {
      final item = categories[index];
      return CartProduct(
        id: 'p$index',
        title: item['name'] ?? 'Product',
        imageAsset: item['image'] ?? '',
        price: fixedPrice,
        quantity: 1,
      );
    });
  }
  double get totalPrice =>
      products.fold(0.0, (sum, p) => sum + p.price * p.quantity);

  void _increment(int index) {
    setState(() {
      products[index].quantity++;
    });
  }

  void _decrement(int index) {
    setState(() {
      if (products[index].quantity > 1) products[index].quantity--;
    });
  }

  void _remove(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  void _checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Checkout tapped — Total: EGP ${totalPrice.toStringAsFixed(2)}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_cart),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(icon:Icon(Icons.arrow_back_rounded), iconSize: 30.sp,onPressed: (){   context.read<HomeProvider>().changeIndex(0); 
}),
        actions: [
          TextButton(
            onPressed: (){},
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
                  ? const Center(child: Text('Your cart is empty'))
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
                          onRemove: () => _remove(index),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      itemCount: products.length,
                    ),
            ),
            // Total + Checkout
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  children: [
                  
                    Expanded(
                      child: Column(
                        children: [
                          CustomElevatedButton(
                            text: 'Check out',
                            onButtonClicked: _checkout,
                            backGroundColor: AppColors.blackColor,
                            textStyle: AppStyles.userNameWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
