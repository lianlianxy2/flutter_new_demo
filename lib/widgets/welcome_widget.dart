import 'package:flutter/material.dart';
import 'package:login/theme/app_colors.dart';
import 'package:login/theme/app_size.dart';
import 'package:login/theme/app_style.dart';

class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/bg_welcome_header.png'),
        Positioned(
          top: 194,
          left: 40,
          child: Column(
            children: [
              AppIconWidget(),
              SizedBox(height: 8),
              Text(
                'Sornbeo',
                style: kTitleTextStyle,
              ),
              SizedBox(height: 8),
              Text(
                '每日练习\n 孰能生巧',
                style: kBodyTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kIconBoxSize,
      height: kIconBoxSize,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/icons/app_icon.png',
        width: 24,
        height: 32,
      ),
    );
  }
}


/// 渐变按钮组件
class GradientBtnWidget extends StatelessWidget {
  const GradientBtnWidget({
    Key? key,
    required this.width,
    required this.child,
    required this.onTap,
  }) : super(key: key);
  final double width;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          gradient: kBtnLinearGradient,
          boxShadow: kBtnShadow,
          borderRadius: BorderRadius.circular(kBtnRadius),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

/// 白色按钮文字
class BtnTextWhiteWidget extends StatelessWidget {
  const BtnTextWhiteWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kBtnTextStyle.copyWith(
        color: Colors.white,
      ),
    );
  }
}

class LoginBtnWidget extends StatelessWidget {
  const LoginBtnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBtnShadow,
        borderRadius: BorderRadius.circular(kBtnRadius),
      ),
      alignment: Alignment.center,
      child: Text(
        '登 录',
        style: kBtnTextStyle,
      ),
    );
  }
}