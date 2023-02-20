import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vacation_tour_app/widgets/app_text.dart';

import '../utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  String? text;
  IconData? icon;
  bool? isIcon;
  AppButton({Key? key, required this.color,
  required this.size,
    required this.backgroundColor,
    required this.borderColor,
  this.text="Hi",this.icon,this.isIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor
      ),
      child: isIcon==false?Center(child: AppText(text: text!,color: color,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
