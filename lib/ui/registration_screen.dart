import '../index.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations _localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: _localizations.translate("register_title")),

      body: Container(

      ),
    );
  }
}