import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final Function onSwitchToggle;
  bool isSwitchOn;
  Color trackColor = CupertinoColors.secondarySystemFill;
  Color activeColor = CupertinoColors.systemGreen;

  CustomSwitch({this.isSwitchOn, this.onSwitchToggle, this.trackColor, this.activeColor});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
//  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      trackColor: widget.trackColor,
      activeColor: widget.activeColor,
      value: widget.isSwitchOn,
      onChanged: (bool value) {
        setState(() {
          widget.isSwitchOn = value;
          widget.onSwitchToggle(value);
        });
      },
    );

//    return Switch(
//      value: widget.isSwitchOn,
//      onChanged: (value) {
//        setState(() {
//          widget.isSwitchOn = value;
//          print(value);
//        });
//      },
//      activeTrackColor: Colors.green[300],
//      inactiveTrackColor: Colors.grey[400],
//      activeColor: Colors.white,
//    );
  }
}
