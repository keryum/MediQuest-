import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/pages/achievements/achievement_list.dart';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AchievementCard extends StatefulWidget {
  final int achievement;

  const AchievementCard({Key? key, required this.achievement})
      : super(key: key);

  @override
  _AchievementCardState createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  bool isDescriptionExpanded = false;
  bool isAdditionalInfoExpanded = false;

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
                              achievementList[widget.achievement]
                                  .imagePath
                                  .value),
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                      achievementList[widget.achievement].imagePath.value),
                ),
                const SizedBox(height: 20),
                Title(
                  color: Colors.indigo,
                  child: Text(
                    achievementList[widget.achievement].title.value,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isDescriptionExpanded = !isDescriptionExpanded;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Información general',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            achievementList[widget.achievement]
                                .description
                                .value,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        crossFadeState: isDescriptionExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: kThemeAnimationDuration,
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAdditionalInfoExpanded =
                                !isAdditionalInfoExpanded;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Fisiopatología',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            achievementList[widget.achievement]
                                .physiopathology
                                .value,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        crossFadeState: isAdditionalInfoExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: kThemeAnimationDuration,
                      ),
                    ],
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
                      Navigator.of(context).pop();
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