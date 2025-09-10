import 'package:ecommerce/Ui/home_screen/widget/empty_or_succcess_state.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyOrSuccessState(
      imagePath: AppAssets.onLineShopImage,
      title: "No Completed order.",
      subtitle:
          "We don't have any past orders that have been completed. Start shopping now and create your first order with us..",
      buttonText: "Explore Categories",
    );
  }
}
