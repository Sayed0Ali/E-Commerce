import 'package:another_flushbar/flushbar.dart';
import 'package:ecommerce/Ui/home_screen/homescreen.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';
import 'package:ecommerce/core/providers/add_to_cart_provider.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/core/utils/page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/providers/favorites_provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String oldPrice;
  final List<Color> colors;
  final String description;

  const ProductDetails({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.colors,
    required this.description,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final PageController _pageController = PageController();
  Color? selectedColor;
  int quantity = 1;
  bool isFav = false;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    if (widget.colors.isNotEmpty) {
      selectedColor = widget.colors[0];
    }
    selectedSize = "M";
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      widget.image,
      widget.image,
      widget.image,
    ]; // Demo purposes

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Slider
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 300.h,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          // Back and Favorite buttons
                          Positioned(
                            top: 40.h,
                            left: 16.w,
                            right: 16.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    size: 30,
                                    color: AppColors.blackColor,
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      final favoritesProvider =
                                          Provider.of<FavoritesProvider>(
                                            context,
                                            listen: false,
                                          );
                                      favoritesProvider.toggleFavorite(
                                        id: widget.title,
                                        title: widget.title,
                                        imageAsset: widget.image,
                                        price: double.parse(
                                          widget.price.replaceAll('\$', ''),
                                        ),
                                        oldPrice: double.parse(
                                          widget.oldPrice.replaceAll('\$', ''),
                                        ),
                                        colors: widget.colors,
                                        colorsCount: widget.colors.length
                                            .toString(),
                                      );
                                    },
                                    icon: Consumer<FavoritesProvider>(
                                      builder: (context, provider, _) => Icon(
                                        provider.isFavorite(widget.title)
                                            ? Icons.favorite
                                            : Icons.favorite_border_rounded,
                                        color: provider.isFavorite(widget.title)
                                            ? AppColors.redColor
                                            : AppColors.whiteColor,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 16.h,
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: images.length,

                          effect: ExpandingDotsEffect(
                            dotHeight: 8.h,

                            dotWidth: 8.w,
                            activeDotColor: AppColors.blackColor,
                            dotColor: AppColors.gray300,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        chipsRow(),
                        // Title and Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.title,
                                style: AppStyles.heading18Bold,
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$ ${widget.price}',
                                  style: AppStyles.heading18Bold,
                                ),
                                Text(
                                  ' \$${widget.oldPrice}',
                                  style: AppStyles.grey14RegularLineThrough,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: 4.5,
                              itemBuilder: (context, index) =>
                                  Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 14,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "4.5 (2,495 reviews)",
                              style: AppStyles.smallSemiBold,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        ReadMoreText(
                          widget.description,
                          trimLines: 3,
                          lessStyle: AppStyles.body14Regular150.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          moreStyle: AppStyles.body14Regular150.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          colorClickableText: AppColors.primaryColor,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Read less',

                          style: AppStyles.body14Regular150,
                        ),
                        SizedBox(height: 12.h),
                        // Colors
                        Text(
                          'Color',
                          style:AppStyles.body12SemiBold100
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: widget.colors.map((color) {
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedColor = color),
                              child: Container(
                                margin: EdgeInsets.only(right: 8.w),
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedColor == color
                                        ? AppColors.redColor
                                        : AppColors.transparentColor,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Size',
                          style: AppStyles.body12SemiBold100
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: ["XS", "S", "M", "L", "XL"].map((size) {
                            final bool isSelected = selectedSize == size;
                            return GestureDetector(
                              onTap: () => setState(() => selectedSize = size),
                              child: Container(
                                margin: EdgeInsets.only(right: 8.w),
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? AppColors.blackColor
                                      : AppColors.transparentColor,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.blackColor
                                        : AppColors.gray300,
                                    width: 1.w,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        SizedBox(height: 12.h),

                        // Quantity
                        Text(
                          'Quantity',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray300),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() => quantity--);
                                  }
                                },
                                icon: Icon(Icons.remove),
                              ),
                              SizedBox(
                                width: 40.w,
                                child: Text(
                                  quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => setState(() => quantity++),
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: Row(
              children: [
                // Buy Now Button
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Buy Now',
                    backGroundColor: AppColors.whiteColor,
                    textStyle: AppStyles.body14SemiBoldBlack,
                    onButtonClicked: () {
                      // todo  Implement Buy Now logic
                    },
                  ),
                ),
                SizedBox(width: 16.w),
            
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Add To Cart',
                    backGroundColor: AppColors.blackColor,
                    textStyle: AppStyles.body14SemiBoldWhite,
                    onButtonClicked: () {
                      final cartProvider = Provider.of<CartProvider>(
                        context,
                        listen: false,
                      );
            
                      cartProvider.addToCart(
                        CartProduct(
                          id: '',
                          title: widget.title,
                          imageAsset: widget.image,
                          price:
                              double.tryParse(
                                widget.price.replaceAll('\$', ''),
                              ) ??
                              0.0,
                          quantity: quantity,
                        ),
                      );
            
                      Flushbar(
                        flushbarPosition: FlushbarPosition.TOP,
                        message: "The product has been added to your cart",
                        icon: Icon(
                          Icons.check_circle,
                          color: AppColors.primaryColor,
                        ),
                        duration: Duration(seconds: 3),
                        borderRadius: BorderRadius.circular(12.r),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        backgroundColor: AppColors.whiteColor,
                        messageColor: AppColors.blackColor,
                        mainButton: TextButton(
                          onPressed: () {
                            // Navigate to home and switch to cart tab
                            Navigator.pushAndRemoveUntil(
                              context,
                              PageTransitions.slideTransition(
                                page: HomeScreen(),
                              ),
                              (route) => false,
                            );
                            context.read<HomeProvider>().changeIndex(2);
                          },
                          child: Text(
                            "View Cart",
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      )..show(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chipsRow() {
    return Row(
      children: [
        Chip(
          label: Text(
            'Top Rated',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10, // إذا بتستخدم ScreenUtil
              fontWeight: FontWeight.w600,
              height: 1.0,
              letterSpacing: 0.15,
              color: AppColors.whiteColor,
              // 1.5% of 10px ≈ 0.15
            ),
          ),
          backgroundColor: const Color(0xFF1F8BDA),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        SizedBox(width: 8.w),
        Chip(
          label: Text(
            'Free Shipping',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              height: 1.0,
              letterSpacing: 0.15,
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: const Color(0xFF08E488),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ],
    );
  }
}
