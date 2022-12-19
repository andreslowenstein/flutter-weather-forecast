import 'package:flutter/material.dart';

enum WFButtonVariations { primary, accent, cancel, error, custom }

typedef void WFButtonClickAction(BuildContext x);

class WFButton extends StatelessWidget {
  final WFButtonClickAction onPressed;
  final String label;
  final bool disabled;
  final Color? color;
  final double? elevation;
  final WFButtonVariations? theme;
  final double? width;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? fontColor;

  WFButton({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.disabled = false,
    this.elevation = 0,
    this.padding,
    this.textStyle = null,
    this.borderColor,
    this.fontColor,
  })  : this.color = null,
        this.theme = WFButtonVariations.accent;

  WFButton.primary({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.disabled = false,
    this.elevation = 0,
    this.padding,
    this.textStyle = null,
    this.borderColor,
    this.fontColor,
  })  : this.color = null,
        this.theme = WFButtonVariations.primary;

  WFButton.accent({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.disabled = false,
    this.elevation = 0,
    this.padding,
    this.textStyle = null,
    this.borderColor,
    this.fontColor,
  })  : this.color = null,
        this.theme = WFButtonVariations.accent;

  WFButton.error({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.disabled = false,
    this.elevation = 0,
    this.padding,
    this.textStyle = null,
    this.borderColor,
    this.fontColor,
  })  : this.color = null,
        this.theme = WFButtonVariations.error;

  WFButton.white({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.disabled = false,
    this.elevation = 0,
    this.padding,
    this.textStyle = null,
    this.borderColor,
    this.fontColor,
  })  : this.color = null,
        this.theme = WFButtonVariations.cancel;

  WFButton.custom({
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.disabled = false,
    this.elevation = 0,
    this.padding,
    this.textStyle = null,
    this.borderColor,
    this.fontColor,
    this.color,
  }) : this.theme = WFButtonVariations.custom;

  // double _tamanoLetra(BuildContext context) {
  //   final height = MediaQuery.of(context).size.height;

  //   return (height > 650.0)
  //       ? Theme.of(context).textTheme.bodyText1!.fontSize!
  //       : Theme.of(context).textTheme.headline5!.fontSize!;
  // }

  double _altoBoton(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return (height > 650.0) ? 45 : 45;
  }

  @override
  Widget build(BuildContext context) {
    Color? background;
    Color? borderC;
    Color? font;

    switch (this.theme) {
      case WFButtonVariations.primary:
        background = (!this.disabled)
            ? Theme.of(context).colorScheme.primary
            : Color(0xFFC4C4C4);
        borderC = Colors.transparent;
        font = Colors.white;
        break;
      case WFButtonVariations.accent:
        background = (!this.disabled)
            ? Theme.of(context).colorScheme.secondary
            : Color.fromARGB(255, 196, 196, 196);
        borderC = Colors.transparent;
        font = Colors.white;
        break;
      case WFButtonVariations.error:
        background = (!this.disabled)
            ? Theme.of(context).colorScheme.error
            : Color.fromARGB(255, 196, 196, 196);
        borderC = Colors.transparent;
        font = Colors.white;
        break;
      case WFButtonVariations.cancel:
        background = (!this.disabled) ? Colors.white : Color(0xFFC4C4C4);
        borderC = (!this.disabled) ? Color(0xFF626262) : Colors.transparent;
        font = (!this.disabled) ? Color(0xFF626262) : Colors.white;
        break;
      case WFButtonVariations.custom:
        background = (!this.disabled) ? Colors.white : Color(0xFFC4C4C4);
        borderC = (!this.disabled) ? this.borderColor : Colors.transparent;
        font = (!this.disabled) ? this.fontColor : Colors.white;
        break;
      default:
        background = (!this.disabled)
            ? Theme.of(context).colorScheme.primary
            : Color(0xFFC4C4C4);
        borderC = Colors.transparent;
        font = Colors.white;
        break;
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        width: width ?? double.infinity,
        child: MaterialButton(
          color: background,
          disabledColor: background,
          height: _altoBoton(context),
          child: Text(
            label,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: font, fontWeight: FontWeight.w700),
          ),
          onPressed: disabled ? null : (() => onPressed(context)),
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            side: BorderSide(
              width: 1.5,
              style: BorderStyle.solid,
              color: borderC!,
            ),
          ),
        ),
      ),
    );
  }
}
