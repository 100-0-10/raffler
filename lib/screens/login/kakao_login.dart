import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:raffler/screens/login/social_login.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if(isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print('로그인 성공1');
          return true;
        } catch(e) {
          print('로그인 실패1');
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('로그인 성공2');
          return true;
        } catch(e) {
          print('로그인 실패2');
          print(e);
          return false;
        }
      }
    } catch(e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch(e) {
      return false;
    }
  }

}