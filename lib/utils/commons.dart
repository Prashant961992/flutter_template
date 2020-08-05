import '../index.dart';

/// Shows DatePicker
Future<DateTime> showDatePickerView(
    BuildContext context, DateTime initialDate) async {
  final DateTime selectedDateTime = await showDatePicker(
      //we wait for the dialog to return
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2120));
  return selectedDateTime;
}

/// Shows TimePicker
Future<TimeOfDay> showTimePickerView(
    BuildContext context, TimeOfDay initialTime) async {
  Future<TimeOfDay> selectedTime = showTimePicker(
    initialTime: TimeOfDay.now(),
    context: context,
  );

  return selectedTime;
}

/// Converts String to Base64
String convertStringToBase64(String strValue) {
  List encodedText = utf8.encode(strValue);
  String base64Str = base64.encode(encodedText);
  print('base64: $base64Str');
  return base64Str;
}

/// Converts Base64 to String
String convertBase64ToString(String strBase64) {
  String decodedText = utf8.decode(base64.decode(strBase64));
  print('text: $decodedText');
  return decodedText;
}

/// Shows Toast message
void showToast(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message, toastLength: Toast.LENGTH_SHORT, backgroundColor: black);
}

/// Show Progress Dialog
void showProgressDialog(BuildContext context) {
  try {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Stack(children: <Widget>[
                Center(
                  child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(component_padding),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: const Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.all(margin),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: margin,
                              ),
                              Text(
                                AppLocalizations.of(context).translate('please_wait'),
                                style: black16BoldTextStyle(),
                              )
                            ]),
                      )),
                )
              ]));
        });
  } catch (e) {
    print(e.toString());
  }
}

/// Hides Progress dialog
void hideProgressDialog(BuildContext context) {
  Navigator.pop(context);
}
