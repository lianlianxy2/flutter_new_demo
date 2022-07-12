import 'package:flutter/material.dart';
import 'package:login/pages/loginpage.dart';
import 'package:login/theme/app_colors.dart';
import 'package:login/widgets/welcome_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgColor,
        body: Column(children: [
          WelcomeHeaderWidget(),
          GradientBtnWidget(
            width: 208,
            child: BtnTextWhiteWidget(
              text: '注 册',
            ),
            onTap: () {},
          ),
          SizedBox(height: 16),
          GestureDetector(
            child: LoginBtnWidget(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ));
            },
          ),
        ]));
  }
}
