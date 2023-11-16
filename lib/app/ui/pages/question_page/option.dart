import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
    required this.isCorrect,
  });

  final String text;
  final int index;
  final VoidCallback press;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(builder: (qnController) {
      Color getTheRightColor() {
        if (qnController.isAnswered) {
          if (index == qnController.selectedAns &&
              qnController.selectedAns == qnController.correctAns) {
            return const Color(0xFF6AC259);
          } else if (index == qnController.selectedAns &&
              qnController.selectedAns != qnController.correctAns) {
            return const Color(0xFFE92E30);
          }
        }
        return const Color(0xFFC1C1C1);
      }

      IconData getTheRightIcon() {
        return getTheRightColor() == const Color(0xFFE92E30)
            ? Icons.close
            : Icons.done;
      }

      return InkWell(
        onTap: qnController.isAnswered ? null : press,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: getTheRightColor()),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        "${index + 1}. $text",
                        style:
                            TextStyle(color: getTheRightColor(), fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: getTheRightColor() == const Color(0xFFC1C1C1)
                      ? Colors.transparent
                      : getTheRightColor(),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: getTheRightColor()),
                ),
                child: getTheRightColor() == const Color(0xFFC1C1C1)
                    ? null
                    : Icon(getTheRightIcon(), size: 16),
              )
            ],
          ),
        ),
      );
    });
  }
}
