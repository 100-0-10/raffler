import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_common.dart';
import 'package:raffler/screens/login/main_login.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'cddbdb25f9b1e15be29a4060a8225bd4');
  runApp(
    const MaterialApp(
      home: LoginScreen(),
    )
  );
}