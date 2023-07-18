import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'RAFFLE R',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kMainDarkColor,
                ),
              ),
              SizedBox(
                width: 170,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
