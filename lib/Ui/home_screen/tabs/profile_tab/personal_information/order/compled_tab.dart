import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/order/order_state.dart';
import 'package:ecommerce/Ui/home_screen/widget/empty_or_succcess_state.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> competedOrders = [
      {
        'title': 'Order #1234',
        'imageAsset': AppAssets.onLineShopImage,
        'price': 1000.0,
        'quantity': 2,
      },
    ];
    if (competedOrders.isEmpty) {
      return  EmptyOrSuccessState(
        imagePath: AppAssets.onLineShopImage,
title: AppLocalizations.of(context)!.noCompletedOrderTitle,
       subtitle: AppLocalizations.of(context)!.noCompletedOrderSubtitle,

buttonText: AppLocalizations.of(context)!.explore_categories,);
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: competedOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final order = competedOrders[index];
        return CartProductTile(
          isComplete: true,
          state: 'Finshed',
          title: order['title'],
          imageAsset: order['imageAsset'],
          price: order['price'],
          quantity: order['quantity'],
        );
      },
    );
  }
}
