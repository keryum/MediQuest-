import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/pages/last_page/last_page.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';
import 'package:mediquest/app/ui/pages/question_page/questions.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/pages/question_page/questions_page.dart';
import 'package:mediquest/app/ui/player_controller.dart';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AnsweredCorrectlyPage extends StatelessWidget {
  const AnsweredCorrectlyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenImagePage(
                          imageProvider: AssetImage(
                            questions[focusedIndex][selectedLevel].imageContent,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    questions[focusedIndex][selectedLevel].imageContent,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Title(
                  color: Colors.indigo,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      questions[focusedIndex][selectedLevel].title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    questions[focusedIndex][selectedLevel].description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (questions[focusedIndex][selectedLevel].idQuestion <
                          questions[focusedIndex].length) {
                        Navigator.of(context).pop();
                        final questionPage = Get.find<QuestionController>();
                        questionPage.restart();
                        selectedLevel++;
                        questionPage.updateTimer();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return QuestionsPage(
                              idQuestion: questions[focusedIndex][selectedLevel]
                                  .idQuestion,
                            );
                          }),
                        );
                      } else if (questions[focusedIndex][selectedLevel]
                              .idQuestion ==
                          questions[focusedIndex].length) {
                        Navigator.of(context).pop();
                        final questionPage = Get.find<QuestionController>();
                        questionPage.stop();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const LastPage();
                          }),
                        );
                      }
                    },
                    child: const Text(
                      'Siguiente nivel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).popUntil((route) {
                        return route.settings.name ==
                            categoryList[focusedIndex].route;
                      });
                    },
                    child: const Text(
                      'Volver',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final ImageProvider imageProvider;

  FullScreenImagePage({Key? key, required this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Column(
          children: [
            Expanded(
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: imageProvider,
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
                itemCount: 1,
                pageController: PageController(),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistologyQuestionsPage(
                    idQuestion:
                        histologyQuestionsList[histologyHighestUnlockedLevel]
                            .idQuestion,
                  ),
                ),
              );
            },
            child: const Text('Siguiente nivel'),
          ), */