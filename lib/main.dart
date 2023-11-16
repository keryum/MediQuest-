import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mediquest/app/inject_dependencies.dart';
import 'package:mediquest/app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/player_controller.dart';
import 'firebase_options.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15, // Intervalo mínimo en minutos
      stopOnTerminate: false,
      enableHeadless: true,
      startOnBoot: true,
    ),
    (String taskId) async {
      // Lógica de actualización del temporizador
      // Aumentar vida y reiniciar el temporizador
      startLifeRecoveryTimer();
      // Función para iniciar el temporizador
    },
  );
  MobileAds.instance.initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await injectDependencies();
  Get.put(PlayerController());
  runApp(const MyApp());
}
