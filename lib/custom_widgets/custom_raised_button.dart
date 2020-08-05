import 'package:flutter/material.dart';
import '../index.dart';

class CustomRaisedButton extends StatefulWidget {
  final String text;
  final Color buttonColor;
  final Color disabledButtonColor = Colors.grey;
  final Color textColor;
  final Color disabledTextColor = Colors.black;
  final double borderRadius;
  final double fontSize;
  final VoidNavigate onCustomButtonPressed;
  final BuildContext context;
  final double padding = 8.0;

  CustomRaisedButton({
    this.text,
    this.buttonColor,
    this.textColor,
    this.borderRadius,
    this.fontSize,
    this.onCustomButtonPressed,
    this.context
  });

  @override
  _CustomRaisedButton createState() => new _CustomRaisedButton();
}

class _CustomRaisedButton extends State<CustomRaisedButton> {

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      disabledColor: widget.disabledButtonColor,
      disabledTextColor: widget.disabledTextColor,
      color: widget.buttonColor,
      onPressed: () {
        widget.onCustomButtonPressed(widget.context);
      },
      child: new Text(
        '${widget.text}',
        style: new TextStyle(
          color: widget.textColor,
          fontWeight: FontWeight.bold,
          fontSize: widget.fontSize,
//          fontFamily: 'Roboto',
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(widget.borderRadius),
      ),
      padding: EdgeInsets.all(widget.padding),
    );
  }
}
