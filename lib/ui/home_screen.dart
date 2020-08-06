import '../index.dart';

class HomeScreenArguments {
  final String title;
  final String message;

  HomeScreenArguments({this.title, this.message});
}

class HomeScreen extends StatefulWidget {
  final HomeScreenArguments arguments;

  const HomeScreen({
    Key key,this.arguments
  }) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();

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
      appBar: AppBar(
        title: Text(widget.arguments.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome"),
            Text('Flutter files: done'),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: RaisedButton(
                color: Colors.red,
                child: Text('throw error'),
                onPressed: () => _load(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _load() {
    // _homeBloc.add(HomeRequestEvent("", ""));
  }
}
