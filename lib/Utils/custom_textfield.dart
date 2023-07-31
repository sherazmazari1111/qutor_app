import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  CustomTextField1({Key? key, this.controller, this.sicon, this.obs, this.txt})
      : super(key: key);

  final txt;
  final obs;
  final sicon;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obs,
      decoration: InputDecoration(

        labelText: txt,
        // hintText: txt, // This will change the hint text color to white
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white), // Change hint text color
        suffixIcon: Icon(sicon),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Change focused border color
        ),
      ),
    );
  }
}
