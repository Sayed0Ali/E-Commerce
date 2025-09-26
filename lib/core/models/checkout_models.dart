import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';

class ShippingInfo {
  final String fullName;
  final String phoneNumber;
  final String countryCode;
  final String province;
  final String city;
  final String streetAddress;
  final String postalCode;

  ShippingInfo({
    required this.fullName,
    required this.phoneNumber,
    required this.countryCode,
    required this.province,
    required this.city,
    required this.streetAddress,
    required this.postalCode,
  });

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'phoneNumber': phoneNumber,
    'countryCode': countryCode,
    'province': province,
    'city': city,
    'streetAddress': streetAddress,
    'postalCode': postalCode,
  };

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
    fullName: json['fullName'] ?? '',
    phoneNumber: json['phoneNumber'] ?? '',
    countryCode: json['countryCode'] ?? '+20',
    province: json['province'] ?? '',
    city: json['city'] ?? '',
    streetAddress: json['streetAddress'] ?? '',
    postalCode: json['postalCode'] ?? '',
  );
}

enum PaymentMethod {
  cashOnDelivery,
  electronicWallet,
}

class OrderInfo {
  final double subtotal;
  final double shippingCost;
  final double total;
  final int itemCount;
   final List<CartProduct> products;

  OrderInfo({
    required this.subtotal,
    required this.shippingCost,
    required this.total,
    required this.itemCount,
       required this.products,
  });
}

class CheckoutData {
  final ShippingInfo? shippingInfo;
  final PaymentMethod? paymentMethod;
  final OrderInfo orderInfo;

  CheckoutData({
    this.shippingInfo,
    this.paymentMethod,
    required this.orderInfo,
  });

  CheckoutData copyWith({
    ShippingInfo? shippingInfo,
    PaymentMethod? paymentMethod,
    OrderInfo? orderInfo,
  }) {
    return CheckoutData(
      shippingInfo: shippingInfo ?? this.shippingInfo,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      orderInfo: orderInfo ?? this.orderInfo,
    );
  }
}
