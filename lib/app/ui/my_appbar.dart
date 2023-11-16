import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:mediquest/app/ui/player_controller.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/routes/routes.dart';
import 'package:mediquest/my_flutter_app_icons.dart';

final playerController = Get.find<PlayerController>();
bool isInitialPage = true;
bool isTimeRunning = false;
Timer? _lifeRecoveryTimer;
Rx<Duration> timeLeft = const Duration(seconds: 300).obs;

void startLifeRecoveryTimer() {
  const duration = Duration(seconds: 1);
  if (isTimeRunning) {
    return;
  }
  isTimeRunning = true;
  _lifeRecoveryTimer = Timer.periodic(duration, (Timer timer) {
    if (playerController.vidas.value < 3) {
      if (timeLeft.value.inSeconds > 0) {
        timeLeft.value = timeLeft.value - duration;
        savePlayerData(sessionController.user);
      } else {
        playerController.vidas.value++;
        timeLeft.value = const Duration(seconds: 300);
        savePlayerData(sessionController.user);
      }
    }
  });
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isInsideGridView;
  final bool isHomePage;
  const MyAppBar(
      {super.key, this.isInsideGridView = false, this.isHomePage = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // ignore: no_logic_in_create_state
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  void initState() {
    super.initState();
    {
      startLifeRecoveryTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.isHomePage ? Colors.white : Colors.transparent,
      title: Text(
        'MediQuest!',
        style:
            TextStyle(color: widget.isHomePage ? Colors.black : Colors.white),
      ),
      elevation: widget.isHomePage ? 3 : 0,
      leading: () {
        if (widget.isHomePage) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ), // Icono para abrir el Drawer
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        } else if (!widget.isHomePage && widget.isInsideGridView) {
          return IconButton(
            icon: const Icon(
                Icons.arrow_back), // Icono para retroceder en el GridView
            onPressed: () {
              playerController.decrementVidas();
              Navigator.of(context).popUntil((route) {
                return route.settings.name == categoryList[focusedIndex].route;
              });
            },
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.arrow_back,
                color:
                    Colors.white), // Icono para retroceder en otras situaciones
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }
      }(),
      actions: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          const Icon(Icons.favorite, color: Colors.red),
                          Positioned.fill(
                            child: Center(
                              child: Obx(() => Text(
                                    playerController.vidas.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Obx(() => Text(
                            '${timeLeft.value.inMinutes}:${(timeLeft.value.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: widget.isHomePage
                                    ? Colors.black
                                    : Colors.white),
                          ))
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.STORE);
                    },
                    icon: Icon(
                      MyFlutterApp.plus,
                      color: widget.isHomePage
                          ? Colors.green
                          : Colors.lightGreenAccent,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Icon(Icons.monetization_on,
                color: widget.isHomePage ? Colors.amber : Colors.yellowAccent),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Obx(() => Text(
                    playerController.monedas.toString(),
                    style: TextStyle(
                        color: widget.isHomePage ? Colors.black : Colors.white),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
