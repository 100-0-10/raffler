import 'package:flutter/material.dart';
import 'package:raffler/screens/home/home.dart';
import 'package:raffler/screens/login/phone_authentication.dart';
import 'package:raffler/service/login/kakao_login.dart';
import 'package:raffler/utils/constants.dart';

import '../../utils/page_animation.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/splash.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () async {
                if(await KakaoLogin().login()) {
                  Navigator.push(context, createRoute(HomePage(), kOffPageAnimation));
                };
              },
              child: Container(
                width: 200,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/login/kakao_login_large_narrow.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(context, createRoute(PhoneAuthPage(), kRightPageAnimation));
              },
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    '휴대폰 번호로 로그인',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(context, createRoute(PhoneAuthPage(), kLeftPageAnimation));
              },
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          Icons.apple,
                          color: Colors.white
                      ),
                      Text(
                        '애플 로그인',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PhoneAuthPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}