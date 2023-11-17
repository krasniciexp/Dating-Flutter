import 'package:flutter/material.dart';
import 'package:flutter_dating_template/pages/login/widgets/head.dart';
import 'package:flutter_dating_template/state/token.dart';
import 'package:flutter_dating_template/wcao/ui/theme.dart';
import 'package:get/get.dart';

/// HACK: 验证码登录

class LoginVerifyCode extends StatefulWidget {
  const LoginVerifyCode({Key? key}) : super(key: key);

  @override
  State<LoginVerifyCode> createState() => _LoginState();
}

class _LoginState extends State<LoginVerifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            margin: const EdgeInsets.only(bottom: 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Head(),
                buildVerifyCode(),
                loginButton(),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login/password');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: Text(
                      "password login",
                      style: TextStyle(
                        color: WcaoTheme.primaryFocus,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in to agree",
                        style: TextStyle(color: WcaoTheme.placeholder),
                      ),
                      InkWell(
                        child: const Text('《User Agreemen》'),
                        onTap: () =>
                            Navigator.pushNamed(context, "/agreement/user"),
                      ),
                      Text(
                        "and",
                        style: TextStyle(color: WcaoTheme.placeholder),
                      ),
                      InkWell(
                        child: const Text('《Privacy Policy》'),
                        onTap: () =>
                            Navigator.pushNamed(context, "/agreement/privacy"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 密码登录
  Column buildPassWord() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Wrap(
            children: [
              Text(
                'password',
                style: TextStyle(
                  fontSize: 14,
                  color: WcaoTheme.placeholder,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WcaoTheme.outline,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WcaoTheme.primaryFocus,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 登录按钮
  InkWell loginButton() {
    return InkWell(
      onTap: () {
        // HACK: 验证码登录
        TokenController.to.set();
        Get.offAllNamed('/home');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 36),
        alignment: Alignment.center,
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: WcaoTheme.primary,
          borderRadius: WcaoTheme.radius,
        ),
        child: const Text(
          'Log in',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  /// 验证码
  Column buildVerifyCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Wrap(
            children: [
              Text(
                'verification code',
                style: TextStyle(
                  fontSize: 14,
                  color: WcaoTheme.placeholder,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "please enter verification code",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: WcaoTheme.outline,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: WcaoTheme.primaryFocus,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    "get verification code",
                    style: TextStyle(
                      fontSize: 14,
                      color: WcaoTheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
