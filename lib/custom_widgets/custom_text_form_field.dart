
import 'package:flutter/cupertino.dart';
import '../index.dart';


class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextStyle labelStyle;
  final TextInputType keyboardType;
  bool obscureText;
  final bool showPasswordToggleIcon;
  final TextEditingController controller;
  final int maxLines = 1;
//  double contentPadding = 8.0;
//  double borderWidth = 1.0;
//  MaterialColor enabledBorderColor = Colors.grey;
//  MaterialColor focusedBorderColor = Colors.blue;
//  double borderRadius = 8.0;

  CustomTextFormField(
      {this.label,
      this.labelStyle,
      this.keyboardType,
      this.obscureText,
      this.showPasswordToggleIcon,
      this.controller});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      cursorColor: primarythemeColor,
      maxLines: widget.maxLines,
      autofocus: false,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: widget.labelStyle,
//        contentPadding: EdgeInsets.all(widget.contentPadding),
        suffixIcon: widget.showPasswordToggleIcon == true
            ? widget.obscureText == true
                ? IconButton(
                    icon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => widget.obscureText = !widget.obscureText);
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: primarythemeColor,
                    ),
                    onPressed: () {
                      setState(() => widget.obscureText = !widget.obscureText);
                    },
                  )
            : null,
//        enabledBorder: OutlineInputBorder(
//            borderSide: BorderSide(
//                width: widget.borderWidth, color: widget.enabledBorderColor),
//            borderRadius:
//                BorderRadius.all(Radius.circular(widget.borderRadius))),
//        focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(
//                width: widget.borderWidth, color: widget.focusedBorderColor),
//            borderRadius:
//                BorderRadius.all(Radius.circular(widget.borderRadius))),
      ),
    );
  }
}