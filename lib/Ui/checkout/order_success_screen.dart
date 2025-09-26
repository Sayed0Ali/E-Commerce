import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:ecommerce/Ui/home_screen/widget/empty_or_succcess_state.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyOrSuccessState(
      
      imagePath: AppAssets.order_success,
      title: AppLocalizations.of(context)!.order_placed_successfully,
      subtitle: AppLocalizations.of(context)!.thank_you_message,
      buttonText: AppLocalizations.of(context)!.continue_shopping,
    );
  }
}
