import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                onPressed: (){},
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