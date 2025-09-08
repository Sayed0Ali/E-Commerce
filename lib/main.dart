import 'package:ecommerce/Ui/auth/register/register_screen.dart';
import 'package:ecommerce/Ui/auth/register/register_verfaication.dart';
import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/brand.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/Ui/home_screen/homescreen.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/notitfications.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/search_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/languge_bottom_sheet/app_languge_provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/languge_bottom_sheet/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/profaile_tab.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
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
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var LanguageProvider = Provider.of<AppLangugeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homeRoute,
        routes: {
          AppRoutes.homeRoute: (context) => HomeScreen(),
          AppRoutes.homeTabRoute: (context) => HomeTab(),
          AppRoutes.categoryRoute: (context) => CategoriesTab(),
          AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.searchRoute: (context) => SearchTab(),
          AppRoutes.registerVerafaicationRoute: (context) =>
              RegisterVerification(),
              AppRoutes.profileRoute: (context) => ProfaileTab(),
              AppRoutes.notitcationsRoute: (context) => NotificationsTab(),
               AppRoutes.allBrandsRoute: (context) => BrandScreen(),
        },
          locale: Locale(LanguageProvider.appLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

