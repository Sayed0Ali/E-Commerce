import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/Products_screen.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/disCount_card.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/categoryBrandItem.dart';
import 'package:ecommerce/Ui/home_screen/widget/product_item.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/page_transitions.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

final List<Map<String, String>> categories = [
  {"name": "T-shirt", "image": "assets/images/t-shrit.jpg"},
  {"name": "Shirt", "image": "assets/images/shirt.jpg"},
  {"name": "Pants", "image": "assets/images/pants.jpg"},
  {"name": "Jacket", "image": "assets/images/jacket.jpg"},
  {"name": "Outfit", "image": "assets/images/outfit.jpg"},
  {"name": "Shoes", "image": "assets/images/shoes.jpg"},
];

final List<Map<String, String>> allProducts = [
  {"title": "Cool T-shirt", "image": "assets/images/t-shrit.jpg"},
  {"title": "Denim Jacket", "image": "assets/images/jacket.jpg"},
  {"title": "Sport Shoes", "image": "assets/images/shoes.jpg"},
  {"title": "Classic Pants", "image": "assets/images/pants.jpg"},
];
final List<String> images = [
  "assets/images/t-shrit.jpg",
  "assets/images/jacket.jpg",
  "assets/images/shoes.jpg",
  "assets/images/pants.jpg",
  "assets/images/jacket.jpg",
  "assets/images/shoes.jpg",
];

class _HomeTabState extends State<HomeTab> {
  String _getCategoryKey(String displayName) {
    switch (displayName) {
      case "T-shirt":
        return "t_shirt";
      case "Shirt":
        return "shirt";
      case "Pants":
        return "pants";
      case "Jacket":
        return "jacket";
      case "Outfit":
        return "outfit";
      case "Shoes":
        return "shoes";
      default:
        return displayName.toLowerCase().replaceAll("-", "_");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            scrolledUnderElevation: 0,

            surfaceTintColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.searchRoute,
                  );
                },
                icon: Icon(Icons.search, size: 30.sp),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.notitcationsRoute,
                  );
                },
                icon: Icon(Icons.notifications_outlined, size: 30.sp),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(AppAssets.iconImage),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Stack(
                  children: [
                    _buildAnnouncement(
                      images: [
                        'assets/images/Advertisement1.png',
                        'assets/images/Advertisement2.png',
                        'assets/images/Advertisement3.png',
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _lineBreak(
                  name: AppLocalizations.of(context)!.categories,
                  targetIndex: 1,
                ),
                buildCategories(),

                _lineBreak(
                  name: AppLocalizations.of(context)!.latest_products,
                  targetIndex: 1,
                ),
                buildProducts(allProducts.sublist(0, 2)),

                _lineBreak(
                  name: AppLocalizations.of(context)!.suggested_products,
                  targetIndex: 1,
                ),
                buildProducts(allProducts.sublist(2, 4)),

                _lineBreak(
                  name: AppLocalizations.of(context)!.brands,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.allBrandsRoute,
                    );
                  },
                ),
                buildCategories(),

                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Flash Sale', style: AppStyles.bold18Jakarta),
                    SlideCountdownSeparated(
                      duration: Duration(days: 1),
                      style: AppStyles.body14SemiBoldBlack,
                      slideAnimationCurve: Curves.easeInOut,
                      icon: Icon(
                        Icons.timer_sharp,
                        color: AppColors.primaryColor,
                        size: 30.sp,
                      ),
                      separator: '',
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                   
                    childAspectRatio: 1,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                          onTap: () {
        PageTransitions.navigateWithSlide(
          context,
          ProductsScreen(
            categoryName: "flash_sale", // ثابت أو ممكن تربطه بالـ index
          ),
          animationType: AnimationType.slide,
        );
      },
                      child: DiscountCard(
                        image: images[index],
                        discountText: "-20%",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnnouncement({required List<String> images}) {
    return CarouselSlider(
      items: images.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.asset(url, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
      options: CarouselOptions(
        height: 190,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        viewportFraction: 1,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
    );
  }

  Widget _lineBreak({
    required String name,
    int? targetIndex,
    VoidCallback? onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.bold18Jakarta),
        TextButton(
          onPressed:
              onPressed ??
              () {
                context.read<HomeProvider>().changeIndex(targetIndex ?? 0);
              },
          child: Text(
            AppLocalizations.of(context)!.see_all,
            style: AppStyles.semiBold14,
          ),
        ),
      ],
    );
  }

  SizedBox buildCategories() {
    return SizedBox(
      height: 90.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 8.w,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              PageTransitions.navigateWithSlide(
                context,
                ProductsScreen(
                  categoryName: _getCategoryKey(category["name"] ?? ""),
                ),
                animationType: AnimationType.slide,
              );
            },
            child: CategoryBrandItem(
              title: category['name'] ?? "",
              imageUrl: category['image'] ?? "",
            ),
          );
        },
      ),
    );
  }

  SizedBox buildProducts(List<Map<String, String>> products) {
    return SizedBox(
      height: 227.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductTabItem(
            image: product['image']!,
            title: product['title']!,
            price: "15.25",
            oldPrice: "20.00",
            colors: [Colors.black, Colors.grey, Colors.blue],
            colorsCount: "All 4 Colors",
          );
        },
      ),
    );
  }
}
