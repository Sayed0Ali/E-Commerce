import 'package:ecommerce/Ui/home_screen/widget/CustomDropdownField.dart';
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
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _streetAddressController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

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
                      keyboardType: TextInputType.name,
                      validator: AppValidators.validateFullName,
                    ),

                    SizedBox(height: 16.h),

                    _buildTextField(
                      controller: _phoneController,
                      label: AppLocalizations.of(context)!.phone_number,
                      isRequired: true,
                      keyboardType: TextInputType.phone,
                      validator: AppValidators.validatePhoneNumber,
                    ),

                    SizedBox(height: 16.h),

                    CustomDropdownField<String>(
                      hintText: AppLocalizations.of(context)!.select_province,
                      value: _selectedProvince.isEmpty
                          ? null
                          : _selectedProvince,
                      items: _provinces,
                      onChanged: (value) =>
                          setState(() => _selectedProvince = value ?? ''),
                      validator: (value) => AppValidators.validateDropdown(
                        value,
                        AppLocalizations.of(context)!.select_province,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    CustomDropdownField<String>(
                      hintText: AppLocalizations.of(context)!.select_city,
                      value: _selectedCity.isEmpty ? null : _selectedCity,
                      items: _cities,
                      onChanged: (value) =>
                          setState(() => _selectedCity = value ?? ''),
                      validator: (value) => AppValidators.validateDropdown(
                        value,
                        AppLocalizations.of(context)!.select_city,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    _buildTextField(
                      controller: _streetAddressController,
                      label: AppLocalizations.of(context)!.street_address,
                      isRequired: true,
                      keyboardType: TextInputType.streetAddress,
                      validator: AppValidators.validateAddress,
                    ),

                    SizedBox(height: 16.h),

                    _buildTextField(
                      controller: _postalCodeController,
                      label: AppLocalizations.of(context)!.postal_code,
                      isRequired: true,
                      keyboardType: TextInputType.number,
                      validator: AppValidators.validatePostalCode,
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
    String? Function(String?)? validator,
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
          validator: validator,
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
