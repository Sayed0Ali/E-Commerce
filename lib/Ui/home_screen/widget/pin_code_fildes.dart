import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFildes extends StatefulWidget {
  const PinCodeFildes({super.key});

  @override
  State<PinCodeFildes> createState() => _PinCodeFildesState();
}

class _PinCodeFildesState extends State<PinCodeFildes> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: Colors.blue,
        inactiveColor: Colors.blue,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.lightBlue,
        selectedColor: Colors.blue,
        selectedFillColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      onCompleted: (submittedCode) {},
    );
    
  }
}
