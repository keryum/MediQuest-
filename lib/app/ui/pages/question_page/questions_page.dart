import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/pages/question_page/progress_bar.dart';
import 'package:mediquest/app/ui/pages/question_page/question_card.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';

class QuestionsPage extends StatefulWidget {
  final int idQuestion;
  void controlTimer(bool restart) {
    final questionController = Get.find<QuestionController>();
    if (restart) {
      questionController.restart();
    } else {
      questionController.stop();
    }
  }

  const QuestionsPage({super.key, required this.idQuestion});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  bool isAnswerCorrect = true;
  bool isInsideGridview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: categoryList[focusedIndex].pageColor,
      appBar: const MyAppBar(isInsideGridView: true, isHomePage: false),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ProgressBar(key: UniqueKey()),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, idQuestion) => QuestionCard(
                      idQuestion: widget.idQuestion,
                      isAnsweredCorrectly: isAnswerCorrect, // Pasa el valor
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
