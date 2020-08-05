import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/custom_widgets/custom_raised_button.dart';
import 'package:template/custom_widgets/custom_text_form_field.dart';
import 'package:template/localization/app_localization.dart';
import 'package:template/ui/login/index.dart';
import 'package:template/utils/app_manager.dart';
import 'package:template/utils/colors.dart';
import 'package:template/utils/commons.dart';
import 'package:template/utils/dimens.dart';
import 'package:template/utils/routes.dart';
import 'package:template/utils/styles.dart';

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
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations _localizations = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        body: BlocListener(
          cubit: _loginBloc,
          listener: (context, state) {
            if (state is LoadingLoginState) {
              showProgressDialog(context);
            } else if (state is ErrorLoginState) {
              hideProgressDialog(context);
              showToast(context,
                  AppLocalizations.of(context).translate(state.errorMessage));
            } else if (state is SuccessLoginState) {
              hideProgressDialog(context);
              print("response: ${state.response.userState}");
              print("success response: ${state.response.password}");
              AppManager.instance.sharedPreferenceRepository.saveLoggedIn(true);
              if (rememberMe) {
                AppManager.instance.sharedPreferenceRepository
                    .saveLoginResponse(state.response);
              }
              Navigator.pushReplacementNamed(context, getRoute(Routes.my_team));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            cubit: _loginBloc,
            builder: (context, state) {
              return Center(
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
                        Image.asset("images/logo.png",
                            width: 150.0, height: 150.0),
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
                              label: _localizations
                                  .translate("remember_me"),
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
              );
            },
          ),
        ),
        bottomNavigationBar: FlatButton(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
          color: Colors.transparent,
          onPressed: () {
        
          },
          child: Text(
            _localizations
                .translate("not_a_member_register_here"),
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
      BlocProvider.of<LoginBloc>(context).add(
        LoginRequestEvent(username, base64Password),
      );
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
