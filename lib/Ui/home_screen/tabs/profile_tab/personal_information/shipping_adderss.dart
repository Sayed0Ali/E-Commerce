import 'package:ecommerce/Ui/home_screen/widget/CustomDropdownField.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingAdderss extends StatefulWidget {
  const ShippingAdderss({super.key});

  @override
  State<ShippingAdderss> createState() => _ShippingAdderssState();
}

class _ShippingAdderssState extends State<ShippingAdderss> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController postalCodecontrollar = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _selectedProvince = '';
  String _selectedCity = '';

  final List<String> _provinces = ['Province 1', 'Province 2', 'Province 3'];
  final List<String> _cities = ['City 1', 'City 2', 'City 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          AppLocalizations.of(context)!.shipping_address,
          style: AppStyles.body14MediumBlack,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, size: 30.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.full_name,
                  style: AppStyles.body14MediumBlack,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_full_name,
                  controller: nameController,
                  borderColor: AppColors.gray300,
                  keyBoardType: TextInputType.name,
                  style: AppStyles.reguler14Gray,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validateFullName,
                ),

                SizedBox(height: 20.h),
                Text(
                  AppLocalizations.of(context)!.phone_number,
                  style: AppStyles.body14MediumBlack,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_phone_number,
                  controller: phoneController,
                  borderColor: AppColors.gray300,
                  keyBoardType: TextInputType.phone,
                  style: AppStyles.reguler14Gray,
                  filledColor: AppColors.whiteColor,
                  validator: AppValidators.validatePhoneNumber,
                ),

                SizedBox(height: 20.h),
                CustomDropdownField<String>(
                  hintText: AppLocalizations.of(context)!.select_province,
                  value: _selectedProvince.isEmpty ? null : _selectedProvince,
                  items: _provinces,
                  onChanged: (value) =>
                      setState(() => _selectedProvince = value ?? ''),
                  validator: (value) =>
                      AppValidators.validateDropdown(value, 'province'),
                ),

                SizedBox(height: 16.h),
                CustomDropdownField<String>(
                  hintText: AppLocalizations.of(context)!.select_city,
                  value: _selectedCity.isEmpty ? null : _selectedCity,
                  items: _cities,
                  onChanged: (value) =>
                      setState(() => _selectedCity = value ?? ''),
                  validator: (value) =>
                      AppValidators.validateDropdown(value, 'city'),
                ),

                SizedBox(height: 20.h),
                Text(
                  AppLocalizations.of(context)!.street_address,
                  style: AppStyles.body14MediumBlack,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_address,
                  style: AppStyles.hint12RegularText,
                  borderColor: AppColors.gray300,
                  filledColor: AppColors.whiteColor,
                  controller: streetAddressController,
                  validator: AppValidators.validateAddress,
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: 20.h),
                Text(
                  AppLocalizations.of(context)!.postal_code,
                  style: AppStyles.body14MediumBlack,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.enter_postal_code,
                  style: AppStyles.hint12RegularText,
                  borderColor: AppColors.gray300,
                  filledColor: AppColors.whiteColor,
                  controller: postalCodecontrollar,
                  validator: AppValidators.validatePostalCode,
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: 20.h),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.send,
                  onButtonClicked: register,
                  backGroundColor: AppColors.blackColor,
                  textStyle: AppStyles.userNameWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      print('Name: ${nameController.text}');
      print('Phone: ${phoneController.text}');
      print('Province: $_selectedProvince');
      print('City: $_selectedCity');
      print('Address: ${streetAddressController.text}');
    }
  }
}
