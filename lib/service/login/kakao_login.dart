import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:raffler/service/login/social_login.dart';

class KakaoLogin implements SocialLogin {
  bool isLogined = false;

  void _getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공: 회원번호: ${user.id},'
          '닉네임: ${user.kakaoAccount?.profile?.nickname}');
    } catch (error) {
      print('사용자 정보 요청 실패 : $error');
    }
  }

  Future<void> _signInWithKakao() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효성 체크 성공: ${tokenInfo.id} ${tokenInfo.expiresIn}');
        isLogined = true;
        _getUserInfo();
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료: $error');
        } else {
          print('토큰 정보 조회 실패: $error');
        }

        await _loginWithKakaoAccount();
      }
    } else {
      print('발급된 토큰 없음');
      await _loginWithKakaoAccount();
    }
  }

  Future<void> _loginWithKakaoAccount() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공: ${token.accessToken}');
        isLogined = true;
        _getUserInfo();
      } catch (error) {
        print('카카오톡으로 로그인 실패: $error');

        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }

        await _loginWithKakaoAccountFallback();
      }
    } else {
      await _loginWithKakaoAccountFallback();
    }
  }

  Future<void> _loginWithKakaoAccountFallback() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('카카오계정으로 로그인 성공: ${token.accessToken}');
      isLogined = true;
      _getUserInfo();
    } catch (error) {
      print('카카오계정으로 로그인 실패: $error');
    }
  }

  Future<void> _logout() async {
    try {
      await UserApi.instance.unlink();
      print('카카오계정 로그아웃');
      isLogined = false;
    } catch (error) {
      print('$error');
    }
    isLogined = false;
  }

  @override
  Future<bool> login() async {
    await _signInWithKakao();
    return isLogined;
  }

  @override
  Future<bool> logout() async {
    await _logout();
    return isLogined;
  }
}
