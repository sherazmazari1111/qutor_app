import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
   Btn({Key? key , this.color1,this.color2,this.txt,this.hgt,this.wdgt}) : super(key: key);
final color1;
  final color2;
final txt;
final hgt;
final wdgt;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return Container(

      height: hgt,
      width: wdgt,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1,color2],),
borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(
          // color: Colors.black12,
          // blurRadius: 9.0,
          // blurStyle: BlurStyle.outer,
          // spreadRadius: 7.0,
        ),],
      ),
      child: Center(child: Text(txt,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),),
    );
  }
}
class Btn1 extends StatelessWidget {
  Btn1({Key? key , this.color1,this.color2,this.txt,this.hgt,this.wdgt}) : super(key: key);
  final color1;
  final color2;
  final txt;
  final hgt;
  final wdgt;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return Container(

      height: hgt,
      width: wdgt,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1,color2],),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          blurStyle: BlurStyle.outer,
          // spreadRadius: 9.0,
        ),],
      ),
      child: Center(child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),),
    );
  }
}

