import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/pages/question_page/question_controller.dart';

class WrongAnswer extends StatefulWidget {
  const WrongAnswer({super.key});

  @override
  State<WrongAnswer> createState() => _WrongAnswerState();
}

class _WrongAnswerState extends State<WrongAnswer> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: const Text('¡Ups, intentalo de nuevo!'),
        icon: const Icon(Icons.heart_broken),
        iconColor: Colors.red,
        actions: <Widget>[
          Center(
            child: Column(children: [
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    if (playerController.vidas.value > 0) {
                      Navigator.of(context).pop();
                      final questionPage = Get.find<QuestionController>();
                      questionPage.restart();
                    } else {
                      Navigator.pop(context);
                      Navigator.of(context).popUntil((route) {
                        return route.settings.name ==
                            categoryList[focusedIndex].route;
                      });
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            icon: const Icon(Icons.heart_broken,
                                color: Colors.red),
                            title: const Text(
                              '¡Ups, no cuentas con suficientes vidas!',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            content: const Text(
                              '¡Compra más en la tienda o espera a que se recarguen!',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              Center(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK',
                                      style: TextStyle(color: Colors.black54)),
                                ),
                              ),
                            ],
                            backgroundColor:
                                Colors.white, // Color de fondo del AlertDialog
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Intentar de nuevo',
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
              ),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).popUntil((route) {
                      return route.settings.name ==
                          categoryList[focusedIndex].route;
                    });
                  },
                  child: const Text('Volver',
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
              ),
            ]),
          )
        ]);
  }
}
