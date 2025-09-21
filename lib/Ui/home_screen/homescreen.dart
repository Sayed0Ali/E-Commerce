import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/favorite_tab/wish_list.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/profaile_tab.dart';
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
    const HomeTab(),
    CategoriesTab(),
    const MyCartTab(),
    const FavoriteTab(),
    const ProfaileTab(),
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
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
        items: [
          buildBottomNavitems(
            index: 0,
            labelName: AppLocalizations.of(context)!.home,
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
          ),
          buildBottomNavitems(
            index: 1,
            labelName: AppLocalizations.of(context)!.categories,
            icon: Icons.category_outlined,
            selectedIcon: Icons.category,
          ),
          buildBottomNavitems(
            index: 2,
            labelName: AppLocalizations.of(context)!.my_cart,
            icon: Icons.shopping_cart_outlined,
            selectedIcon: Icons.shopping_cart,
          ),
          buildBottomNavitems(
            index: 3,
            labelName: AppLocalizations.of(context)!.wishlist,
            icon: Icons.favorite_outline,
            selectedIcon: Icons.favorite,
          ),
          buildBottomNavitems(
            index: 4,
            labelName: AppLocalizations.of(context)!.profile,
            icon: Icons.person_outline,
            selectedIcon: Icons.person,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavitems({
    required int index,
    required String labelName,
    required IconData icon,
    required IconData selectedIcon,
  }) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    final bool isSelected = provider.currentIndex == index;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Icon(
          isSelected ? selectedIcon : icon,
          color: isSelected ? AppColors.primaryColor : Colors.grey,
          size: 24.sp,
        ),
      ),
      label: labelName,
      backgroundColor: Colors.white,
    );
  }
}

