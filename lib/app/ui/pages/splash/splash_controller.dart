import 'package:mediquest/app/domain/repositories/authentication_repository.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/pages/login/utils/handle_login_response.dart';
import 'package:mediquest/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;
  final AuthenticationRepository _authRepository = Get.i.find();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
      loadPlayerData(sessionController.user);
      playerController.onInit();
    } else {
      _routeName = Routes.LOGINPAGE;
    }
    notify();
  }
}
