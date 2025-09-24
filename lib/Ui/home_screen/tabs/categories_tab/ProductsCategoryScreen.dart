import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/widgets/search_filter_bottom_sheet.dart';
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
  String _selectedSortOption = 'Price (High to Low)';

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(widget.products);
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SearchFilterBottomSheet(
        selectedSortOption: _selectedSortOption,
        products: widget.products,
        onSortOptionChanged: (String newOption) {
          setState(() {
            _selectedSortOption = newOption;
          });
        },
        onProductsFiltered: (List<Map<String, dynamic>> filtered) {
          setState(() {
            filteredProducts = filtered;
          });
        },
      ),
    );
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
              Navigator.pushReplacementNamed(context, AppRoutes.searchRoute);
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
                    itemCount: filteredProducts.length > 5
                        ? 5
                        : filteredProducts.length,
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
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

