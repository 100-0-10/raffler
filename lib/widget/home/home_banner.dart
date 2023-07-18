import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 200,
      margin: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: PageView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/splash.png',
              fit: BoxFit.fill,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/main/루피2.png',
              fit: BoxFit.fill,
            ),
          ),
        ]
      ),
    );
  }
}
