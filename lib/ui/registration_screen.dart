// import 'dart:convert';
// import 'package:flutter/material.dart';
import '../index.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  DateTime selectedDate = DateTime.now();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _mobileController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dobController.text = selectedDate.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations _localizations = AppLocalizations.of(context);

    final name = CustomTextFormField(
      controller: _nameController,
      keyboardType: TextInputType.emailAddress,
      label: "Name",
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );

    final username = CustomTextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      label: "Username",
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );

    final email = CustomTextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      label: "Email Id",
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );

    final password = CustomPasswordTextFormField(
      controller: _passwordController,
      label: "Password",
      obscureText: true,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );

    final address = CustomTextFormField(
      controller: _addressController,
      label: "Address",
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );

    final postcode = CustomTextFormField(
      controller: _postcodeController,
      keyboardType: TextInputType.number,
      label: "PostCode",
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );
    
    final mobile = CustomTextFormField(
      controller: _mobileController,
      keyboardType: TextInputType.emailAddress,
      label: "Mobile",
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
      onFieldSubmitted: (v) {
        FocusScope.of(context).unfocus();
      },
    );

    final country = CustomTextFormField(
      controller: _countryController,
      label: "Select Country",
      isShowsuffixIcon: true,
      suffixIcon: Icon(Icons.arrow_drop_down),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final state = CustomTextFormField(
      controller: _countryController,
      label: "Select State",
      textInputAction: TextInputAction.next,
      isShowsuffixIcon: true,
      suffixIcon: Icon(Icons.arrow_drop_down),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );
    
    final city = CustomTextFormField(
      controller: _cityController,
      label: "Select City",
      textInputAction: TextInputAction.next,
      isShowsuffixIcon: true,
      suffixIcon: Icon(Icons.arrow_drop_down),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final dob = CustomTextFormField(
      controller: _dobController,
      label: "Date of birth",
      textInputAction: TextInputAction.done,
      isShowsuffixIcon: true,
      suffixIcon: Icon(Icons.arrow_drop_down),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final signUpButton = CustomFlatButton(
      text: _localizations.translate("save"),
      textStyle: white18TextStyle(),
      borderRadius: 20,
      onButtonPressed: () {
        // final emails = _emailController.text;
        // final passwords = _passController.text;
        // if (emails.length > 0 && passwords.length > 0) {
        // } else {
        //   // _showMyDialog();
        // }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              kverticalSpaceTextField,
              name,
              kverticalSpaceTextField,
              username,
              kverticalSpaceTextField,
              email,
              kverticalSpaceTextField,
              password,
              kverticalSpaceTextField,
              address,
              kverticalSpaceTextField,
              postcode,
              kverticalSpaceTextField,
              mobile,
              kverticalSpaceTextField,
              InkWell(
                onTap: () {},
                child: IgnorePointer(
                  child: country,
                ),
              ),
              kverticalSpaceTextField,
              InkWell(
                onTap: () {},
                child: IgnorePointer(
                  child: state,
                ),
              ),
              kverticalSpaceTextField,
              InkWell(
                onTap: () {
                  // var listdata = loadAssets(context);
                  // print(listdata);

                  showDialog(
                    // barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => FutureBuilder(
                      future: loadAssets(context),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CountryList>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text('Loading....'),
                          );
                        }
                        return MultiSelectionAlert(
                          listCountryData: snapshot.requireData,
                        );
                      },
                    ),
                  );
                },
                child: IgnorePointer(
                  child: city,
                ),
              ),
              kverticalSpaceTextField,
              InkWell(
                onTap: () {
                  selectDate(
                      context); // Call Function that has showDatePicker()
                },
                child: IgnorePointer(
                  child: dob,
                ),
              ),
              kverticalSpaceTextField,
              signUpButton,
              kverticalSpaceTextField,
//            loginButton,
            ],
          ),
        ),
      ),
    );
  }

  Future<List<CountryList>> loadAssets(BuildContext context) async {
    final data = await DefaultAssetBundle.of(context)
        .loadString('assets/jsonfile/Country.json');
    final jsonResponse = jsonDecode(data);

    List arrData = jsonResponse["countryList"];
    List<CountryList> listData = [];
    for (var i = 0; i < arrData.length; i++) {
      var data = CountryList();
      data.name = arrData[i]['name'];
      data.code = arrData[i]['code'];
      data.isSelected = false;
      listData.add(data);
    }
    return listData;
  }
}
