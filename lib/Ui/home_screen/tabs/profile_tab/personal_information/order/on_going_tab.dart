import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/empty_or_succcess_state.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OngoingTab extends StatelessWidget {
  const OngoingTab({super.key});

  @override
  Widget build(BuildContext context) {
     return const EmptyOrSuccessState(
      imagePath:AppAssets.onLineShopImage,
      title: "No ongoing order.",
      subtitle: "We currently don’t have any active orders in progress. Feel free to explore our products and place a new order.",
      buttonText: "Explore Categories",
    );
  }
  
}
