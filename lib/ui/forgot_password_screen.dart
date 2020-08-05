import '../index.dart';


class ForgotPasswordScreen extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppLocalizations _localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: CustomAppBar(_localizations.translate("forgot_password_title")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png", width: 150.0, height: 150.0),
            SizedBox(height: 20.0),
            CustomTextFormField(
              label: _localizations.translate("email"),
              labelStyle: green16TextStyle(),
              keyboardType: TextInputType.text,
              obscureText: false,
              showPasswordToggleIcon: false,
              controller: _emailController,
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: CustomRaisedButton(
                text: _localizations.translate("send_email"),
                buttonColor: green,
                textColor: white,
                borderRadius: 8.0,
                fontSize: 20.0,
                onCustomButtonPressed: _onSendEmailPressed,
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSendEmailPressed(BuildContext context) {
    print("Send Email button is clicked!: $context");
  }
}
