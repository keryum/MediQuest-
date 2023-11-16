import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';
import 'package:mediquest/app/ui/pages/question_page/questions.dart';
import 'package:mediquest/app/ui/player_controller.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    required Key key,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: categoryList[focusedIndex].color, width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(context),
        builder: (controller) {
          return Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        categoryList[focusedIndex].color,
                        const Color.fromARGB(255, 0, 0, 0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                          '${questions[focusedIndex][selectedLevel].duration.value.inMinutes}:${(questions[focusedIndex][selectedLevel].duration.value.inSeconds % 60).toString().padLeft(2, '0')}',
                          style: const TextStyle(color: Colors.white)
                          /* "${(questionController.animationController.duration?.inSeconds * 10).round()} sec",
                        style: const TextStyle(color: Colors.white), */
                          )),
                      SvgPicture.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
