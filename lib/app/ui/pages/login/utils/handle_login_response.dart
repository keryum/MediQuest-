import 'package:flutter/material.dart';
import 'package:mediquest/app/domain/responses/sign_in_response.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:mediquest/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:mediquest/app/ui/my_appbar.dart';
import 'package:mediquest/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

final sessionController = sessionProvider.read;
final user = sessionController.user;

void handleLoginResponse(BuildContext context, SignInResponse response) {
  if (response.error != null) {
    if (response.error != SignInError.cancelled) {
      String errorMessage = "";
      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = "network Request Failed";
          break;
        case SignInError.userDisabled:
          errorMessage = "user Disabled";
          break;
        case SignInError.userNotFound:
          errorMessage = "user Not Found";
          break;
        case SignInError.wrongPassword:
          errorMessage = "wrong Password";
          break;
        case SignInError.tooManyRequests:
          errorMessage = "too Many Requests";
          break;

        case SignInError.invalidCredential:
          errorMessage = "invalid Credential";
          break;

        case SignInError.accountExistsWithDifferentCredential:
          errorMessage = response.providerId ?? "Invalid auth method";
          break;

        case SignInError.unknown:
        default:
          errorMessage = "unknown error";
          break;
      }

      Dialogs.alert(
        context,
        title: "ERROR",
        content: errorMessage,
      );
    }
  } else {
    router.pushReplacementNamed(
      Routes.HOME,
    );
    loadPlayerData(sessionController.user);
    playerController.onInit();
  }
}
