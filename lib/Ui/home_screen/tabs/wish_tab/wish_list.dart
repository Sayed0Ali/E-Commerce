import 'package:ecommerce/Ui/home_screen/tabs/wish_tab/wish_list_product.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/core/providers/favorites_provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/empty_or_succcess_state.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/Ui/home_screen/widget/bottom_sheet_widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({Key? key}) : super(key: key);

  CartProduct _mapFavoriteToCartProduct(FavoriteProduct favoriteProduct) {
    return CartProduct(
      id: favoriteProduct.id,
      title: favoriteProduct.title,
      imageAsset: favoriteProduct.imageAsset,
      price: favoriteProduct.price,
      quantity: 1, // Default quantity for display
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, _) {
        final favorites = favoritesProvider.items;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            centerTitle: true,
            leading: favorites.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      context.read<HomeProvider>().changeIndex(0);
                    },
                  )
                : null,
            title: favorites.isNotEmpty
                ? const Text(
                    'Wishlist',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
          ),
          body: favorites.isEmpty
              ? const EmptyOrSuccessState(
                  imagePath: AppAssets.onLineShoppingImage,
                  title: 'Your wishlist is empty',
                  subtitle:
                      'Tap heart button to start saving your favorite items.',
                  buttonText: 'Explore Categories',
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final favoriteProduct = favorites[index];
                    final cartProduct = _mapFavoriteToCartProduct(
                      favoriteProduct,
                    );

                    return WishListProduct(
                      product: cartProduct,

                      // showQuantityControls: false,
                      onRemove: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => DeleteBottomSheet(
                            sourceName: 'wishlist',
                            itemCount: 1,
                            onDelete: () => favoritesProvider
                                .removeFromFavorites(favoriteProduct.id),
                          ),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
