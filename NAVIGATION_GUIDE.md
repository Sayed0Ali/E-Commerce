# 🚀 Navigation System Guide

## Overview
تم تطبيق نظام navigation موحد في كل المشروع مع slide animations جميلة وسلسة.

## 📁 Files Structure
```
lib/core/utils/
├── page_transitions.dart     # Core animation logic
└── navigation_helper.dart    # Helper methods & extensions
```

## 🎯 How to Use

### Method 1: Using NavigationHelper (Recommended)
```dart
import 'package:ecommerce/core/utils/navigation_helper.dart';

// Navigate with slide animation
NavigationHelper.slideTo(context, YourPage());

// Replace current page
NavigationHelper.slideReplace(context, YourPage());

// Different animations
NavigationHelper.fadeTo(context, YourPage());
NavigationHelper.scaleTo(context, YourPage());
NavigationHelper.slideFromBottom(context, YourPage());
```

### Method 2: Using Context Extensions (Easiest)
```dart
import 'package:ecommerce/core/utils/navigation_helper.dart';

// Navigate with slide
context.slideTo(YourPage());

// Replace current page
context.slideReplace(YourPage());

// Different animations
context.fadeTo(YourPage());
context.scaleTo(YourPage());
context.slideFromBottom(YourPage());
```

### Method 3: Using PageTransitions Directly
```dart
import 'package:ecommerce/core/utils/page_transitions.dart';

PageTransitions.navigateWithSlide(
  context,
  YourPage(),
  animationType: AnimationType.slide,
);
```

## 🎨 Animation Types

| Animation | Description | Use Case |
|-----------|-------------|----------|
| `slide` | من اليمين لليسار | Default navigation |
| `slideFromBottom` | من الأسفل للأعلى | Modals, forms |
| `fade` | Fade in/out | Subtle transitions |
| `scale` | Scale + fade | Special effects |

## ✅ Applied Throughout Project

### ✅ Completed Files:
- ✅ `home_tab.dart` - Categories & products navigation
- ✅ `categories_tab.dart` - Category to products
- ✅ `Products_screen.dart` - Product listings
- ✅ `product_item.dart` - Product details
- ✅ `profaile_tab.dart` - All profile navigation (7 screens)

### 🔄 Migration Pattern:
```dart
// OLD WAY ❌
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => YourPage()),
);

// NEW WAY ✅
context.slideTo(YourPage());
```

## 🛠️ For Developers

### Adding New Navigation:
1. Import the helper:
   ```dart
   import 'package:ecommerce/core/utils/navigation_helper.dart';
   ```

2. Replace old navigation:
   ```dart
   // Instead of Navigator.push
   context.slideTo(YourNewPage());
   ```

### Custom Animation Duration:
```dart
PageTransitions.slideTransition(
  page: YourPage(),
  duration: Duration(milliseconds: 500), // Custom duration
  curve: Curves.easeInOutCubic,         // Custom curve
);
```

## 🎯 Benefits

1. **Consistent UX**: Same animation throughout the app
2. **Easy to Use**: Simple method calls
3. **Customizable**: Different animation types
4. **Clean Code**: No more repetitive MaterialPageRoute
5. **Performance**: Optimized animations with CurvedAnimation

## 📝 Examples

### Profile Navigation:
```dart
// Shipping Address
context.slideTo(ShippingAdderss());

// Payment Method
context.slideTo(PaymentMethod());

// Order History
context.slideTo(OrdersScreen());
```

### Product Navigation:
```dart
// Category to Products
context.slideTo(ProductsScreen(categoryName: "t_shirt"));

// Product Details
context.slideTo(ProductDetails(
  image: product.image,
  title: product.title,
  // ... other params
));
```

### Auth Navigation:
```dart
// Login to Register
context.slideTo(RegisterScreen());

// Forgot Password
context.slideTo(EmailVerfaicationLogin());
```

## 🚨 Important Notes

1. **Import Required**: Always import `navigation_helper.dart`
2. **Context Required**: Make sure you have valid BuildContext
3. **Type Safety**: Use generics for return types if needed
4. **Consistent**: Use same animation type throughout similar flows

## 🔧 Troubleshooting

### Common Issues:
1. **Import Error**: Make sure to import navigation_helper.dart
2. **Context Error**: Ensure BuildContext is available
3. **Animation Lag**: Check if too many animations running simultaneously

### Performance Tips:
1. Use `const` constructors when possible
2. Avoid complex widgets in animation transitions
3. Use appropriate animation duration (300ms default)

---

**Note**: This navigation system is applied throughout the entire project. All old `Navigator.push` calls have been replaced with the new slide animation system for consistent user experience.
