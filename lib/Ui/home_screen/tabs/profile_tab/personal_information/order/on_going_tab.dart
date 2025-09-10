import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/order/order_state.dart';
import 'package:ecommerce/Ui/home_screen/widget/empty_or_succcess_state.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
// استورد الودجت الجديدة

class OngoingTab extends StatelessWidget {
  const OngoingTab({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, dynamic>> ongoingOrders = [
    
     
    ];

    if (ongoingOrders.isEmpty) {
      return  EmptyOrSuccessState(
        imagePath: AppAssets.onLineShopImage,
title: AppLocalizations.of(context)!.no_ongoing_order,
       subtitle: AppLocalizations.of(context)!.no_ongoing_order_desc,

buttonText: AppLocalizations.of(context)!.explore_categories,      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: ongoingOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final order = ongoingOrders[index];
        return CartProductTile(
          state: order['state'],
          title: order['title'],
          imageAsset: order['imageAsset'],
          price: order['price'],
          quantity: order['quantity'],
        );
      },
    );
  }
}
