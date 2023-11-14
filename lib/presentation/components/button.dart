import 'package:flutter/material.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/constant.dart';

class Button extends StatefulWidget {
  final String label;
  final Function() onPressed;
  Button({super.key, required this.label, required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.6, 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: MaterialButton(
            minWidth: double.infinity,
            height: 60.0,
            onPressed: widget.onPressed,
            color: primary,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            child: Text(
              widget.label, 
              style: TextStyle(
                color: white,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              )
            )
          ),
        ),
      )
    );
  }
}