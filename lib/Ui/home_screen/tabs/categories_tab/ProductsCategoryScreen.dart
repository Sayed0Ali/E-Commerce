import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widget/product_item.dart';

class ProductsCategoryScreen extends StatefulWidget {
  final String categoryName;
  final List<Map<String, dynamic>> products;

  const ProductsCategoryScreen({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  State<ProductsCategoryScreen> createState() => _ProductsCategoryScreenState();
}

class _ProductsCategoryScreenState extends State<ProductsCategoryScreen> {
  late List<Map<String, dynamic>> filteredProducts;
  String searchQuery = '';
  bool _sortPriceLowToHigh = false;
  bool _sortPriceHighToLow = true;
  bool _sortAZ = false;
  bool _sortZA = false;

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(widget.products);
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return Container(
              padding: EdgeInsets.all(16.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.filter, style: AppStyles.body14MediumBlack),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // Price Options
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.price_low_to_high),
                    value: _sortPriceLowToHigh,
                    onChanged: (bool? value) {
                      setStateDialog(() {
                        _sortPriceLowToHigh = value ?? false;
                        if (_sortPriceLowToHigh) {
                          _sortPriceHighToLow = false;
                          _sortAZ = false;
                          _sortZA = false;
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.price_high_to_low),
                    value: _sortPriceHighToLow,
                    onChanged: (bool? value) {
                      setStateDialog(() {
                        _sortPriceHighToLow = value ?? false;
                        if (_sortPriceHighToLow) {
                          _sortPriceLowToHigh = false;
                          _sortAZ = false;
                          _sortZA = false;
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  // A-Z Options
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.a_to_z),
                    value: _sortAZ,
                    onChanged: (bool? value) {
                      setStateDialog(() {
                        _sortAZ = value ?? false;
                        if (_sortAZ) {
                          _sortPriceLowToHigh = false;
                          _sortPriceHighToLow = false;
                          _sortZA = false;
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context)!.z_to_a),
                    value: _sortZA,
                    onChanged: (bool? value) {
                      setStateDialog(() {
                        _sortZA = value ?? false;
                        if (_sortZA) {
                          _sortPriceLowToHigh = false;
                          _sortPriceHighToLow = false;
                          _sortAZ = false;
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  SizedBox(height: 16.h),
                  // Apply Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                      ),
                      onPressed: () {
                        _applyFilters();
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.apply,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _applyFilters() {
    setState(() {
      filteredProducts = List.from(widget.products);

      // Apply search filter
      if (searchQuery.isNotEmpty) {
        filteredProducts = filteredProducts.where((product) {
          return product["name"].toString().toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
        }).toList();
      }

      // Apply sorting
      if (_sortPriceLowToHigh) {
        filteredProducts.sort((a, b) {
          double priceA = double.parse(
            a["price"].toString().replaceAll(' EGP', ''),
          );
          double priceB = double.parse(
            b["price"].toString().replaceAll(' EGP', ''),
          );
          return priceA.compareTo(priceB);
        });
      } else if (_sortPriceHighToLow) {
        filteredProducts.sort((a, b) {
          double priceA = double.parse(
            a["price"].toString().replaceAll(' EGP', ''),
          );
          double priceB = double.parse(
            b["price"].toString().replaceAll(' EGP', ''),
          );
          return priceB.compareTo(priceA);
        });
      } else if (_sortAZ) {
        filteredProducts.sort(
          (a, b) => a["name"].toString().compareTo(b["name"].toString()),
        );
      } else if (_sortZA) {
        filteredProducts.sort(
          (a, b) => b["name"].toString().compareTo(a["name"].toString()),
        );
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
      _applyFilters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 24.sp),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  products: widget.products,
                  onSearchChanged: _onSearchChanged,
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black, size: 24.sp),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.w)),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 227.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.products.length > 5
                        ? 5
                        : widget.products.length,
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      final product = widget.products[index];
                      return ProductTabItem(
                        image: product["image"],
                        title: product["name"],
                        price: "\$29.99",
                        oldPrice: "\$39.99",

                        colors: [Colors.black, Colors.grey, Colors.blue],
                        colorsCount: AppLocalizations.of(context)!.all_colors,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> products;
  final Function(String) onSearchChanged;

  ProductSearchDelegate({
    required this.products,
    required this.onSearchChanged,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          onSearchChanged('');
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearchChanged(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((product) {
      return product["name"].toString().toLowerCase().contains(
        query.toLowerCase(),
      );
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          title: Text(product["name"]),
          onTap: () {
            query = product["name"];
            onSearchChanged(query);
            close(context, null);
          },
        );
      },
    );
  }
}
