import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:raffler/utils/constants.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key, required this.imagePath, required this.title, required this.maxTicket, required this.winningReview});

  final String imagePath;
  final String title;
  final String maxTicket;
  final String winningReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          LinearPercentIndicator(
            barRadius: Radius.circular(10),
            padding: EdgeInsets.only(top: 10),
            width: 180,
            lineHeight: 25,
            percent: 1822/3000,
            center: Text(
              '1,822'+'/'+'3,000',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            progressColor: kMainLightColor,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                ),
                Text(
                  '최대 응모 개수 100개',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 10,
                  ),
                ),
                Text(
                  '당첨리뷰 72',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 10,
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}
