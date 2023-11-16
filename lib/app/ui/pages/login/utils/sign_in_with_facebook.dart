import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:mediquest/app/ui/pages/login/login_page.dart';
import 'handle_login_response.dart';

void signInWithFacebook(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.signInWithFacebook();
  Navigator.pop(context);
  handleLoginResponse(context, response);
}
