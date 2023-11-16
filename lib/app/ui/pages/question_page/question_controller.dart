import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/player_controller.dart';
import 'package:mediquest/app/ui/pages/question_page/questions.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/routes/routes.dart';
import 'package:soundpool/soundpool.dart';

final playerController = Get.find<PlayerController>();

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final BuildContext context;

  QuestionController(this.context);

  // Variables relacionadas con la animación
  late AnimationController animationController;
  late Animation<double> _animation;
  Animation<double> get animation => _animation;

  // Resto de las variables

  final List<Question> _questions = questions[focusedIndex];
  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;
  late int _correctAns;
  int get correctAns => _correctAns;
  late int _selectedAns;
  int get selectedAns => _selectedAns;

  // Resto del código...

  // Método onInit
  @override
  void onInit() {
    animationController = AnimationController(
      duration: questions[focusedIndex][selectedLevel].duration.value,
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    animationController.forward().whenComplete(() {
      playerController.decrementVidas();
      incorrectSound();
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamed(Routes.WRONGANSWER);
      });
    });

    super.onInit();
  }

  bool restarted = false;

  void stop() {
    if (animationController.isAnimating) {
      animationController.stop();
    }
  }

  void restart() {
    if (!animationController.isAnimating) {
      animationController.reset();
      animationController.forward().whenComplete(finish);
      _isAnswered = false;
      update();
    }
  }

  void updateTimer() {
    if (animationController.isAnimating) {
      animationController.stop();
    }
    animationController.duration =
        questions[focusedIndex][selectedLevel].duration.value;
    animationController.reset();

    animationController.forward().whenComplete(() {
      playerController.decrementVidas();
      incorrectSound();
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamed(Routes.WRONGANSWER);
      });
    });
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Question getQuestion(int idQuestion) {
    return _questions.firstWhere(
        (question) =>
            questions[focusedIndex][selectedLevel].idQuestion == idQuestion,
        orElse: () => Question(0, '', '', [], 0, false, '', '', '',
            (seconds: 10) as Rx<Duration>));
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _correctAns = question.correctAnswer - 1;
    _selectedAns = selectedIndex;
    _isAnswered = true;

    if (_correctAns == _selectedAns &&
        question.idQuestion !=
            playerController.highestLevels[focusedIndex].value) {
      correctSound();
    } else if (_correctAns == _selectedAns &&
        question.idQuestion ==
            playerController.highestLevels[focusedIndex].value) {
      correctSound();
      playerController.highestLevels[focusedIndex].value++;
      playerController.incrementMonedas();
    } else {
      /*   incorrectSound(); */
      playerController.decrementVidas();
      incorrectSound();
    }

    // It will stop the counter
    animationController.stop();
    update();
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(const Duration(seconds: 2), () {
      finish();
    });
  }

  void finish() {
    /*  _animationController.reset(); */
    if (_correctAns != _selectedAns || !isAnswered) {
      Navigator.of(context).pushNamed(Routes.WRONGANSWER);
    } else if (isAnswered && _correctAns == _selectedAns) {
      Navigator.of(context).pushNamed(Routes.ANSWEREDCORRECTLYPAGE);
      /* _isAnswered = false; */
      /*  _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease); */

      // Reset the counter

      // Then start it again
      // Once timer is finish go to the next qn
    }
  }

  void correctSound() async {
    if (playerController.isSoundEnabled.value) {
      Soundpool pool = Soundpool(streamType: StreamType.notification);
      int soundId = await rootBundle
          .load("assets/audios/sonido_correcto.m4a")
          .then((ByteData soundData) {
        return pool.load(soundData);
      });
      int streamId = await pool.play(soundId);
    }
  }

  void incorrectSound() async {
    if (playerController.isSoundEnabled.value) {
      Soundpool pool = Soundpool(streamType: StreamType.notification);
      int soundId = await rootBundle
          .load("assets/audios/sonido_incorrecto.wav")
          .then((ByteData soundData) {
        return pool.load(soundData);
      });
      int streamId = await pool.play(soundId);
    }
  }
}
