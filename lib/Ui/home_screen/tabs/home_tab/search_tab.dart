import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/Ui/home_screen/widget/bottom_sheet_widgets/search_filter_bottom_sheet.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [
    'Smart watch',
    'Laptop',
    'Women bag',
    'Headphones',
    'Shoes',
    'Eye glasses',
  ];

  String _selectedSortOption = 'Price (High to Low)';

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SearchFilterBottomSheet(
        selectedSortOption: _selectedSortOption,
        onSortOptionChanged: (String newOption) {
          setState(() {
            _selectedSortOption = newOption;
          });
        },
      ),
    );
  }

  void _removeRecentSearch(int index) {
    setState(() {
      _recentSearches.removeAt(index);
    });
  }

  List<Widget> _buildRecentSearchSection() {
    return [
      Text(
        AppLocalizations.of(context)!.resent_search,
        style: AppStyles.body14MediumBlack.copyWith(
          color: AppColors.grayColor,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      SizedBox(height: 16.h),

      // Recent Search List
      Expanded(
        child: ListView.separated(
          itemCount: _recentSearches.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _searchController.text = _recentSearches[index];
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _recentSearches[index],
                      style: AppStyles.body16MediumBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _removeRecentSearch(index),
                    child: Icon(
                      Icons.north_west,
                      color: AppColors.grayColor,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ];
  }

  List<Widget> _buildEmptySearchState() {
    return [
      Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                size: 64.sp,
                color: AppColors.grayColor.withOpacity(0.5),
              ),
              SizedBox(height: 16.h),
              Text(
                'No recent searches',
                style: AppStyles.body16MediumBlack.copyWith(
                  color: AppColors.grayColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,

        actions: [
          IconButton(
            icon: Icon(Icons.close, size: 30.w, color: AppColors.blackColor),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search TextField
            CustomTextField(
              controller: _searchController,
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: AppStyles.menuItemStyle.copyWith(
                color: AppColors.grayColor,
              ),
              borderColor: AppColors.gray300,
              suffixIcon: GestureDetector(
                onTap: _showFilterBottomSheet,
                child: Icon(
                  Icons.format_list_bulleted_rounded,
                  color: AppColors.grayColor,
                  size: 24.sp,
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.grayColor,
                size: 24.sp,
              ),
              borderSize: 1.0,
            ),
            SizedBox(height: 24.h),

            // Recent Search Section
            if (_recentSearches.isNotEmpty)
              ..._buildRecentSearchSection()
            else
              ..._buildEmptySearchState(),
          ],
        ),
      ),
    );
  }
}
