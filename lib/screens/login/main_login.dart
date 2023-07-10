import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<dynamic> fn_loginWithKakaoAccount() async{
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print("token : "+token.toString());
      return token;
    } catch (e) {
      print("로그인 실패 "+e.toString());

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.bakery_dining_outlined,
                size: 100,

              ),
              const SizedBox(height: 200,),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(200, 40),
                ),
                child: const Text('카카오 로그인',textAlign: TextAlign.center,),
                onPressed: () async {
                  try {
                    AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
                    print('이미 액세스 토큰이 존재하므로 로그인을 시도하지 않습니다.');
                  } catch (e) {
                    OAuthToken token = await fn_loginWithKakaoAccount();
                    User user = await UserApi.instance.me();

                  }
                },
              ),
              const SizedBox(height: 5,),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(200, 40),
                ),
                child: const Text('휴대폰 번호로 로그인'),
                onPressed: (){},
              ),
              const SizedBox(height: 5,),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(200, 40),
                ),
                child: const Text('애플 로그인'),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}