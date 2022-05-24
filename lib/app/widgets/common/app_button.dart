import 'package:flutter/material.dart';

enum ButtonType { normal, outline, round, roundOutline, text }

class AppButton extends StatelessWidget {
  const AppButton(
    this.text, {
    Key? key,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.disabled = false,
    this.type = ButtonType.normal,
    this.borderRadius = 5.0,
    this.borderWidth = 1,
    this.borderColor,
    this.textColor,
    this.color,
    this.elevation = 2,
    this.fontSize = 16,
    this.height = 45,
    this.textHeight = 1.2,
    this.width,
    this.axisSize = MainAxisSize.max,
    this.fontWeight = FontWeight.w600,
    this.maxLines,
    this.padding,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String text;
  final bool loading;
  final int? maxLines;
  final bool disabled;
  final ButtonType type;
  final Widget? icon;
  final Color? borderColor, textColor, color;
  final double? borderRadius,
      borderWidth,
      elevation,
      fontSize,
      height,
      width,
      textHeight;
  final MainAxisSize axisSize;
  final FontWeight fontWeight;
  final EdgeInsets? padding;
  Widget _buildLoading() {
    return SizedBox(
      width: (height ?? 30) - 10,
      height: (height ?? 30) - 10,
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final label = FittedBox(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor ?? Colors.white,
          fontWeight: fontWeight,
          height: textHeight,
        ),
        textScaleFactor: 1,
        maxLines: maxLines,
      ),
    );
    final child = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: axisSize,
      children: loading
          ? [_buildLoading()]
          : [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: icon!,
                ),
              Flexible(child: label),
            ],
    );
    switch (type) {
      case ButtonType.outline:
        Widget button = MaterialButton(
          height: height,
          color: color,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
            side: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
          ),
          onPressed: onPressed,
          child: child,
          padding: padding,
        );

        return button;

      case ButtonType.round:
        Widget button = ElevatedButton(
          onPressed: disabled ? null : onPressed,
          child: child,
        );

        return button;

      case ButtonType.roundOutline:
        Widget button = OutlinedButton(
          onPressed: disabled ? null : onPressed,
          child: child,
          style: OutlinedButton.styleFrom(
            padding: padding,
          ),
        );
        return button;

      case ButtonType.text:
        Widget button = TextButton(
          onPressed: disabled ? null : onPressed,
          child: child,
        );

        return button;
      default:
        Widget button = MaterialButton(
          elevation: elevation,
          height: height,
          minWidth: width,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          color: color ?? Theme.of(context).primaryColor,
          onPressed: disabled || loading ? () {} : onPressed,
          child: child,
        );

        return button;
    }
  }
}
