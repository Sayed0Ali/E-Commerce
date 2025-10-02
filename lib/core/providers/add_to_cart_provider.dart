import 'package:flutter/material.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartItems = [];

  List<CartProduct> get items => _cartItems;

  
  
  void addToCart(CartProduct product) {
    final existingIndex =
        _cartItems.indexWhere((p) => p.title == product.title);
    if (existingIndex >= 0) {
      _cartItems[existingIndex].quantity += product.quantity;
    } else {
      _cartItems.add(product);
    }
    notifyListeners();
  }

  
  void removeAt(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  
  void incrementAt(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  
  void decrementAt(int index) {
    if (index >= 0 && index < _cartItems.length) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
