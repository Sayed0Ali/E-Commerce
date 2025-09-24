import 'package:flutter/material.dart';
import 'page_transitions.dart';

/// Global Navigation Helper
/// استخدم ده في كل المشروع للـ navigation مع slide animation
class NavigationHelper {
  // Private constructor
  NavigationHelper._();
  
  /// Navigate to page with slide animation
  static Future<T?> slideTo<T extends Object?>(
    BuildContext context,
    Widget page, {
    AnimationType animationType = AnimationType.slide,
  }) {
    return PageTransitions.navigateWithSlide<T>(
      context,
      page,
      animationType: animationType,
    );
  }

  /// Replace current page with slide animation
  static Future<T?> slideReplace<T extends Object?>(
    BuildContext context,
    Widget page, {
    AnimationType animationType = AnimationType.slide,
  }) {
    return PageTransitions.navigateWithSlide<T>(
      context,
      page,
      animationType: animationType,
      replace: true,
    );
  }

  /// Navigate with fade animation
  static Future<T?> fadeTo<T extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    return PageTransitions.navigateWithSlide<T>(
      context,
      page,
      animationType: AnimationType.fade,
    );
  }

  /// Navigate with scale animation
  static Future<T?> scaleTo<T extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    return PageTransitions.navigateWithSlide<T>(
      context,
      page,
      animationType: AnimationType.scale,
    );
  }

  /// Navigate from bottom
  static Future<T?> slideFromBottom<T extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    return PageTransitions.navigateWithSlide<T>(
      context,
      page,
      animationType: AnimationType.slideFromBottom,
    );
  }
}

/// Extension على BuildContext للاستخدام السهل
extension NavigationExtensions on BuildContext {
  /// Navigate with slide animation
  Future<T?> slideTo<T extends Object?>(Widget page) {
    return NavigationHelper.slideTo<T>(this, page);
  }

  /// Replace with slide animation
  Future<T?> slideReplace<T extends Object?>(Widget page) {
    return NavigationHelper.slideReplace<T>(this, page);
  }

  /// Navigate with fade
  Future<T?> fadeTo<T extends Object?>(Widget page) {
    return NavigationHelper.fadeTo<T>(this, page);
  }

  /// Navigate with scale
  Future<T?> scaleTo<T extends Object?>(Widget page) {
    return NavigationHelper.scaleTo<T>(this, page);
  }

  /// Navigate from bottom
  Future<T?> slideFromBottom<T extends Object?>(Widget page) {
    return NavigationHelper.slideFromBottom<T>(this, page);
  }
}
