import 'index.dart';
import 'dart:ui' as ui;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
}

// Initializes required data
init() async {
  await AppManager.initSharedPreference();
  Widget _defaultWidget = getDefaultWidget();
  runApp(MyApp(defaultWidget: _defaultWidget));
}

/// Redirects to home screen
Widget getDefaultWidget() {
  Widget _defaultWidget = new LoginScreen();
  if (AppManager.instance.sharedPreferenceRepository.isLoggedIn()) {
    _defaultWidget = new HomeScreen();
  } else {
    _defaultWidget = new LoginScreen();
  }
  return _defaultWidget;
}

class MyApp extends StatefulWidget {
  final Widget defaultWidget;

  MyApp({this.defaultWidget});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  void initState() {
    super.initState();
    // AppLocalizations.delegate.load(Locale('en'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (BuildContext context, Widget widget) {
//         ['ar', // Arabic 'fa', // Farsi 'he', // Hebrew 'ps', // Pashto 'ur', // Urdu];
        // var language = AppLocalizations.of(context).currentLanguage;
        var language = ui.window.locale.languageCode; // Get System Language
        print(language);
        if (language == 'ar' ||
            language == 'fa' ||
            language == 'he' ||
            language == 'ps' ||
            language == 'ur') {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: widget,
          );
        } else {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: widget,
          );
        }
      },
      supportedLocales: [
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // routes: <String, WidgetBuilder>{
      //     getRoute(Routes.login): (BuildContext context) => new LoginScreen(),
      //     getRoute(Routes.forgot_password): (BuildContext context) =>
      //         new ForgotPasswordScreen(),
          
      //     getRoute(Routes.team_details_list): (BuildContext context) =>
      //         new TeamDetailsListScreen(),
      //     getRoute(Routes.team_information): (BuildContext context) =>
      //         new TeamInformationScreen(),
      //     getRoute(Routes.profile): (BuildContext context) =>
      //         new ProfileScreen(),
      //     getRoute(Routes.new_journal): (BuildContext context) =>
      //         new NewJournalScreen(),
      //   },
      home: widget.defaultWidget,
    );
  }
}
