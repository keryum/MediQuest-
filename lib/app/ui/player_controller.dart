import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

int selectedLevel = 0;
final sessionController = sessionProvider.read;

final levelController = Get.find<MyAppBar>();

class PlayerController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _users;

  RxInt vidas = 3.obs;
  RxInt monedas = 0.obs;
  RxInt adsSeen = 0.obs;
  RxBool isSoundEnabled = true.obs;
  RxList<RxInt> highestLevels = [(1.obs), (1.obs), (1.obs)].obs;

  StreamSubscription<DocumentSnapshot>? _subscription;
  @override
  void onInit() async {
    super.onInit();

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No hay conexión a Internet, manejar según sea necesario.
      return;
    }

    final user = sessionController.user;
    if (user != null) {
      final userDoc = _firestore.collection('Usuarios').doc(user.uid);
      _subscription = userDoc.snapshots().listen((snapshot) {
        try {
          final userData = snapshot.data();

          if (userData != null) {
            vidas.value = userData['vidas'];
            monedas.value = userData['monedas'];
            adsSeen.value = userData['anunciosVistos'];
            final timeLeftInSeconds = userData['timeLeft'] ?? 300;
            timeLeft.value = Duration(seconds: timeLeftInSeconds);

            final highestLevelsMap =
                userData['highestLevels'] as Map<String, dynamic>;
            highestLevels[0].value = highestLevelsMap['histologyHighestLevel'];
            highestLevels[1].value = highestLevelsMap['physiologyHighestLevel'];
            highestLevels[2].value =
                highestLevelsMap['biochemistryHighestLevel'];
          } else {
            // Manejar el caso en el que no hay datos en Firestore.
          }
        } catch (error) {
          print('Error en la suscripción al stream: $error');
          // Manejar el error de alguna manera, por ejemplo, mostrar un mensaje al usuario.
        }
      });
    }
  }

  String histologyHighestLevelKey = 'histologyHighestLevel';
  String physiologyHighestLevelKey = 'physiologyHighestLevel';
  String biochemistryHighestLevelKey = 'biochemistryHighestLevel';

  int get vidasValue => vidas.value;
  int get monedasValue => monedas.value;
  int get anunciosVistos => adsSeen.value;
  bool get isSoundEnabledValue => isSoundEnabled.value;
  List<int> get highestLevelsValue =>
      highestLevels.map((level) => level.value).toList();

  static const String vidasKey = 'vidas';
  static const String monedasKey = 'monedas';
  static const String adsSeenKey = 'anunciosVistos';
  static const String soundKey = 'sound';
  static const String timeLeftKey = 'timeLeft';

  /*  Future<void> loadPlayerDataLocal() async {
    final prefs = await SharedPreferences.getInstance();
    vidas.value = prefs.getInt(vidasKey) ?? 3;
    monedas.value = prefs.getInt(monedasKey) ?? 0;
    isSoundEnabled.value = prefs.getBool(soundKey) ?? true;
    timeLeft.value = Duration(seconds: prefs.getInt(timeLeftKey) ?? 300);
    highestLevels[0].value = prefs.getInt(histologyHighestLevelKey) ?? 1;
    highestLevels[1].value = prefs.getInt(physiologyHighestLevelKey) ?? 1;
    highestLevels[2].value = prefs.getInt(biochemistryHighestLevelKey) ?? 1;
  } */

  // Método para guardar los valores en SharedPreferences
  Future<void> savePlayerDataLocal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(vidasKey, vidas.value);
    prefs.setInt(monedasKey, monedas.value);
    prefs.setInt(adsSeenKey, adsSeen.value);
    prefs.setBool(soundKey, isSoundEnabled.value);
    prefs.setInt(timeLeftKey, timeLeft.value.inSeconds);
    prefs.setInt(histologyHighestLevelKey, highestLevels[0].value);
    prefs.setInt(physiologyHighestLevelKey, highestLevels[1].value);
    prefs.setInt(biochemistryHighestLevelKey, highestLevels[2].value);
  }

  void incrementVidas() {
    vidas.value++;
    savePlayerData(sessionController.user);
    savePlayerDataLocal();
  }

  void decrementVidas() {
    if (vidas.value > 0) {
      vidas.value--;
      savePlayerData(sessionController.user);
      savePlayerDataLocal();
    }
  }

  void incrementMonedas() {
    monedas.value += 10;
    savePlayerData(sessionController.user);
    savePlayerDataLocal();
  }

  void incrementAdsSeen() {
    adsSeen.value++;
    savePlayerData(sessionController.user);
    savePlayerDataLocal();
  }

  @override
  void onClose() {
    isTimeRunning = false;
    _subscription?.cancel();
    savePlayerData(sessionController.user);
    savePlayerDataLocal();
    super.onClose();
  }

  void initUserState() {
    // Inicializar estados y variables para el nuevo usuario
    vidas.value = 3;
    monedas.value = 0;
    adsSeen.value = 0;
    isSoundEnabled.value = true;
  }

  void clearUserState() {
    playerController.vidas.value = 0;
    playerController.monedas.value = 0;
    playerController.adsSeen.value = 0;
    highestLevels[0].value = 0;
    highestLevels[1].value = 0;
    highestLevels[2].value = 0;
  }

  void disconnectFirestoreStream() {
    _subscription?.cancel();
  }
}
