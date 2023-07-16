import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:raffler/screens/login/login.dart';
import 'package:raffler/widgets/appbar/home_app_bar.dart';

import '../../service/login/kakao_login.dart';
import '../../service/login/social_login.dart';
import '../../widgets/bottombar/home_bottom_bar.dart';
import '../../widgets/home/home_banner.dart';
import '../../widgets/home/home_product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, int index) {
                  if (index == 0) return HomeBanner();
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeProduct(
                        imagePath: 'assets/splash.png',
                          title: '루피화남1',
                          maxTicket: '',
                          winningReview: '',
                      ),
                      HomeProduct(
                        imagePath: 'assets/main/루피2.png',
                        title: '루피화났다루피화났다루피화났다루피화났다루피화났다루피화났다',
                        maxTicket: '',
                        winningReview: '',
                      ),
                    ],
                  );
                },
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
