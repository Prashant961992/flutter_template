import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../index.dart';

class CustomDialog extends StatefulWidget {
  final BuildContext context;
  final String msgText;
  final String imagePath;
  final String posBtnLabel;
  final String negBtnLabel;
  final VoidNavigate onPosButtonClick;
  final VoidNavigate onNegButtonClick;
  final bool isPosBtnVisible;
  final bool isNegBtnVisible;
  final bool isVerticalDividerVisible;

  CustomDialog(
      {this.context,
      this.msgText,
      this.imagePath,
      this.posBtnLabel,
      this.negBtnLabel,
      this.onPosButtonClick,
      this.onNegButtonClick,
      this.isNegBtnVisible,
      this.isPosBtnVisible,
      this.isVerticalDividerVisible});

  @override
  _CustomDialog createState() => new _CustomDialog();
}

typedef VoidNavigate = void Function(BuildContext context);

class _CustomDialog extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return new Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: margin,
                    ),
                    Image.asset(widget.imagePath, width: 60.0, height: 60.0),
                    Padding(
                      padding: const EdgeInsets.all(margin),
                      child: Text(
                        widget.msgText,
                        style: black18TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Visibility(
                              visible: widget.isNegBtnVisible,
                              child: Expanded(
                                child: FlatButton(
                                  onPressed: () {
                                    widget.onNegButtonClick(widget.context);
                                  },
                                  child: Text(
                                    widget.negBtnLabel,
                                    style: black16TextStyle(),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: widget.isVerticalDividerVisible,
                              child: Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.black,
                                  )),
                            ),
                            Visibility(
                              visible: widget.isPosBtnVisible,
                              child: Expanded(
                                child: FlatButton(
                                  onPressed: () {
                                    widget.onPosButtonClick(widget.context);
                                  },
                                  child: Text(
                                    widget.posBtnLabel,
                                    style: green16TextStyle(),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    )
                  ]))
        ]));
  }
}
