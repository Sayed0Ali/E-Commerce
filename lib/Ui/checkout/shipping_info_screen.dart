import 'package:ecommerce/core/models/checkout_models.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_label.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingInfoScreen extends StatefulWidget {
  final Function(ShippingInfo) onNext;

  const ShippingInfoScreen({super.key, required this.onNext});

  @override
  State<ShippingInfoScreen> createState() => _ShippingInfoScreenState();
}

class _ShippingInfoScreenState extends State<ShippingInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _postalCodeController = TextEditingController();

  String _selectedCountryCode = '+20';
  String _selectedProvince = '';
  String _selectedCity = '';

  final List<String> _provinces = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Shubra El Kheima',
    'Port Said',
    'Suez',
    'Luxor',
    'Mansoura',
    'Tanta',
    'Asyut',
  ];

  final List<String> _cities = [
    'Downtown',
    'Nasr City',
    'Heliopolis',
    'Maadi',
    'Zamalek',
    'Garden City',
    'Dokki',
    'Agouza',
    'Mohandessin',
    'Sheikh Zayed',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      controller: _fullNameController,
                      label: AppLocalizations.of(context)!.full_name,
                      isRequired: true,
                    ),
                    SizedBox(height: 16.h),

                    _buildPhoneField(),
                    SizedBox(height: 16.h),

                    _buildDropdownField(
                      value: _selectedProvince,
                      items: _provinces,
                      label: AppLocalizations.of(context)!.select_province,
                      onChanged: (value) =>
                          setState(() => _selectedProvince = value!),
                    ),
                    SizedBox(height: 16.h),

                    _buildDropdownField(
                      value: _selectedCity,
                      items: _cities,
                      label: AppLocalizations.of(context)!.select_city,
                      onChanged: (value) =>
                          setState(() => _selectedCity = value!),
                    ),
                    SizedBox(height: 16.h),

                    _buildTextField(
                      controller: _streetAddressController,
                      label: AppLocalizations.of(context)!.street_address,
                      isRequired: true,
                    ),
                    SizedBox(height: 16.h),

                    _buildTextField(
                      controller: _postalCodeController,
                      label: AppLocalizations.of(context)!.postal_code,
                      isRequired: true,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.save,
              backGroundColor: AppColors.blackColor,
              textStyle: AppStyles.body14SemiBoldWhite,
              onButtonClicked: _saveShippingInfo,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: label, isRequired: isRequired),
        SizedBox(height: 8.h),
        CustomTextField(
          controller: controller,
          keyBoardType: keyboardType,
          hintText: 'Enter $label',
          borderColor: AppColors.gray300,
          filledColor: AppColors.whiteColor,
          style: AppStyles.body14MediumBlack,
          validator:AppValidators.validateFullName
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.phone_number),
        SizedBox(height: 8.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('🇪🇬', style: TextStyle(fontSize: 16.sp)),
                  SizedBox(width: 8.w),
                  DropdownButton<String>(
                    value: _selectedCountryCode,
                    underline: const SizedBox(),
                    items: ['+20', '+1', '+44', '+33'].map((code) {
                      return DropdownMenuItem(value: code, child: Text(code));
                    }).toList(),
                    onChanged: (value) =>
                        setState(() => _selectedCountryCode = value!),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: CustomTextField(
                controller: _phoneController,
                keyBoardType: TextInputType.phone,
                hintText: 'Phone number',
                borderColor: AppColors.gray300,
                filledColor: AppColors.whiteColor,
                style: AppStyles.body14MediumBlack,
                validator:AppValidators.validatePhoneNumber
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required String label,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: label),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: value.isEmpty ? null : value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.gray300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.gray300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _saveShippingInfo() {
    if (_formKey.currentState!.validate()) {
      final shippingInfo = ShippingInfo(
        fullName: _fullNameController.text,
        phoneNumber: _phoneController.text,
        countryCode: _selectedCountryCode,
        province: _selectedProvince,
        city: _selectedCity,
        streetAddress: _streetAddressController.text,
        postalCode: _postalCodeController.text,
      );

      widget.onNext(shippingInfo);
    }
  }
}
