import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_selling_app/pages/create_account_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/CreateorLoginTextWidget.dart';
import '../components/logo.dart';
import '../components/orange_button.dart';
import '../components/text_input.dart';
import '../components/welcome.dart';
import '../core/project_strings.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleG = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    var route = MaterialPageRoute(builder: (context) => CreateAccountView());
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
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LogoWigdet(textStyleG: textStyleG),
                  WelcomeTexts(
                    pageInfo: ProjectStrings.login,
                    pageMessage: ProjectStrings.welcomeToCarStore,
                    style: textStyleG,
                  ),
                  InputWidget(
                    hintText: ProjectStrings.userNamePlaceholder,
                    style: textStyleG,
                    inputIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputWidget(
                    hintText: ProjectStrings.passwordPlaceHolder,
                    style: textStyleG,
                    inputIcon: Icon(Icons.lock),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 20,
                      child: InkWell(
                        onTap: () => print('Tıklandı'),
                        child: Text(
                          ProjectStrings.forgotPassword,
                          style:
                              textStyleG.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  OrangeButton(
                    route: route,
                    textStyleG: textStyleG,
                    text: ProjectStrings.login,
                  ),
                  CreateorLoginTextWidget(
                    pagedata: true,
                    textStyleG: textStyleG,
                    infotext: ProjectStrings.dontHaveAnAccount,
                    actionText: ProjectStrings.SignUp,
                  )
                ],
              ),
            ),
          ));
  }
}
