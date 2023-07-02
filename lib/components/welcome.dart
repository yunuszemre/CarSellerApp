import 'package:flutter/material.dart';
import 'package:flutter_car_selling_app/core/project_colors.dart';

class WelcomeTexts extends StatelessWidget {
  TextStyle style;
  String pageInfo;
  String pageMessage;
  WelcomeTexts(
      {super.key,
      required this.pageInfo,
      required this.pageMessage,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        child: Column(
          children: [
            Text(pageInfo,
                style: style.copyWith(
                    fontSize: 20,
                    color: ProjectColors.Deepblack,
                    fontWeight: FontWeight.w900)),
            Text(pageMessage,
                style: style.copyWith(fontSize: 14, color: ProjectColors.Deepblack))
          ],
        ),
      ),
    );
  }
}