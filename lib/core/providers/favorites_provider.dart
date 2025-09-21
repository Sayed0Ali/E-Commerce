import 'package:flutter/material.dart';

class FavoriteProduct {
  final String id;
  final String title;
  final String imageAsset;
  final double price;
  final double oldPrice;
  final List<Color> colors;
  final String colorsCount;

  FavoriteProduct({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.price,
    required this.oldPrice,
    required this.colors,
    required this.colorsCount,
  });
}

class FavoritesProvider extends ChangeNotifier {
  final List<FavoriteProduct> _favoriteItems = [];

  List<FavoriteProduct> get items => _favoriteItems;

  bool isFavorite(String id) {
    return _favoriteItems.any((item) => item.id == id);
  }

  void toggleFavorite({
    required String id,
    required String title,
    required String imageAsset,
    required double price,
    required double oldPrice,
    required List<Color> colors,
    required String colorsCount,
  }) {
    final existingIndex = _favoriteItems.indexWhere((item) => item.id == id);

    if (existingIndex >= 0) {
      _favoriteItems.removeAt(existingIndex);
    } else {
      _favoriteItems.add(
        FavoriteProduct(
          id: id,
          title: title,
          imageAsset: imageAsset,
          price: price,
          oldPrice: oldPrice,
          colors: colors,
          colorsCount: colorsCount,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromFavorites(String id) {
    _favoriteItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
