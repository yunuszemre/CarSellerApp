import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_selling_app/components/CreateorLoginTextWidget.dart';
import 'package:flutter_car_selling_app/components/logo.dart';
import 'package:flutter_car_selling_app/components/orange_button.dart';
import 'package:flutter_car_selling_app/components/text_input.dart';
import 'package:flutter_car_selling_app/components/welcome.dart';
import 'package:flutter_car_selling_app/core/project_strings.dart';
import 'package:flutter_car_selling_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleG = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    var route = MaterialPageRoute(builder: (context) => LoginView());
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color(0xFFF9FAFB), // <-- SEE HERE
                statusBarIconBrightness:
                    Brightness.dark, //<-- For Android SEE HERE (dark icons)
                statusBarBrightness: Brightness.light,
                systemNavigationBarIconBrightness:
                    Brightness.dark //<-- For iOS SEE HERE (dark icons)
                ),
          ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LogoWigdet(textStyleG: textStyleG),
              WelcomeTexts(
                  pageInfo: ProjectStrings.SignUp,
                  pageMessage: ProjectStrings.FindYourDreamCar,
                  style: textStyleG),
              InputWidget(
                  hintText: ProjectStrings.FullName,
                  style: textStyleG,
                  inputIcon: Icon(Icons.person)),
              InputWidget(
                  hintText: ProjectStrings.Email,
                  style: textStyleG,
                  inputIcon: Icon(Icons.email)),
              InputWidget(
                  hintText: ProjectStrings.Phone,
                  style: textStyleG,
                  inputIcon: Icon(Icons.call)),
              InputWidget(
                  hintText: ProjectStrings.passwordPlaceHolder,
                  style: textStyleG,
                  inputIcon: Icon(Icons.lock)),
              SizedBox(
                height: 41,
              ),
              OrangeButton(textStyleG: textStyleG, text: ProjectStrings.SignUp, route: route),
              CreateorLoginTextWidget(
                textStyleG: textStyleG,
                actionText: ProjectStrings.login,
                infotext: ProjectStrings.alreadyHaveAnAccount,
                pagedata: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
