import 'package:ecommerce/Ui/home_screen/tabs/wish_tab/wish_list_product.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/core/providers/favorites_provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/empty_or_succcess_state.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/Ui/home_screen/widget/bottom_sheet_widgets/delete_bottom_sheet.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
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
      quantity: 1, 
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
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.blackColor,
                    ),
                    onPressed: () {
                      context.read<HomeProvider>().changeIndex(0);
                    },
                  )
                : null,
            title: favorites.isNotEmpty
                ? Text(
                    AppLocalizations.of(context)!.wishlist,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
          ),
          body: favorites.isEmpty
              ? EmptyOrSuccessState(
                  imagePath: AppAssets.onLineShoppingImage,
                  title: AppLocalizations.of(context)!.wishlist_empty_title,
                  subtitle: AppLocalizations.of(
                    context,
                  )!.wishlist_empty_subtitle,
                  buttonText: AppLocalizations.of(
                    context,
                  )!.wishlist_empty_button,
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
                      onRemove: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => DeleteBottomSheet(
                            sourceName: AppLocalizations.of(context)!.wishlist,
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
