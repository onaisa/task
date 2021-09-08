import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaoltTextFormFiled({
  TextEditingController textController,
  String labelText,
  Widget prefixIcon,
  String textValidator,
  String conterText,
}) =>
    TextFormField(
        controller: textController,
        keyboardType: TextInputType.text,
        validator: (text) {
          if (text.isEmpty) {
            return "$textValidator is requierd";
          } else
            return null;
        },
        decoration: InputDecoration(
          counterText: conterText,
          labelText: labelText,
          prefixIcon: prefixIcon,
        ));

Widget defaoltFileFormFiled({
  TextEditingController textController,
  String labelText,
  Widget prefixIcon,
  String textValidator,
  Function onTap,
}) =>
    TextFormField(
        onTap: () {
          onTap();
        },
        controller: textController,
        validator: (text) {
          if (text.isEmpty) {
            return "$textValidator is requierd";
          } else
            return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: prefixIcon,
        ));
Widget defoalButton({String text, Function onpressed}) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        onPressed: () {
          onpressed();
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

PreferredSizeWidget defoaltAppbar({String title}) => AppBar(
      title: Text(title),
      centerTitle: true,
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
