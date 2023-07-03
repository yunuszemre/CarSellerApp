import 'package:flutter/material.dart';
import 'package:flutter_car_selling_app/core/project_colors.dart';
import 'package:flutter_car_selling_app/core/project_strings.dart';

class LogoWigdet extends StatelessWidget {
  const LogoWigdet({
    super.key,
    required this.textStyleG,
  });

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ProjectColors.MaximumOrange, borderRadius: BorderRadius.circular(38)),
      child: SizedBox(
        width: 76,
        height: 76,
        child: Center(
          child: Text(
            ProjectStrings.logoLetter,
            style: textStyleG.copyWith(fontSize: 50, color: ProjectColors.White),
          ),
        ),
      ),
    );
  }
}