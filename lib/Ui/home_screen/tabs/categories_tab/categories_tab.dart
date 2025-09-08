import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatelessWidget {
  static const String routeName = 'categories_tab';

  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
          },
        ),
      ),
    );
  }
}
