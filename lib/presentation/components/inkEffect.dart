import 'package:flutter/material.dart';

class InkEffect extends StatelessWidget {
  final BoxDecoration? boxDecoration;
  final double? borderRadius;
  final VoidCallback onTap;
  final Widget child;

  const InkEffect(
      {Key? key, this.boxDecoration, this.borderRadius, required this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: boxDecoration,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
