import 'package:flutter/material.dart';

class PhoneAuthPage extends StatelessWidget {
  const PhoneAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              '휴대폰 번호 인증',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            elevation: 0.5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black26,
              onPressed: () {
                // Navigator.push(context, _createRoute());
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                child: Text(
                  '휴대폰 번호',
                ),
              ),
              Container(
                width: 200,
                height: 40,
                margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '01012345678',
                  ),
                ),
              )
            ],
          )),
    );
  }
}