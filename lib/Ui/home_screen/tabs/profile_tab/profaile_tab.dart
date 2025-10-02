import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/Support&information/privacy_policy.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/Support&information/term_condition.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/account&mangment/change_password.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/bottom_sheet_widgets/languge_bottom_sheet.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/contact_us.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/order/order_screen.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/payment_method.dart';
import 'package:ecommerce/Ui/home_screen/tabs/profile_tab/personal_information/shipping_adderss.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/page_transitions.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfaileTab extends StatelessWidget {
  const ProfaileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppAssets.iconImage),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('shehab', style: AppStyles.userNameWhite),
                    AutoSizeText(
                      "sayed@gmail.com",
                      style: AppStyles.emailWhite,
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                final provider = Provider.of<HomeProvider>(
                  context,
                  listen: false,
                );
                provider.changeIndex(0);
                Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
              },
              icon: Icon(
                Icons.logout_outlined,
                size: 30.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    AppLocalizations.of(context)!.personal_information,
                    style: AppStyles.labelStyle,
                  ),
                  SizedBox(height: 10.h),

                  buildRowItem(
                    title: AppLocalizations.of(context)!.shipping_address,
                    icon: Icons.local_shipping_outlined,
                    onTap: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        ShippingAdderss(),
                        animationType: AnimationType.slide,
                      );
                    },
                  ),
                  buildRowItem(
                    title: AppLocalizations.of(context)!.payment_method,
                    icon: Icons.payment_outlined,
                    onTap: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        PaymentMethod(),
                        animationType: AnimationType.slide,
                      );
                    },
                  ),

                  buildRowItem(
                    title: AppLocalizations.of(context)!.order_history,
                    icon: Icons.history_edu,
                    onTap: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        OrdersScreen(),
                        animationType: AnimationType.slide,
                      );
                    },
                  ),

                  buildRowItem(
                    title: AppLocalizations.of(context)!.contact_us,
                    icon: Icons.perm_contact_calendar_outlined,
                    onTap: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        ContactUs(),
                        animationType: AnimationType.slide,
                      );
                    },
                  ),

                  SizedBox(height: 10.h),
                  Text(
                    AppLocalizations.of(context)!.support_information,
                    style: AppStyles.labelStyle,
                  ),
                  SizedBox(height: 10.h),

                  buildRowItem(
                    title: AppLocalizations.of(context)!.privacy_policy,
                    icon: Icons.privacy_tip_outlined,
                    onTap: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        PrivacyPolicy(),
                        animationType: AnimationType.slide,
                      );
                    },
                  ),

                  buildRowItem(
                    title: AppLocalizations.of(context)!.terms_conditions,
                    icon: Icons.note_alt,
                    onTap: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        TermCondition(),
                        animationType: AnimationType.slide,
                      );
                    },
                  ),

                  SizedBox(height: 10.h),
                  Text(
                    AppLocalizations.of(context)!.account_management,
                    style: AppStyles.labelStyle,
                  ),
                  SizedBox(height: 10.h),

                  buildRowItem(
                    title: AppLocalizations.of(context)!.change_password,
                    icon: Icons.lock_outline,
                    onTap: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        ChangePassword(),
                        animationType: AnimationType.slide,
                      );
                    },
                  ),

                  buildRowItem(
                    title: AppLocalizations.of(context)!.change_language,
                    icon: Icons.language_outlined,
                    onTap: () => showLangugeBottomSheet(context),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowItem({
    required String title,
    required IconData icon,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 20.sp, color: AppColors.grayColor),
            SizedBox(width: 15.w),
            Text(title, style: AppStyles.menuItemStyle),
            const Spacer(),
            IconButton(
              onPressed: () {
                onTap?.call();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20.sp,
                color: AppColors.grayColor,
              ),
            ),
          ],
        ),
        Divider(thickness: 1.sp, color: Colors.grey.shade200),
      ],
    );
  }

  void showLangugeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          height: 300.h,
          padding: const EdgeInsets.all(16),
          child: const langugeBottomSheet(),
        );
      },
    );
  }
}
