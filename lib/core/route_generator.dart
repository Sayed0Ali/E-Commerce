import 'package:ecommerce/Ui/home_screen/tabs/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'utils/app_routs.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ProductDetails(
            image: args['image'] as String,
            title: args['title'] as String,
            price: args['price'] as String,
            oldPrice: args['oldPrice'] as String,
            colors: args['colors'] as List<Color>,
            description: args['description'] as String,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(AppLocalizations.of(context)!.route_not_found),
            ),
          ),
        );
    }
  }
}
