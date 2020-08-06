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
        print(AppLocalizations.of(context).translate(state.messageId));
        showToast(
            context, AppLocalizations.of(context).translate(state.messageId));
      } else if (state.status == ApiStatus.SUCCESS) {
        hideProgressDialog(context);
        print("response: ${state.response.userState}");
        if (state.response.userState == ApiErrorState().invalid) {
          showToast(
              context,
              AppLocalizations.of(context)
                  .translate('username_or_password_incorrect'));
        } else {
          print("success response: ${state.response.password}");
          AppManager.instance.sharedPreferenceRepository.saveLoggedIn(true);
          if (rememberMe) {
            AppManager.instance.sharedPreferenceRepository
                .saveLoginResponse(state.response);
          }
          init();
          // Navigator.pushNamed(context, homeScreen,arguments: 
          // HomeScreenArguments(
          //   title: "CC",
          //   message: "Lorem ipsum",
          // ));
          Navigator.popUntil(context, ModalRoute.withName(loginScreen));
          // Navigator.pushReplacementNamed(context, getRoute(Routes.my_team));
        }
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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(margin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _localizations.translate('login_heading'),
                    style: green20BoldTextStyle(),
                  ),
                  SizedBox(height: 30.0),
                  Image.asset("images/logo.png", width: 150.0, height: 150.0),
                  SizedBox(height: 20.0),
                  CustomTextFormField(
                    label: _localizations.translate('username'),
                    labelStyle: green16TextStyle(),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    showPasswordToggleIcon: false,
                    controller: _usernameController,
                  ),
                  SizedBox(height: 8.0),
                  CustomTextFormField(
                    label: _localizations.translate("password"),
                    labelStyle: green16TextStyle(),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    showPasswordToggleIcon: true,
                    controller: _passwordController,
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      color: Colors.transparent,
                      onPressed: () {
                        // _onForgotPwdPressed(context);
                      },
                      child: Text(
                        _localizations.translate("forgot_password"),
                        style: green16TextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomLabelCheckBox(
                        label: _localizations.translate("remember_me"),
                        labelStyle: green16TextStyle(),
                        onChanged: (bool newValue) {
                          print("$newValue");
                          rememberMe = newValue;
                        }),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: CustomRaisedButton(
                      text: _localizations.translate("log_in"),
                      buttonColor: green,
                      textColor: white,
                      borderRadius: 8.0,
                      fontSize: 20.0,
                      onCustomButtonPressed: _onLogInPressed,
                      context: context,
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: FlatButton(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
          color: Colors.transparent,
          onPressed: () {},
          child: Text(
            _localizations.translate("not_a_member_register_here"),
            style: green16TextStyle(),
          ),
        ),
      ),
    );
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
      String base64Password = convertStringToBase64(password);
      _loginBloc.login(username, base64Password);
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
