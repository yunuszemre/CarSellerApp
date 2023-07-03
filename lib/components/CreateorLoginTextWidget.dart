import 'package:flutter/material.dart';
import 'package:flutter_car_selling_app/pages/create_account_page.dart';
import 'package:flutter_car_selling_app/pages/login_page.dart';

import '../core/project_colors.dart';

@immutable
class CreateorLoginTextWidget extends StatelessWidget {
  String infotext;
  String actionText;
  bool pagedata;
  CreateorLoginTextWidget(
      {super.key,
      required this.pagedata,
      required this.textStyleG,
      required this.actionText,
      required this.infotext});

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              infotext,
              style: textStyleG.copyWith(
                  fontSize: 14, color: ProjectColors.BerryChalk),
            ),
            InkWell(
                onTap: (){
                  if(pagedata){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountView()));
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                  }
                },
                child: Text(
                  actionText,
                  style: textStyleG.copyWith(
                      fontSize: 14, color: ProjectColors.MaximumOrange),
                ))
          ],
        ),
      ),
    );
  }
}
