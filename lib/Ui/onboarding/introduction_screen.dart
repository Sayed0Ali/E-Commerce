import 'package:ecommerce/Ui/auth/login/login_screen.dart';
import 'package:ecommerce/Ui/auth/register/register_screen.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/page_transitions.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSlide {
  final String image;
  final String title;
  final String description;

  OnboardingSlide({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onContinue(int slidesLength) {
    if (_currentPage < slidesLength - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingSlide> _slides = [
      OnboardingSlide(
        image: "assets/images/01 Online Shopping 2.png",
        title: AppLocalizations.of(context)!.exploreProductsTitle,
        description: AppLocalizations.of(context)!.exploreProductsDesc,
      ),
      OnboardingSlide(
        image: "assets/images/01 Online Shopping 5.png",
        title: AppLocalizations.of(context)!.exclusiveOffersTitle,
        description: AppLocalizations.of(context)!.exclusiveOffersDesc,
      ),
      OnboardingSlide(
        image: "assets/images/01 Online Shopping 4.png",
        title: AppLocalizations.of(context)!.securePaymentsTitle,
        description: AppLocalizations.of(context)!.securePaymentsDesc,
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 45.h),
            child: Container(
              height: 408.h,
              width: 328.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: AppColors.primaryColor.withOpacity(0.1),
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: _slides.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final slide = _slides[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      slide.image,
                      fit: BoxFit.contain,
                      height: 240.h,
                      width: 240.h,
                    ),
                    SizedBox(height: 100.h),
                    Text(
                      slide.title,
                      style: AppStyles.bold24Jakarta,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      slide.description,
                      style: AppStyles.reguler14Gray,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            },
          ),
          if (_currentPage == 0)
            Positioned(
              top: 50.h,
              right: 16.w,
              child: TextButton(
                onPressed: () {
                  PageTransitions.navigateWithSlide(
                    context,
                    RegisterScreen(),
                    animationType: AnimationType.slide,
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  AppLocalizations.of(context)!.skipForNow,
                  style: AppStyles.medium18HeadLine,
                ),
              ),
            )
          else if (_currentPage == 1)
            Positioned(
              top: 50.h,
              right: 16.w,
              left: 16.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                      );
                    },
                    icon: const Icon(Icons.keyboard_backspace_sharp),
                  ),
                  TextButton(
                    onPressed: () {
                      PageTransitions.navigateWithSlide(
                        context,
                        RegisterScreen(),
                        animationType: AnimationType.slide,
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      overlayColor: AppColors.transparentColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.skipForNow,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Positioned(
              top: 50.h,
              left: 16.w,
              child: IconButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                },
                icon: Icon(Icons.keyboard_backspace_sharp),
              ),
            ),
          Positioned(
            bottom: 0.h,
            left: 16.w,
            right: 16.w,
            child: SizedBox(
              height: 150.h,
              child: Column(
                children: [
                  if (_currentPage < _slides.length - 1)
                    CustomElevatedButton(
                      text: AppLocalizations.of(context)!.next,
                      backGroundColor: AppColors.blackColor,
                      textStyle: AppStyles.body14SemiBoldWhite,
                      onButtonClicked: () => _onContinue(_slides.length),
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            text: AppLocalizations.of(context)!.login,
                            backGroundColor: Colors.white,
                            textStyle: AppStyles.body14SemiBoldBlack,
                            onButtonClicked: () {
                              PageTransitions.navigateWithSlide(
                                context,
                                LoginScreen(),
                                animationType: AnimationType.slide,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: CustomElevatedButton(
                            text: AppLocalizations.of(context)!.getStarted,
                            backGroundColor: AppColors.blackColor,
                            textStyle: AppStyles.body14SemiBoldWhite,
                            onButtonClicked: () {
                              PageTransitions.navigateWithSlide(
                                context,
                                LoginScreen(),
                                animationType: AnimationType.slide,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 20.h),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _slides.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      spacing: 8.w,
                      activeDotColor: AppColors.primaryColor,
                      dotColor: AppColors.gray300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
