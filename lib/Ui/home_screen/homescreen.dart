import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/profaile_tab.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> bodyList = [
    HomeTab(),
    CategoriesTab(),
    MyCartTab(),
    FavoriteTab(),
    ProfaileTab(),
  ];

  void bottomNaOnTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: bodyList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: bottomNaOnTap,
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        items: [
          buildBottomNavitems(
            index: 0,
            labelName: "Home",
            iconName: AppAssets.iconHomeUnselected,
            iconSelectedName: AppAssets.iconHomeSelected,
          ),
          buildBottomNavitems(
            index: 1,
            labelName: "Categories",
            iconName: AppAssets.iconCategoryUnselected,
            iconSelectedName: AppAssets.iconCategorySelected,
          ),
          buildBottomNavitems(
            index: 2,
            labelName: "My Cart",
            iconName: AppAssets.iconShoppingCartUnselected,
            iconSelectedName: AppAssets.iconShoppingCart,
          ),
          buildBottomNavitems(
            index: 3,
            labelName: "Wishlist",
            iconName: AppAssets.iconHeartUnselected,
            iconSelectedName: AppAssets.iconHeartSelected,
          ),
          buildBottomNavitems(
            index: 4,
            labelName: "Profile",
            iconName: AppAssets.iconProfileUnselected,
            iconSelectedName: AppAssets.iconProfileSelected,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavitems({
    required int index,
    required String iconName,
    required String iconSelectedName,
    required String labelName,
  }) {
    final bool isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 22.r,
        backgroundColor: isSelected
            ? AppColors.transparentColor // selected → فاضي من جوه
            : Colors.white,              // unselected → أبيض
        child: Center(
          child: Image.asset(
            isSelected ? iconSelectedName : iconName,
            width: 24.w,
            height: 24.w,
            fit: BoxFit.contain, // يحافظ على أبعاد الأيقونة الأصلية
          ),
        ),
      ),
      label: labelName,
    );
  }
}
