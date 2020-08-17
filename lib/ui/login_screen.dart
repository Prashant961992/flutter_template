import 'package:flutter/material.dart';
import '../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool rememberMe = false;
  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    _loginBloc.behaviorSubject.listen((state) {
      print("${state.status}");
      if (state.status == ApiStatus.LOADING) {
        showProgressDialog(context);
      } else if (state.status == ApiStatus.FAIL) {
        hideProgressDialog(context);
        print(state.messageId);
        // print(AppLocalizations.of(context).translate(state.messageId));
        showToast(context, state.messageId);
      } else if (state.status == ApiStatus.SUCCESS) {
        hideProgressDialog(context);
        AppManager.instance.sharedPreferenceRepository.saveLoggedIn(true);
        if (rememberMe) {
          AppManager.instance.sharedPreferenceRepository
              .saveLoginResponse(state.response);
        }
        init();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations _localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Gradients.backgroundGredient),
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.transparent,
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 40, bottom: 40),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(ImagePath.logo),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                // height: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26, right: 26),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: new BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 40),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Login", style: black18TextStyle()),
                          Padding(
                            padding: EdgeInsets.only(
                                left: left_right_padding,
                                right: left_right_padding),
                            child: CustomTextFormField(
                              controller: _usernameController,
                              label: "Email Id",
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                            ),
                          ),
                          // SizedBox(height: vartical_space),
                          Padding(
                            padding: EdgeInsets.only(
                                left: left_right_padding,
                                right: left_right_padding),
                            child: CustomPasswordTextFormField(
                              controller: _passwordController,
                              label: "Password",
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              showPasswordToggleIcon: true,
                            ),
                          ),
                          SizedBox(height: 14),
                          Padding(
                            padding: EdgeInsets.only(left: left_right_padding),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomLabelCheckBox(
                                  label:
                                      _localizations.translate("remember_me"),
                                  labelStyle: black16TextStyle(),
                                  onChanged: (bool newValue) {
                                    rememberMe = newValue;
                                  }),
                            ),
                          ),
                          // SizedBox(height: vartical_space),
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            color: Colors.transparent,
                            onPressed: () {
                              onForgotPwdPressed(context);
                            },
                            child: Text(
                              _localizations.translate("forgot_password"),
                              style: black16TextStyle(),
                            ),
                          ),
                          // SizedBox(height: vartical_space),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: left_right_padding,
                                  right: left_right_padding),
                              child: CustomFlatButton(
                                text: _localizations.translate("log_in"),
                                textStyle: white18TextStyle(),
                                borderRadius: 20,
                                onButtonPressed: () {
                                  _onLogInPressed(context);
                                },
                              ),
                            ),
                          ),
                          // SizedBox(height: vartical_space),
                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {
                              onRegisterPressed(context);
                            },
                            child: Text(
                              _localizations
                                  .translate("not_a_member_register_here"),
                              style: black16TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onForgotPwdPressed(BuildContext context) {
    Navigator.pushNamed(context, forgotPasswordScreen);
  }

  void onRegisterPressed(BuildContext context) {
    Navigator.pushNamed(context, signupscreeen);
  }

  void _onLogInPressed(BuildContext context) {
    _validateAllFields(
        context, _usernameController.text, _passwordController.text);
  }

  void _validateAllFields(
      BuildContext context, String username, String password) {
    if (username.trim().length == 0) {
      showToast(context,
          AppLocalizations.of(context).translate('blank_email_error_msg'));
    } else if (password.trim().length == 0) {
      showToast(context,
          AppLocalizations.of(context).translate('blank_password_error_msg'));
    } else {
      // String base64Password = convertStringToBase64(password);
      _loginBloc.login(username, password);
    }
  }
}

class CustomLabelCheckBox extends StatefulWidget {
  final String label;
  final TextStyle labelStyle;
  final Function onChanged;

  CustomLabelCheckBox({
    this.label,
    this.labelStyle,
    this.onChanged,
  });

  @override
  _CustomLabelCheckBoxState createState() => _CustomLabelCheckBoxState();
}

class _CustomLabelCheckBoxState extends State<CustomLabelCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked);
      },
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 18,
              height: 18,
              child: Checkbox(
                value: isChecked,
                onChanged: (bool newValue) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                  widget.onChanged(isChecked);
                },
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(child: Text(widget.label, style: widget.labelStyle)),
          ],
        ),
      ),
    );
  }
}
