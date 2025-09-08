import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Ui/home_screen/widget/categoryBrandItem.dart';
import 'package:ecommerce/Ui/home_screen/widget/product_item.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(AppAssets.iconSearch),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(AppAssets.iconNotifications),
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
              _lineBreak(name: "Categories"),
              buildCategories(
                "Fashion",
                "https://img.icons8.com/ios-filled/50/000000/t-shirt.png",
              ),
              _lineBreak(name: "Latest Products"),
              buildProducts(),
              _lineBreak(name: "Suggested Products"),
              buildProducts(),
              _lineBreak(name: "Brands"),
              buildCategories(
                "Brand",
                "https://img.icons8.com/ios-filled/50/000000/t-shirt.png",
              ),
            ],
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
        enlargeCenterPage: false,
        enableInfiniteScroll: true,
      ),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.bold18Jakarta),
        TextButton(
          onPressed: () {
            //todo: navigate to all
         
          },
          child: Text("SEE ALL", style: AppStyles.semiBold14),
        ),
      ],
    );
  }

  SizedBox buildCategories(String title, String imageUrl) {
    return SizedBox(
      height: 90.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1.w,
          childAspectRatio: 1,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return CategoryBrandItem(title: title, imageUrl: imageUrl);
        },
      ),
    );
  }

  SizedBox buildProducts() {
    return SizedBox(
      height: 227.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return const ProductTabItem();
        },
      ),
    );
  }
}
