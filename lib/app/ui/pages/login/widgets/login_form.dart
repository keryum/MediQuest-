import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/global_widgets/custom_input_field.dart';
import 'package:mediquest/app/ui/global_widgets/rounded_button.dart';
import 'package:mediquest/app/ui/pages/login/login_page.dart';
import 'package:mediquest/app/ui/pages/login/utils/send_login_form.dart';
import 'package:mediquest/app/ui/pages/login/widgets/social_buttons.dart';
import 'package:mediquest/app/ui/routes/routes.dart';
import 'package:mediquest/app/utils/email_validator.dart';
import 'package:flutter_meedu/screen_utils.dart';
import 'package:flutter_meedu/router.dart' as router;

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final _controller = loginProvider.read;

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size;
    // MediaQuery.of(context).padding.bottom;
    final padding = context.mediaQueryPadding;
    final height = context.height - padding.top - padding.bottom;

    return ListView(
      children: [
        SizedBox(
          height: height,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _controller.formKey,
                child: Align(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 360,
                    ),
                    child: Column(
                      mainAxisAlignment: context.isTablet
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.asset(
                            'assets/mediquest_logo.png',
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          label: "Email",
                          onChanged: _controller.onEmailChanged,
                          inputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (isValidEmail(text!)) {
                              return null;
                            }
                            return "Email inválido";
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          label: "Password",
                          onChanged: _controller.onPasswordChanged,
                          isPassword: true,
                          validator: (text) {
                            if (text!.trim().length >= 6) {
                              return null;
                            }
                            return "Contraseña inválida";
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Semantics(
                              label: 'Olvidaste tu contraseña?',
                              child: TextButton(
                                onPressed: () =>
                                    router.pushNamed(Routes.RESET_PASSWORD),
                                child: const Text("¿Olvidaste  tu contraseña?"),
                              ),
                            ),
                            const SizedBox(width: double.minPositive),
                            Semantics(
                              label: 'Iniciar sesión',
                              child: RoundedButton(
                                text: "Iniciar sesión",
                                onPressed: () => sendLoginForm(context),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "¿No tienes una cuenta?",
                            ),
                            Semantics(
                              label: 'registrarse',
                              child: TextButton(
                                onPressed: () => router.pushNamed(
                                  Routes.REGISTER,
                                ),
                                child: const Text(
                                  "¡Registrate!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text("O inicia sesión con"),
                        const SizedBox(height: 5),
                        Semantics(
                            label: 'Inicia sesión con facebook',
                            child: const SocialButtons()),
                        if (!context.isTablet) const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
