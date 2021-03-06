import 'package:flutter/gestures.dart';

import '../index.dart';

class HomeScreenArguments {
  final String title;
  final String message;

  HomeScreenArguments({this.title, this.message});
}

class HomeScreen extends StatefulWidget {
  final HomeScreenArguments arguments;

  const HomeScreen({Key key, this.arguments}) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: "Hello",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome"),
          ],
        ),
      ),
    );
  }

  void _load() {
    // _homeBloc.add(HomeRequestEvent("", ""));
  }
}
