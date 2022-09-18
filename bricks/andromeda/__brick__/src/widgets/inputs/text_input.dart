import 'package:flutter/material.dart';

import '../../tools/tools.dart';

enum InputValueType {
  text,
  textArea,
  number,
  phone,
  email,
  password,
  passwordRepeat,
}

class CustomTextFormField extends StatefulWidget {
  /// Titulo input
  final String label;

  /// Text controller
  final TextEditingController? controller;

  /// Whether the form is able to receive user input.
  final bool? enabled;

  /// Tipo de dato que se ingresará en el formulario
  final InputValueType? inputValueType;

  /// Si es repetición de cotraseña se debe validar
  final String? passwordValue;

  const CustomTextFormField(
      {Key? key,
      required this.label,
      this.controller,
      this.enabled,
      this.inputValueType = InputValueType.text,
      this.passwordValue})
      : super(key: key);

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  final TextEditingController _tec = TextEditingController();
  bool obscureText = false;

  bool? showError;
  String? errorMessage = '';

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      obscureText = (widget.inputValueType == InputValueType.password ||
          widget.inputValueType == InputValueType.passwordRepeat);
      setState(() {});
    });
    super.initState();
  }

  _validate(String? text) {
    switch (widget.inputValueType) {
      case InputValueType.email:
        errorMessage = validateEmail(text ?? '');
        break;
      case InputValueType.password:
        errorMessage = validatePassword(text);
        break;
      case InputValueType.passwordRepeat:
        errorMessage = validatePasswordRepeat(text, widget.passwordValue);
        break;
      case InputValueType.phone:
        errorMessage = validatePhone(text);
        break;
      case InputValueType.text:
      case InputValueType.textArea:
      case InputValueType.number:
      default:
        errorMessage = validateText(text);
        break;
    }
    showError = errorMessage != null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ?? _tec,
      validator: (x) {
        _validate(x);
        return errorMessage;
      },
      enabled: widget.enabled,
      keyboardType: _keyboardType(),
      obscureText: obscureText,
    );
  }

  _currentIcon() {
    if (widget.inputValueType == InputValueType.password ||
        widget.inputValueType == InputValueType.passwordRepeat) {
      return InkWell(
        borderRadius: dimens.borderRadiusContainer(1),
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: const SizedBox(width: 0, height: 0),
      );
    }

    return Container(width: 0);
  }

  _keyboardType() {
    switch (widget.inputValueType) {
      case InputValueType.email:
        return TextInputType.emailAddress;
      case InputValueType.password:
      case InputValueType.passwordRepeat:
        return TextInputType.visiblePassword;
      case InputValueType.phone:
      case InputValueType.number:
        return TextInputType.number;
      case InputValueType.text:
      case InputValueType.textArea:
      default:
        return TextInputType.text;
    }
  }
}
