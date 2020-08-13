import '../index.dart';

class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(41, 0, 0, 0),
    offset: Offset(0, 1),
    blurRadius: 2,
  );

  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(13, 0, 0, 0),
    offset: Offset(0, 3.33333),
    blurRadius: 33,
  );
  
  static const List<BoxShadow> flatButtonshadow = [
    BoxShadow(color: Colors.grey, blurRadius: 5.0)
  ];

}