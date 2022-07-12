import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login/theme/app_size.dart';
import 'package:login/theme/app_style.dart';
import 'package:login/widgets/welcome_widget.dart';
import 'package:dio/dio.dart';
import '../common/events.dart';

///登录页面剪裁曲线
class LoginClipper extends CustomClipper<Path> {
  // 第一个点
  Point p1 = Point(0.0, 54.0);
  Point c1 = Point(20.0, 25.0);
  Point c2 = Point(81.0, -8.0);
  // 第二个点
  Point p2 = Point(160.0, 20.0);
  Point c3 = Point(216.0, 38.0);
  Point c4 = Point(280.0, 73.0);
  // 第三个点
  Point p3 = Point(280.0, 44.0);
  Point c5 = Point(280.0, -11.0);
  Point c6 = Point(330.0, 8.0);

  @override
  Path getClip(Size size) {
    // 第四个点
    Point p4 = Point(size.width, .0);

    Path path = Path();
    // 移动到第一个点
    path.moveTo(p1.x.toDouble(), p1.y.toDouble());
    //第一阶段 三阶贝塞尔曲线
    path.cubicTo(c1.x.toDouble(), c1.y.toDouble(), c2.x.toDouble(),
        c2.y.toDouble(), p2.x.toDouble(), p2.y.toDouble());
    //第二阶段 三阶贝塞尔曲线
    path.cubicTo(c3.x.toDouble(), c3.y.toDouble(), c4.x.toDouble(),
        c4.y.toDouble(), p3.x.toDouble(), p3.y.toDouble());
    //第三阶段 三阶贝塞尔曲线
    path.cubicTo(c5.x.toDouble(), c5.y.toDouble(), c6.x.toDouble(),
        c6.y.toDouble(), p4.x.toDouble(), p4.y.toDouble());
    // 连接到右下角
    path.lineTo(size.width, size.height);
    // 连接到左下角
    path.lineTo(0, size.height);
    //闭合
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this.hashCode != oldClipper.hashCode;
  }
}

/// 登录图标按钮
class LoginBtnIconWidget extends StatelessWidget {
  const LoginBtnIconWidget({
    Key? key,
  }) : super(key: key);
  static Dio dio =
      new Dio(BaseOptions(baseUrl: "https://api.github.com/", headers: {
    HttpHeaders.acceptHeader:
        "application/vnd.github.squirrel-girl-preview,application/vnd.github.symmetra-preview+json",
  }));

  void _login(String login, String pwd) async {
    print("登录github.com");
    String basic =
        'token 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'; // + base64.encode(utf8.encode('$login:$pwd'));
    // print(basic);
    try {
      var response = await dio.get(
        "/user",
        options: (Options(
            headers: {HttpHeaders.authorizationHeader: basic},
            extra: {"noCache": true})),
      );
      String ret = response.data.toString();
      eventBus.fire(GitUserInfoEvent(
        true,ret
      ));
      print(response.data);
    } on DioError catch (e) {
      print(e);
      print(e.requestOptions.headers);
      print(e.message);
    }
    ;
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;

    // print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GradientBtnWidget(
          width: 160,
          child: Row(
            children: [
              SizedBox(width: 34),
              BtnTextWhiteWidget(
                text: 'Login',
              ),
              Spacer(),
              Image.asset(
                'assets/icons/icon_arrow_right.png',
                width: kIconSize,
                height: kIconSize,
              ),
              SizedBox(width: 24),
            ],
          ),
          onTap: () {
            //Navigator.pop(context);
            _login("cspl@foxmail.com", "50422548qq");
            // print("cspl@foxmail.com", "50422548qq");
          },
        )
      ],
    );
  }
}

///登录输入框
class LoginInput extends StatelessWidget {
  const LoginInput({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final String prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    TextEditingController _unameController = TextEditingController();
    return TextField(
      controller: _unameController,
      decoration: InputDecoration(
        hintText: hintText,
        border: kInputBorder,
        focusedBorder: kInputBorder,
        enabledBorder: kInputBorder,
        prefixIcon: Container(
          width: kIconBoxSize,
          height: kIconBoxSize,
          alignment: Alignment.center,
          child: Image.asset(
            prefixIcon,
            width: kIconSize,
            height: kIconSize,
          ),
        ),
      ),
      obscureText: obscureText,
      style: kBodyTextStyle.copyWith(
        fontSize: 18,
      ),
    );
  }
}

/// 返回图标
class BackIcon extends StatelessWidget {
  const BackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: kIconBoxSize,
        height: kIconBoxSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/icons/icon_back.png',
          width: kIconSize,
          height: kIconSize,
        ),
      ),
    );
  }
}
