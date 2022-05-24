import 'package:flutter/services.dart';

import '../../core/styles/style.dart';
import 'input_custom.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.title,
    this.textStyle,
    this.controller,
    this.isDisable = false,
    this.validator,
    this.inputFormatters,
    this.textInputType = TextInputType.multiline,
    this.isPassword = false,
    this.errorStyle,
    this.titleSize = 12,
    this.fontWeightTitle = FontWeight.w600,
    this.onSubmit,
    this.onChanged,
    this.disableChangeColor = true,
  }) : super(key: key);
  final String? title;
  final TextEditingController? controller;
  final bool isDisable, isPassword, disableChangeColor;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType textInputType;
  final TextStyle? errorStyle, textStyle;
  final double titleSize;
  final FontWeight fontWeightTitle;
  final Function(String)? onSubmit, onChanged;

  @override
  Widget build(BuildContext context) {
    return InputCustom(
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      labelText: title,
      hintSize: 16,
      labelStyle: TextStyle(
        color: isDisable && disableChangeColor
            ? AppTheme.titleColor
            : context.primaryColor,
      ),
      controller: controller,
      isUnderBorder: true,
      isIcon: false,
      isPassword: isPassword,
      isShowSuffixIcon: !isDisable,
      readOnly: isDisable,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      fillColor: context.primaryColor
          .withOpacity(isDisable && disableChangeColor ? 0.0 : 0.05),
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      borderSide: BorderSide(
        color: isDisable && disableChangeColor
            ? context.dividerColor
            : context.primaryColor,
        width: 2,
      ),
      validator: validator,
      inputFormatters: inputFormatters,
      inputType: textInputType,
      errorStyle: errorStyle,
      onSubmit: onSubmit,
      onChanged: onChanged,
    );
  }
}
