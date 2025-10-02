import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFilterBottomSheet extends StatefulWidget {
  final String selectedSortOption;
  final Function(String) onSortOptionChanged;
  final List<Map<String, dynamic>>? products;
  final Function(List<Map<String, dynamic>>)? onProductsFiltered;

  const SearchFilterBottomSheet({
    super.key,
    required this.selectedSortOption,
    required this.onSortOptionChanged,
    this.products,
    this.onProductsFiltered,
  });

  @override
  State<SearchFilterBottomSheet> createState() =>
      _SearchFilterBottomSheetState();
}

class _SearchFilterBottomSheetState extends State<SearchFilterBottomSheet> {
  late String _selectedSortOption;
  final List<String> _sortOptions = [
    'Price (Low to High)',
    'Price (High to Low)',
    'A-Z',
    'Z-A',
  ];
  @override
  void initState() {
    super.initState();
    _selectedSortOption = widget.selectedSortOption;
  }

  void _applyFilters() {
    if (widget.products != null && widget.onProductsFiltered != null) {
      List<Map<String, dynamic>> filteredProducts = List.from(widget.products!);

      // Apply sorting based on selected option
      if (_selectedSortOption == 'Price (Low to High)') {
        filteredProducts.sort((a, b) {
          double priceA = double.parse(
            a["price"].toString().replaceAll(' EGP', ''),
          );
          double priceB = double.parse(
            b["price"].toString().replaceAll(' EGP', ''),
          );
          return priceA.compareTo(priceB);
        });
      } else if (_selectedSortOption == 'Price (High to Low)') {
        filteredProducts.sort((a, b) {
          double priceA = double.parse(
            a["price"].toString().replaceAll(' EGP', ''),
          );
          double priceB = double.parse(
            b["price"].toString().replaceAll(' EGP', ''),
          );
          return priceB.compareTo(priceA);
        });
      } else if (_selectedSortOption == 'A-Z') {
        filteredProducts.sort(
          (a, b) => a["name"].toString().compareTo(b["name"].toString()),
        );
      } else if (_selectedSortOption == 'Z-A') {
        filteredProducts.sort(
          (a, b) => b["name"].toString().compareTo(a["name"].toString()),
        );
      }

      widget.onProductsFiltered!(filteredProducts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.grayColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text('Filter', style: AppStyles.bold18Jakarta),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemCount: _sortOptions.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final option = _sortOptions[index];
                  final isSelected = option == _selectedSortOption;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSortOption = option;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.grayColor,
                              width: 2,
                            ),
                            color: isSelected
                                ? AppColors.primaryColor
                                : Colors.transparent,
                          ),
                          child: isSelected
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.whiteColor,
                                  size: 16.sp,
                                )
                              : null,
                        ),
                        SizedBox(width: 12.w),
                        Text(option, style: AppStyles.body16MediumBlack),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              text: 'Apply',
              backGroundColor: AppColors.blackColor,
              textStyle: AppStyles.body14SemiBoldWhite,
              onButtonClicked: () {
                widget.onSortOptionChanged(_selectedSortOption);
                _applyFilters();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
