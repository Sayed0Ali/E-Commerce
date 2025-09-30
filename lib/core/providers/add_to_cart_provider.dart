import 'package:flutter/material.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart'; // استخدم المسار عندك الصحيح للـ CartProduct

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartItems = [];

  List<CartProduct> get items => _cartItems;

  bool isInCart(String id) {
    return _cartItems.any((item) => item.id == id);
  }

  
  void addToCart({
    required String id,
    required String title,
    required String imageAsset,
    required double price,
    required double oldPrice,
    required List<Color> colors,
    required String colorsCount,
    int quantity = 1,
  }) {
    final existingIndex = _cartItems.indexWhere((item) => item.id == id);

    if (existingIndex >= 0) {
      _cartItems[existingIndex].quantity += quantity;
    } else {
      _cartItems.add(
        CartProduct(
          id: id,
          title: title,
          imageAsset: imageAsset,
          price: price,

          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  /// Toggle مشابه للفيفوريت (لو موجود يشيله، لو مش موجود يضيفه)
  void toggleCart({
    required String id,
    required String title,
    required String imageAsset,
    required double price,
    required double oldPrice,
    required List<Color> colors,
    required String colorsCount,
    int quantity = 1,
  }) {
    if (isInCart(id)) {
      removeFromCart(id);
    } else {
      addToCart(
        id: id,
        title: title,
        imageAsset: imageAsset,
        price: price,
        oldPrice: oldPrice,
        colors: colors,
        colorsCount: colorsCount,
        quantity: quantity,
      );
    }
  }

  void removeFromCart(String id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void incrementQuantity(String id) {
    final idx = _cartItems.indexWhere((p) => p.id == id);
    if (idx >= 0) {
      _cartItems[idx].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String id) {
    final idx = _cartItems.indexWhere((p) => p.id == id);
    if (idx >= 0) {
      if (_cartItems[idx].quantity > 1) {
        _cartItems[idx].quantity--;
      } else {
        _cartItems.removeAt(idx);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  int get totalCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);
}
