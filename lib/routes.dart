import 'index.dart';

const String loginScreen = '/login';
const String forgotPasswordScreen = '/forgotPassword';
const String registerScreen = '/register';
const String homeScreen = '/home';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case homeScreen:
        var data = settings.arguments as HomeScreenArguments;
        return MaterialPageRoute(builder: (_) => HomeScreen(arguments: data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

// TODO: Example of Navigation with arguments
// Navigator.pushNamed(context, homeScreen,arguments: 
//           HomeScreenArguments(
//             title: "CC",
//             message: "Lorem ipsum",
//           ));

// class HomeScreen extends StatefulWidget {
//   final HomeScreenArguments arguments;

//   const HomeScreen({
//     Key key,this.arguments
//   }) : super(key: key);

//   @override
//   HomeScreenState createState() {
//     return HomeScreenState();
//   }
// }