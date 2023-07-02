import 'package:flutter/material.dart';
import 'package:flutter_car_selling_app/core/project_colors.dart';

class OrangeButton extends StatelessWidget {
  String text;
  MaterialPageRoute route;
  OrangeButton({super.key, required this.textStyleG, required this.text, required this.route});

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 366,
      height: 64,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ProjectColors.ThemeOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              // padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
              textStyle: textStyleG.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 18)),
          onPressed: () {
            Navigator.push(context, route);
          },
          child: Text(text)),
    );
  }
}