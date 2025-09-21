import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/order/compled_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/order/custom_tab_bar.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/order/on_going_tab.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: Text(AppLocalizations.of(context)!.order_history),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              },
            icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          ),
        ),
        body: Column(
          children: [
            const CustomTabBar(),
            Expanded(
              child: TabBarView(children: [OngoingTab(), CompletedTab()]),
            ),
          ],
        ),
      ),
    );
  }
}
