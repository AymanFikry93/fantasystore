import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.text,
    this.width,
    this.buttonChild,
    required this.onTap,
    this.isEnabled = true,
    this.margin,
    this.backgroundColor,
    this.foregroundColor,
    this.isExpanded = true,
    this.padding,
    this.borderSide,
    this.borderRadius,
    this.elevation,
  })  : assert(text != null || buttonChild != null),
        super(key: key);
  final String? text;
  final Widget? buttonChild;
  final double? width;
  final Function() onTap;
  final bool isEnabled;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isExpanded;
  final EdgeInsetsDirectional? padding;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? (isExpanded ? MediaQuery.of(context).size.width : null),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              elevation: elevation != null
                  ? MaterialStatePropertyAll<double>(elevation!)
                  : null,
              backgroundColor: backgroundColor != null
                  ? MaterialStatePropertyAll<Color>(backgroundColor!)
                  : null,
              foregroundColor: foregroundColor != null
                  ? MaterialStatePropertyAll<Color>(foregroundColor!)
                  : null,
              padding: padding != null
                  ? MaterialStateProperty.all<EdgeInsetsDirectional>(
                      padding!,
                    )
                  : null,
              shape: borderSide != null
                  ? MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          side: borderSide!,
                          borderRadius:
                              borderRadius ?? BorderRadius.circular(6)),
                    )
                  : null,
            ),
        onPressed: isEnabled ? onTap : null,
        child: buttonChild ?? Text(text!, overflow: TextOverflow.ellipsis),
        // child: buttonChild?? Text(text,style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),)
      ),
    );
  }
}
