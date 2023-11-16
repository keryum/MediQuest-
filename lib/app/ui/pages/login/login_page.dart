import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:mediquest/app/ui/pages/login/widgets/login_form.dart';
import 'controller/login_controller.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: OrientationBuilder(
            builder: (_, orientation) {
              if (orientation == Orientation.portrait) {
                return LoginForm();
              }
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: LoginForm(),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
