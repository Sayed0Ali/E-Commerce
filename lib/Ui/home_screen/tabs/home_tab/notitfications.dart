import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(AppLocalizations.of(context)!.no_new_notifications),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
          },
        ),
      ),
      body: Center(
        child: Text('No new notifications'),
      ),
    );
  }
}