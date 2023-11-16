import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/pages/question_page/questions.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';
import 'package:mediquest/app/ui/player_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  final int idQuestion;
  final bool isAnsweredCorrectly;

  const QuestionCard(
      {super.key, required this.idQuestion, required this.isAnsweredCorrectly});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.find<QuestionController>();

    return Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    questions[focusedIndex][selectedLevel].questionText,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    questions[focusedIndex][selectedLevel].imagepath,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        width: 0,
                        height: 0,
                      );
                    },
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    questions[focusedIndex][selectedLevel].answersList.length,
                    (index) => Option(
                      index: index,
                      text: questions[focusedIndex][selectedLevel]
                          .answersList[index],
                      press: () => controller.checkAns(
                          questions[focusedIndex][selectedLevel], index),
                      isCorrect: (index ==
                          questions[focusedIndex][selectedLevel].correctAnswer -
                              1),
                      key: UniqueKey(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
