import 'package:flutter/material.dart';

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
          if (text != null) {
            if (text.isEmpty) {
              return "$textValidator is requierd";
            } else
              return null;
          }
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
