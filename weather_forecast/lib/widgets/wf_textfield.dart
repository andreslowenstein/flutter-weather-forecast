import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum WFTextFormFieldVariations { text, number }

class WFTextFormField extends StatelessWidget {
  final String? placeHolder;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final bool? enabled;
  final WFTextFormFieldVariations? type;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final bool obscureText;
  final TextStyle? placeHolderStyle;
  final Key? key;
  final int? maxLength;

  WFTextFormField.text({
    this.key,
    this.placeHolder,
    this.placeHolderStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.inputFormatters,
    this.keyboardType,
    String? initialValue,
    TextEditingController? controller,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.maxLength,
  })  : assert(initialValue == null || controller == null),
        this.type = WFTextFormFieldVariations.text,
        this.textAlign = TextAlign.left,
        this.initialValue = initialValue,
        this.controller = controller;

  WFTextFormField.number({
    this.key,
    this.placeHolder,
    this.placeHolderStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    List<TextInputFormatter>? inputFormatters,
    String? initialValue,
    TextEditingController? controller,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.maxLength,
  })  : assert(initialValue == null || controller == null),
        this.type = WFTextFormFieldVariations.number,
        this.keyboardType = TextInputType.number,
        inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          ...((inputFormatters != null) ? inputFormatters : []),
        ],
        this.initialValue = initialValue,
        this.controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      onSaved: onSaved,
      controller: this.controller,
      key: this.key,
      initialValue: this.initialValue,
      maxLength: this.maxLength,
      keyboardType: this.keyboardType,
      enabled: this.enabled,
      textAlign: this.textAlign,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        label: Text(
          '${this.placeHolder ?? ''}',
          textAlign: this.textAlign,
          style: this.placeHolderStyle ??
              Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
        ),
        prefixIcon: this.prefixIcon,
        suffixIcon: this.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 199, 199, 199), width: 1.5),
        ),
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
      ),
      inputFormatters: this.inputFormatters,
    );
  }
}
