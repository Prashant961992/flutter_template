
import 'package:flutter/cupertino.dart';
import '../index.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  bool isShowMenuButton = false;
  List<Widget> children = const <Widget>[];
  bool showBack = true;
  final bool centerTitle = true;
  final Color bgColor = primarythemeColor;
  final Color iconColor = white;
  bool showLeadingMenuButton = false;
  Widget leadingWidget;

  CustomAppBar({this.title,
      this.isShowMenuButton,
      this.children,
      this.showBack,
      this.showLeadingMenuButton,
      this.leadingWidget});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(50.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: widget.bgColor,
        centerTitle: widget.centerTitle,
        title: Text(
          widget.title,
          style: white18TextStyle(),
        ),
        leading: widget.showBack == true
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios, color: widget.iconColor),
                onPressed: () => Navigator.of(context).pop(),
              )
            : widget.showLeadingMenuButton == true
                ? widget.leadingWidget
                : null,
        iconTheme: IconThemeData(
          color: widget.iconColor,
        ),
        actions: widget.isShowMenuButton == true ? widget.children : null,
      ),
    );
  }
}
