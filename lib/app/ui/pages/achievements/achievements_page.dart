import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/pages/achievements/achievement_card.dart';
import 'package:mediquest/app/ui/pages/achievements/achievement_list.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Obx(() => ListView.builder(
                itemCount: achievementList.length,
                itemBuilder: (context, index) {
                  return _buildListItem(context, index);
                },
              )),
        )
      ]),
    );
  }

  Widget _buildListItem(BuildContext context, int i) {
    Achievement achievement = achievementList[i];
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: GestureDetector(
          onTap: () {
            achievement.condition >= achievement.valueCondition
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AchievementCard(achievement: i),
                    ),
                  )
                : ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        achievement.conditionText.value,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
          },
          child: Card(
            color: achievement.condition >= achievement.valueCondition
                ? const Color.fromARGB(255, 141, 168, 203)
                : Colors.white,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Padding(
                    padding: achievement.condition >= achievement.valueCondition
                        ? const EdgeInsets.all(0)
                        : const EdgeInsets.only(left: 20),
                    child: Container(
                      constraints:
                          achievement.condition >= achievement.valueCondition
                              ? const BoxConstraints(maxWidth: 100)
                              : null,
                      height:
                          achievement.condition >= achievement.valueCondition
                              ? 100
                              : 70,
                      child: Image.asset(
                          achievement.condition >= achievement.valueCondition
                              ? achievement.imagePath.value
                              : 'assets/candado.png',
                          color: achievement.condition >=
                                  achievement.valueCondition
                              ? null
                              : Colors.black45),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    achievementList[i].title.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: achievement.condition >= achievement.valueCondition
                          ? const Color.fromARGB(255, 16, 27, 88)
                          : Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
