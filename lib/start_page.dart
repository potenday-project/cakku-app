import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 92),
          SvgPicture.asset(
            'assets/logo.svg',
            semanticsLabel: 'Cakku Logo',
            width: 161,
            height: 32,
          ),
          SizedBox(height: 40),
          Text(
            '카꾸에 오신 걸 환경해요',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '나만의 카드 만들기 💌',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  SvgPicture.asset(
                    'assets/start_image_01.svg',
                    semanticsLabel: 'start_image_01',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: 15),
                  Text(
                    '질문은 8개',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '1분이면 OK!',
                    style: TextStyle(
                      fontSize: 14,
                      color: primary
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(height: 10),
                  SvgPicture.asset(
                    'assets/start_image_02.svg',
                    semanticsLabel: 'start_image_02',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: 15),
                  Text(
                    '몇가지 정보면',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '나만의 카드 완성',
                    style: TextStyle(
                      fontSize: 14,
                      color: primary,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  SizedBox(height: 10),
                  SvgPicture.asset(
                    'assets/start_image_03.svg',
                    semanticsLabel: 'start_image_03',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(height: 15),
                  Text(
                    '친구에게',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '공유도 손쉽게!',
                    style: TextStyle(
                      fontSize: 14,
                      color: primary,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
          SizedBox(height: 60),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/question/1');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 88),
                child: const Text('시작하기'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
