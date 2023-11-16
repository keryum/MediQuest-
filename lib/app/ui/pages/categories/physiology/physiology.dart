import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/pages/question_page/questions.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/pages/question_page/questions_page.dart';
import 'package:mediquest/app/ui/player_controller.dart';

final playerController = Get.find<PlayerController>();

class PhysiologyPage extends StatefulWidget {
  PhysiologyPage({super.key});

  final playerController = Get.find<PlayerController>();

  @override
  State<PhysiologyPage> createState() => _PhysiologyPageState();
}

class _PhysiologyPageState extends State<PhysiologyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: categoryList[focusedIndex].pageColor,
      appBar: const MyAppBar(
        isHomePage: false,
        isInsideGridView: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: questions[focusedIndex].length,
          itemBuilder: (context, index) {
            return Obx(() {
              bool isUnlocked = physiologyQuestions[index].idQuestion <=
                  playerController.highestLevels[1].value;

              return GestureDetector(
                onTap: () {
                  if (isUnlocked && playerController.vidas.value > 0) {
                    selectedLevel = index;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsPage(
                          idQuestion:
                              physiologyQuestions[selectedLevel].idQuestion,
                        ),
                      ),
                    );
                  } else if (isUnlocked && playerController.vidas.value == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          '¡Ups, no cuentas con suficientes vidas, compra más en la tienda o espera a que se recarguen!',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          '¡Completa los niveles anteriores para entrar a este nivel!',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isUnlocked
                            ? categoryList[focusedIndex].color
                            : Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        physiologyQuestions[index].idQuestion.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    // Imagen superpuesta (ajusta la ruta de la imagen según tus necesidades)
                    if (!isUnlocked)
                      Center(
                        child: Image.asset(
                          'assets/candado.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
