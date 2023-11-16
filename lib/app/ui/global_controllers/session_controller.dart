import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:mediquest/app/domain/repositories/account_repository.dart';
import 'package:mediquest/app/domain/repositories/authentication_repository.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/pages/login/utils/handle_login_response.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;
  static String? facebookId;
  get _facebookId => facebookId;
  static String? facebookPicture;
  get _facebookPicture => facebookPicture;

  final AuthenticationRepository _auth = Get.i.find();
  final AccountRepository _account = Get.i.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<User?> updateDisplayName(String value) async {
    final user = await _account.updateDisplayName(value);
    if (user != null) {
      _user = user;
      notify();
    }
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
  }
}

final sessionProvider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);

Future<void> createFirestoreDocumentForUser(User? user) async {
  if (user != null) {
    final userDoc =
        FirebaseFirestore.instance.collection('Usuarios').doc(user.uid);
    final highestLevelsData = {
      'histologyHighestLevel': playerController.highestLevels[0].value,
      'physiologyHighestLevel': playerController.highestLevels[1].value,
      'biochemistryHighestLevel': playerController.highestLevels[2].value,
    };

    final userData = {
      'email': user.email,
      'displayName': user.displayName,
      'vidas': playerController.vidas.value,
      'monedas': playerController.monedas.value,
      'anunciosVistos': playerController.adsSeen.value,
      'highestLevels': highestLevelsData,
      'timeLeft': timeLeft.value.inSeconds,
      'facebookId': sessionController._facebookId,
      'profilePictureUrl': sessionController._facebookPicture,
      // Agrega más campos según tus necesidades
    };

    await userDoc.set(userData);
  }
}

Future<void> savePlayerData(user) async {
  if (user != null) {
    final highestLevelsData = {
      'histologyHighestLevel': playerController.highestLevels[0].value,
      'physiologyHighestLevel': playerController.highestLevels[1].value,
      'biochemistryHighestLevel': playerController.highestLevels[2].value,
    };

    await FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(sessionController.user?.uid)
        .update({
      'email': sessionController.user?.email,
      'displayName': sessionController.user?.displayName,
      'vidas': playerController.vidas.value,
      'monedas': playerController.monedas.value,
      'anunciosVistos': playerController.adsSeen.value,
      'highestLevels': highestLevelsData,
      'timeLeft': timeLeft.value.inSeconds,
      'profilePictureUrl': sessionController._user?.photoURL,
    });
  }
}

Future<void> loadPlayerData(User? user) async {
  if (user != null) {
    DocumentSnapshot userDocument = await FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(user.uid)
        .get();

    if (userDocument.exists) {
      final userData = userDocument.data() as Map<String, dynamic>;

      // Actualiza las variables en tu aplicación con los datos cargados
      playerController.vidas.value = userData['vidas'];
      playerController.monedas.value = userData['monedas'];
      final timeLeftInSeconds =
          userData['timeLeft'] ?? 300; // Valor por defecto: 300 segundos
      timeLeft.value = Duration(seconds: timeLeftInSeconds);
      final highestLevelsMap =
          userData['highestLevels'] as Map<String, dynamic>;
      playerController.highestLevels[0].value =
          highestLevelsMap['histologyHighestLevel'];
      playerController.highestLevels[1].value =
          highestLevelsMap['physiologyHighestLevel'];
      playerController.highestLevels[2].value =
          highestLevelsMap['biochemistryHighestLevel'];
    }
  }
}
