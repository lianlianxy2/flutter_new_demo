import 'package:flutter/material.dart';
import 'package:login/theme/app_style.dart';
import 'package:login/widgets/login_widget.dart';
import '../common/events.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset('assets/images/bg_login_header.png'),
          Column(
            children: [
              SizedBox(height: 220),
              ClipPath(
                clipper: LoginClipper(),
                child: LoginBodyWidget(),
              ),
            ],
          ),
          Positioned(
            top: 64,
            left: 28,
            child: BackIcon(),
          )
        ],
      ),
    );
  }
}

String retdata = "";

/// 登录页面内容体
class LoginBodyWidget extends StatefulWidget {
  LoginBodyWidget({Key? key}) : super(key: key);
  _LoginBodyWidget createState() => _LoginBodyWidget();
}

class _LoginBodyWidget extends State<LoginBodyWidget> {
  String retdata = "";
  @override
  Widget build(BuildContext context) {
    eventBus.on<GitUserInfoEvent>().listen((event) {
      print(event);
      if (event.isRet) {
        setState(() {
          this.retdata = event.ret;
          print("-------------------");
          print(this.retdata);
        });
      } else {
        retdata = "接口请求失败";
      }
    });

    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36),
          Text(
            '登 录',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 20),
          Text(
            '您的账号',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Email',
            prefixIcon: 'assets/icons/icon_email.png',
          ),
          SizedBox(height: 16),
          Text(
            '您的密码',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Password',
            prefixIcon: 'assets/icons/icon_pwd.png',
            obscureText: true,
          ),
          SizedBox(height: 32),
          LoginBtnIconWidget(),
          SizedBox(height: 32),
          // ignore: unnecessary_brace_in_string_interps
          Text("返回的值: ${this.retdata}")
        ],
      ),
    );
  }
}
