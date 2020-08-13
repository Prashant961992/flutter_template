import 'package:flutter/material.dart';
import '../index.dart';

class CustomFlatButton extends StatelessWidget {
  final Function onButtonPressed;
  final Color color;
  final EdgeInsets padding;
  final String text;
  final TextStyle textStyle;
  final double height;
  final double borderRadius;

  CustomFlatButton(
      {this.text,
      this.textStyle,
      this.color,
      this.padding,
      this.height = 40.0,
      this.borderRadius = 8.0,
      this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          boxShadow: Shadows.flatButtonshadow,
          borderRadius: new BorderRadius.circular(borderRadius),
          gradient: Gradients.flatButtonGredient),
      child: FlatButton(
        splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        padding: padding,
        // color: color,
        onPressed: () {
          onButtonPressed();
        },
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
