import 'package:ecommerce/Ui/auth/login/login_screen.dart';
import 'package:ecommerce/Ui/auth/register/register_screen.dart';
import 'package:ecommerce/Ui/auth/register/email_verfaication.dart';
import 'package:ecommerce/Ui/onboarding/introduction_screen.dart';
import 'package:ecommerce/core/providers/add_to_cart_provider.dart';
import 'package:ecommerce/core/providers/favorites_provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/brand.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/Ui/home_screen/homescreen.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/notitfications.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/search_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/product_details/product_details.dart';
import 'package:ecommerce/core/providers/app_languge_provider.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/profaile_tab.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_thems.dart';
import 'package:ecommerce/core/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLangugeProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLangugeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      // دي مقاسات تصميمك (غيّرها لو UI مختلف)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          onGenerateRoute: RouteGenerator.generateRoute,
          routes: {
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.homeTabRoute: (context) => HomeTab(),
            AppRoutes.categoryRoute: (context) => CategoriesTab(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.searchRoute: (context) => SearchTab(),
            AppRoutes.registerVerafaicationRoute: (context) =>
                EmailVerfaication(),
            AppRoutes.profileRoute: (context) => ProfaileTab(),
            AppRoutes.notitcationsRoute: (context) => NotificationsTab(),
            AppRoutes.allBrandsRoute: (context) => BrandScreen(),
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.productDetails: (context) {
              final args =
                  ModalRoute.of(context)!.settings.arguments
                      as Map<String, dynamic>;
              return ProductDetails(
                image: args['image'] as String,
                title: args['title'] as String,
                price: args['price'] as String,
                oldPrice: args['oldPrice'] as String,
                colors: args['colors'] as List<Color>,
                description: args['description'] as String,
              );
            },
          },
          locale: Locale(languageProvider.appLanguage),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppThems.lightTheme,
        );
      },
      child: OnboardingScreen(), // دي الشاشة الأولية اللي هتظهر
    );
  }
}
