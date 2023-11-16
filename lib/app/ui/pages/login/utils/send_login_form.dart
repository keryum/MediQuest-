import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:mediquest/app/ui/pages/login/login_page.dart';
import 'package:mediquest/app/ui/pages/login/utils/handle_login_response.dart';
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.signInWithEmailAndPassword();
    router.pop();
    handleLoginResponse(context, response);
  }
}
