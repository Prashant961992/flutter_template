import '../utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      cursorColor: green,
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
                      color: green,
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


// class CustomtextField extends StatelessWidget {
//   final String hinttext;
//   final FormFieldValidator<String> validator;
//   final TextEditingController controller;
//   final bool isSecuretext;
//   final TextInputType keyboardType;
//   final bool isShowsuffixIcon;
//   final bool enabled;
//   final String initvalue;
//   final TextInputAction textInputAction;
//   final Function(String) onFieldSubmitted;
//   final VoidCallback onTap;

//   CustomtextField({
//   this.hinttext,
//   this.validator,
//   this.controller,
//   this.isSecuretext: false,
//   this.keyboardType : TextInputType.text,
//   this.isShowsuffixIcon = false,
//   this.onTap,
//   this.enabled = true,
//   this.initvalue,
//   this.textInputAction = TextInputAction.done,
//   this.onFieldSubmitted
//   });

//   @override
//   Widget build(BuildContext context) {
//     return new TextFormField(
//       autofocus: false,
//       onFieldSubmitted: onFieldSubmitted,
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: isSecuretext,
//       onTap: onTap,
//       validator: validator,
//       autovalidate: false,
//       enabled: enabled,
//       textInputAction: textInputAction,
//       onChanged: (value) {
//         print('change');
//       },
//       initialValue: initvalue,
//       // inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
//       decoration: InputDecoration(
//         hintText: hinttext,
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         // prefixIcon: Icon(Icons.mail_outline),
//         suffixIcon: isShowsuffixIcon == true ? Icon(Icons.arrow_drop_down) : null,
//         // border: UnderlineInputBorder(),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//     );
//   }
// }