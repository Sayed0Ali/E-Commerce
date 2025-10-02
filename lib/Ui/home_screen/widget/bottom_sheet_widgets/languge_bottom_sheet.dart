import 'package:ecommerce/core/providers/app_languge_provider.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class langugeBottomSheet extends StatefulWidget {
  const langugeBottomSheet({super.key});

  @override
  State<langugeBottomSheet> createState() => _langugeBottomSheetState();
}

class _langugeBottomSheetState extends State<langugeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var LanguageProvider = Provider.of<AppLangugeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text(
      AppLocalizations.of(context)!.change_language,
      style: AppStyles.bold18Jakarta,
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 16.h),
    InkWell(
      onTap: () {
        LanguageProvider.changeLanguage('en');
      },
      child: buildInfoContainer(AppLocalizations.of(context)!.english,
          isSelected: LanguageProvider.appLanguage == 'en'),
    ),
    SizedBox(height: 12.h),
    InkWell(
      onTap: () {
        LanguageProvider.changeLanguage('ar');
      },
      child: buildInfoContainer(AppLocalizations.of(context)!.arabic,
          isSelected: LanguageProvider.appLanguage == 'ar'),
    ),
  ],
)

    );
  }

Widget buildInfoContainer(String language, {bool isSelected = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
    decoration: BoxDecoration(
      border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.grayColor),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(
          Icons.language, 
          color: isSelected ? AppColors.primaryColor : AppColors.grayColor,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            language,
            style: isSelected
                ? AppStyles.labelStyle.copyWith(color: const Color.fromARGB(255, 45, 90, 82))
                : AppStyles.labelStyle,
          ),
        ),
        if (isSelected)
          Icon(Icons.check, color: AppColors.primaryColor),
      ],
    ),
  );
}

}
