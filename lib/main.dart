import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/ui/home_screen.dart';
import 'package:template/ui/login_screen.dart';
import 'package:template/utils/utils.dart';
import 'localization/app_localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
  // AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    // _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale("en", ""));
    // // application.onLocaleChanged = onLocaleChange;
    // onLocaleChange(Locale('en'));
  }

  // void onLocaleChange(Locale locale) {
  //   setState(() {
  //     _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
  //   });
  // }

  // Code When change App Locale
  // void onLocaleChange(Locale locale) async {
  //   setState(() {
  //     AppLocalizations.load(locale);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//       builder: (BuildContext context, Widget widget) {
// //         ['ar', // Arabic 'fa', // Farsi 'he', // Hebrew 'ps', // Pashto 'ur', // Urdu];
//         var language = AppLocalizations.of(context).currentLanguage;
//         // var _sysLng = ui.window.locale.languageCode; // Get System Language
//         // print(_sysLng);
//         if (language == 'ar' ||
//             language == 'fa' ||
//             language == 'he' ||
//             language == 'ps' ||
//             language == 'ur') {
//           return Directionality(
//             textDirection: TextDirection.rtl,
//             child: widget,
//           );
//         } else {
//           return Directionality(
//             textDirection: TextDirection.ltr,
//             child: widget,
//           );
//         }
//       },
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
