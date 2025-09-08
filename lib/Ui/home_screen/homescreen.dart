import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/languge_bottom_sheet/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/profaile_tab.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> bodyList = [
    HomeTab(),
    CategoriesTab(),
    MyCartTab(),
    FavoriteTab(),
    ProfaileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: bodyList[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.changeIndex(index);
        },
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        items: [
          buildBottomNavitems(
            index: 0,
            labelName: AppLocalizations.of(context)!.home,
            iconName: AppAssets.iconHomeUnselected,
            iconSelectedName: AppAssets.iconHomeSelected,
          ),
          buildBottomNavitems(
            index: 1,
            labelName: AppLocalizations.of(context)!.categories,
            iconName: AppAssets.iconCategoryUnselected,
            iconSelectedName: AppAssets.iconCategorySelected,
          ),
          buildBottomNavitems(
            index: 2,
            labelName: AppLocalizations.of(context)!.my_cart,
            iconName: AppAssets.iconShoppingCartUnselected,
            iconSelectedName: AppAssets.iconShoppingCart,
          ),
          buildBottomNavitems(
            index: 3,
            labelName: AppLocalizations.of(context)!.wishlist,
            iconName: AppAssets.iconHeartUnselected,
            iconSelectedName: AppAssets.iconHeartSelected,
          ),
          buildBottomNavitems(
            index: 4,
            labelName: AppLocalizations.of(context)!.profile,
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
    final provider = Provider.of<HomeProvider>(context, listen: false);
    final bool isSelected = provider.currentIndex == index;

    return BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 22.r,
        backgroundColor: isSelected ? AppColors.transparentColor : Colors.white,
        child: Center(
          child: Image.asset(
            isSelected ? iconSelectedName : iconName,
            width: 24.w,
            height: 24.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
      label: labelName,
    );
  }
}
