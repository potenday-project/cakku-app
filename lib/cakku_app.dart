import 'package:cakku_app/question/question_assets_page.dart';
import 'package:cakku_app/question/question_date_page.dart';
import 'package:cakku_app/question/question_description_page.dart';
import 'package:cakku_app/question/question_loading_page.dart';
import 'package:cakku_app/question/question_place_page.dart';
import 'package:flutter/material.dart';

import 'question/question_concept_page.dart';
import 'question/question_name_page.dart';
import 'question/question_purpose_page.dart';
import 'question/question_summary_page.dart';
import 'question/question_time_page.dart';
import 'result_page.dart';
import 'start_page.dart';

class CakkuApp extends StatelessWidget {
  const CakkuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cakku App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 219, 100, 143)),
        useMaterial3: true,
      ),
      initialRoute: '/start',
      routes: {
        '/start': (context) => const StartPage(),
        '/question/1': (context) => QuestionNamePage(),
        '/question/2': (context) => const QuestionPurposePage(),
        '/question/3': (context) => QuestionConceptPage(),
        '/question/4': (context) => const QuestionSummaryPage(),
        '/question/5': (context) => QuestionAssetsPage(),
        '/question/6': (context) => const QuestionDatePage(),
        '/question/7': (context) => const QuestionTimePage(),
        '/question/8': (context) => const QuestionPlacePage(),
        '/question/9': (context) => const QuestionDescriptionPage(),
        '/question/loading': (context) => QuestionLoadingPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}
