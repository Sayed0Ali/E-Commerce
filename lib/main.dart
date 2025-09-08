import 'package:ecommerce/Ui/auth/register/register_screen.dart';
import 'package:ecommerce/Ui/auth/register/register_verfaication.dart';
import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce/Ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/Ui/home_screen/homescreen.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.registerVerafaicationRoute,
        routes: {
          AppRoutes.homeRoute: (context) => HomeScreen(),
          AppRoutes.homeTabRoute: (context) => HomeTab(),
          AppRoutes.categoryRoute: (context) => CategoriesTab(),
          AppRoutes.registerRoute: (context) => RegisterScreen(),
          AppRoutes.registerVerafaicationRoute: (context) => RegisterVerification(),
        },
      ),
    );
  }
}
