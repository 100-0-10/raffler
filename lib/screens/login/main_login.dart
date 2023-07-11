import 'package:flutter/material.dart';
import 'package:raffler/main_view_model.dart';
import 'package:raffler/screens/login/kakao_login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key ? key}) : super(key: key);

  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                child: Image.network(viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
              ),
              Text(
                '${viewModel.isLogined}',
              ),
              Text(
                viewModel.user?.kakaoAccount?.profile?.nickname ?? '',
              ),
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
                  await viewModel.login();
                  setState(){};
                },
              ),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(200, 40),
                ),
                child: const Text('로그아웃'),
                onPressed: () async {
                  await viewModel.logout();
                  setState(){};
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