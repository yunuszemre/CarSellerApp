import 'package:flutter/material.dart';
import 'package:flutter_car_selling_app/core/project_colors.dart';

@immutable
class InputWidget extends StatelessWidget {
  String hintText;
  TextStyle style;
  Icon inputIcon;
  InputWidget(
      {super.key,
      required this.hintText,
      required this.style,
      required this.inputIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(              
              textAlignVertical: TextAlignVertical.center,
              cursorColor: ProjectColors.MaximumOrange,
              decoration: InputDecoration(
                  fillColor: ProjectColors.White,
                  focusColor: ProjectColors.MaximumOrange,
                  prefixIconColor: ProjectColors.BerryChalk,                
                  prefixIcon: inputIcon,
                  hintStyle: style.copyWith(
                      color: ProjectColors.BerryChalk, fontWeight: FontWeight.w600),
                  hintText: hintText,
                  border: InputBorder.none),
            ),
          )),
    );
  }
}

// ignore: must_be_immutable



